unit Item_Metodo_Vender.Model;

interface

uses
  Item.Model.Interf;

type
  TItemMetodoVenderModel = class(TInterfacedObject, IItemMetodoVenderModel)
  private
    FParent: IItemModel;
    FItem: SmallInt;
  public
    constructor Create(Parent: IItemModel);
    destructor Destroy; override;
    class function New(Parent: IItemModel): IItemMetodoVenderModel;
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
  FParent.Entidade.PRECO := ListaProduto[0].PRECO;
  FParent.DAO.Insert(FParent.Entidade);

  FParent.SetState(TItemStateFactoryModel.New.Vendido);
end;

constructor TItemMetodoVenderModel.Create(Parent: IItemModel);
begin
  FParent := Parent;
end;

destructor TItemMetodoVenderModel.Destroy;
begin

  inherited;
end;

class function TItemMetodoVenderModel.New(Parent: IItemModel): IItemMetodoVenderModel;
begin
  Result := Self.Create(Parent);
end;

function TItemMetodoVenderModel.SetItem(
  Value: SmallInt): IItemMetodoVenderModel;
begin
  Result := Self;
  FItem := Value;
end;

end.
