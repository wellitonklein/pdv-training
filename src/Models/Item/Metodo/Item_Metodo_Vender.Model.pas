unit Item_Metodo_Vender.Model;

interface

uses
  Item.Model.Interf, Venda.Model.Inerf, Entidade_Produto.Model,
  System.Generics.Collections;

type
  TItemMetodoVenderModel = class(TInterfacedObject, IItemMetodoVenderModel)
  private
    ListaProduto: TObjectList<TPRODUTO>;
    FParent: IItemModel;
    FVenda: IVendaModel;
    FItem: SmallInt;
    FQuantidade: Currency;
    procedure Gravar;
    procedure Fiscal;
    procedure Observer;
  public
    constructor Create(Parent: IItemModel; Venda: IVendaModel);
    destructor Destroy; override;
    class function New(Parent: IItemModel; Venda: IVendaModel): IItemMetodoVenderModel;
    function SetItem(Value: SmallInt): IItemMetodoVenderModel;
    function SetQuantidade(Value: Currency): IItemMetodoVenderModel;
    function &End: IItemMetodoModel;
  end;

implementation

uses
  Item_State_Factory.Model, PDVUpdates.Model,
  System.SysUtils, PDVUpdates_Type.Controller;

{ TItemMetodoVenderModel }

function TItemMetodoVenderModel.&End: IItemMetodoModel;
begin
  Result := FParent.Metodo;

  Gravar;
  Fiscal;
  Observer;

  FParent.SetState(TItemStateFactoryModel.New.Vendido);
end;

procedure TItemMetodoVenderModel.Fiscal;
begin
  FVenda.ModalidadeFiscal.Proxy.Produto
    .AddProduto
      .Codigo(FParent.Produto.Entidade.CODIGO)
      .Descricao(FParent.Produto.Entidade.DESCRICAO)
      .cEAN(FParent.Produto.Entidade.CODIGO)
      .Qtde(FQuantidade)
      .vUnit(FParent.Produto.Entidade.PRECO)
      .NCM(FParent.Produto.Entidade.NCM)
      .Aliquota(FParent.Produto.Entidade.ALIQUOTA)
      .ST(False)
      .CEST('')
      .UND('UND')
      .CFOP('5012')
      .&End
    .EndProduto;
end;

procedure TItemMetodoVenderModel.Gravar;
begin
  ListaProduto := FParent.Produto.DAO.FindWhere('CODIGO = ' + QuotedStr(IntToStr(FItem)));
  if (ListaProduto.Count <= 0) then
    raise Exception.Create('Produto não localizado');
  FParent.Entidade(TPDVUpdatesModel.New.Entidade.VendaItens);
  FParent.Produto.Entidade(ListaProduto[0]);
  FParent.Entidade.PRODUTO := ListaProduto[0].GUUID;
  FParent.Entidade.VENDA := FVenda.Entidade.GUUID;
  FParent.Entidade.QUANTIDADE := FQuantidade;
  FParent.Entidade.PRECO := ListaProduto[0].PRECO;
  FParent.DAO.Insert(FParent.Entidade);
end;

constructor TItemMetodoVenderModel.Create(Parent: IItemModel; Venda: IVendaModel);
begin
  FParent := Parent;
  FVenda  := Venda;
end;

destructor TItemMetodoVenderModel.Destroy;
begin

  inherited;
end;

class function TItemMetodoVenderModel.New(Parent: IItemModel; Venda: IVendaModel): IItemMetodoVenderModel;
begin
  Result := Self.Create(Parent, Venda);
end;

procedure TItemMetodoVenderModel.Observer;
var
  RI: TRecordItem;
begin
  RI.Descricao  := ListaProduto[0].DESCRICAO;
  RI.Quantidade := FQuantidade;
  RI.ValorUnitario := ListaProduto[0].PRECO;
  RI.ValorTotal := (FQuantidade * ListaProduto[0].PRECO);
  FVenda.Observers.Itens.Notify(RI);
end;

function TItemMetodoVenderModel.SetItem(
  Value: SmallInt): IItemMetodoVenderModel;
begin
  Result := Self;
  FItem := Value;
end;

function TItemMetodoVenderModel.SetQuantidade(
  Value: Currency): IItemMetodoVenderModel;
begin
  Result := Self;
  FQuantidade := Value;
end;

end.
