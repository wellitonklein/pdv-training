unit Item_Metodo_Vender.Model;

interface

uses
  Item.Model.Interf, Venda.Model.Inerf;

type
  TItemMetodoVenderModel = class(TInterfacedObject, IItemMetodoVenderModel)
  private
    FParent: IItemModel;
    FVenda: IVendaModel;
    FItem: SmallInt;
  public
    constructor Create(Parent: IItemModel; Venda: IVendaModel);
    destructor Destroy; override;
    class function New(Parent: IItemModel; Venda: IVendaModel): IItemMetodoVenderModel;
    function SetItem(Value: SmallInt): IItemMetodoVenderModel;
    function &End: IItemMetodoModel;
  end;

implementation

uses
  Item_State_Factory.Model, System.Generics.Collections, Entidade_Produto.Model,
  System.SysUtils, PDVUpdates.Model;

{ TItemMetodoVenderModel }

function TItemMetodoVenderModel.&End: IItemMetodoModel;
var
  ListaProduto: TObjectList<TPRODUTO>;
begin
  Result := FParent.Metodo;

  ListaProduto := FParent.Produto.DAO.FindWhere(
    'CODIGO = ' + QuotedStr(IntToStr(FItem))
  );

  if (ListaProduto.Count <= 0) then
    raise Exception.Create('Produto não localizado');

  FParent.Entidade(TPDVUpdatesModel.New.Entidade.VendaItens);
  FParent.Produto.Entidade(ListaProduto[0]);
  FParent.Entidade.PRODUTO := ListaProduto[0].GUUID;
  FParent.Entidade.VENDA   := FVenda.Entidade.GUUID;
  FParent.Entidade.PRECO := ListaProduto[0].PRECO;
  FParent.DAO.Insert(FParent.Entidade);

  FParent.SetState(TItemStateFactoryModel.New.Vendido);
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

function TItemMetodoVenderModel.SetItem(
  Value: SmallInt): IItemMetodoVenderModel;
begin
  Result := Self;
  FItem := Value;
end;

end.
