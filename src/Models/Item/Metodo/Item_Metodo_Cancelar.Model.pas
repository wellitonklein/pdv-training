unit Item_Metodo_Cancelar.Model;

interface

uses
  Item.Model.Interf;

type
  TItemMetodoCancelarModel = class(TInterfacedObject, IItemMetodoCancelarModel)
  private
    FParent: IItemModel;
    FItem: SmallInt;
  public
    constructor Create(Parent: IItemModel);
    destructor Destroy; override;
    class function New(Parent: IItemModel): IItemMetodoCancelarModel;
    function SetItem(Value: SmallInt): IItemMetodoCancelarModel;
    function &End: IItemMetodoModel;
  end;

implementation

uses
  Item_State_Factory.Model;

{ TItemMetodoCancelarModel }

function TItemMetodoCancelarModel.&End: IItemMetodoModel;
begin
  Result := FParent.Metodo;
  { TODO -oWelliton -cItem : Implementar método de Cancelar Item }
  FParent.SetState(TItemStateFactoryModel.New.Ativo);
end;

constructor TItemMetodoCancelarModel.Create(Parent: IItemModel);
begin
  FParent := Parent;
end;

destructor TItemMetodoCancelarModel.Destroy;
begin

  inherited;
end;

class function TItemMetodoCancelarModel.New(Parent: IItemModel): IItemMetodoCancelarModel;
begin
  Result := Self.Create(Parent);
end;

function TItemMetodoCancelarModel.SetItem(
  Value: SmallInt): IItemMetodoCancelarModel;
begin
  Result := Self;
  FItem := Value;
end;

end.
