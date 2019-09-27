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
  Item_State_Factory.Model;

{ TItemMetodoVenderModel }

function TItemMetodoVenderModel.&End: IItemMetodoModel;
begin
  Result := FParent.Metodo;
  { TODO -oWelliton -cItem : Implementar método de Vender Item }
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
