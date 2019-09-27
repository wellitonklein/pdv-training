unit Item_Metodo_Desconto.Model;

interface

uses
  Item.Model.Interf;

type
  TItemMetodoDescontoModel = class(TInterfacedObject, IItemMetodoDescontoModel)
  private
    FParent: IItemModel;
    FItem: SmallInt;
    FValor: Currency;
    FPercentual: Currency;
  public
    constructor Create(Parent: IItemModel);
    destructor Destroy; override;
    class function New(Parent: IItemModel): IItemMetodoDescontoModel;
    function SetItem(Value: SmallInt): IItemMetodoDescontoModel;
    function SetValor(Value: Currency): IItemMetodoDescontoModel;
    function SetPercentual(Value: Currency): IItemMetodoDescontoModel;
    function &End: IItemMetodoModel;
  end;

implementation

uses
  Item_State_Factory.Model;

{ TItemMetodoDescontoModel }

function TItemMetodoDescontoModel.&End: IItemMetodoModel;
begin
  Result := FParent.Metodo;
  { TODO -oWelliton -cItem : Implementar método de Desconto Item }
  FParent.SetState(TItemStateFactoryModel.New.Ativo);
end;

constructor TItemMetodoDescontoModel.Create(Parent: IItemModel);
begin
  FParent := Parent;
end;

destructor TItemMetodoDescontoModel.Destroy;
begin

  inherited;
end;

class function TItemMetodoDescontoModel.New(Parent: IItemModel): IItemMetodoDescontoModel;
begin
  Result := Self.Create(Parent);
end;

function TItemMetodoDescontoModel.SetItem(
  Value: SmallInt): IItemMetodoDescontoModel;
begin
  Result := Self;
  FItem := Value;
end;

function TItemMetodoDescontoModel.SetPercentual(
  Value: Currency): IItemMetodoDescontoModel;
begin
  Result := Self;
  FPercentual := Value;
end;

function TItemMetodoDescontoModel.SetValor(
  Value: Currency): IItemMetodoDescontoModel;
begin
  Result := Self;
  FValor := Value;
end;

end.
