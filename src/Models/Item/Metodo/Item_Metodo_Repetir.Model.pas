unit Item_Metodo_Repetir.Model;

interface

uses
  Item.Model.Interf;

type
  TItemMetodoRepetirModel = class(TInterfacedObject, IItemMetodoRepetirModel)
  private
    FParent: IItemModel;
    FItem: SmallInt;
  public
    constructor Create(Parent: IItemModel);
    destructor Destroy; override;
    class function New(Parent: IItemModel): IItemMetodoRepetirModel;
    function SetItem(Value: SmallInt): IItemMetodoRepetirModel;
    function &End: IItemMetodoModel;
  end;

implementation

{ TItemMetodoRepetirModel }

function TItemMetodoRepetirModel.&End: IItemMetodoModel;
begin
  Result := FParent.Metodo;
  { TODO -oWelliton -cItem : Implementar método de Repetir Item }
end;

constructor TItemMetodoRepetirModel.Create(Parent: IItemModel);
begin
  FParent := Parent;
end;

destructor TItemMetodoRepetirModel.Destroy;
begin

  inherited;
end;

class function TItemMetodoRepetirModel.New(Parent: IItemModel): IItemMetodoRepetirModel;
begin
  Result := Self.Create(Parent);
end;

function TItemMetodoRepetirModel.SetItem(
  Value: SmallInt): IItemMetodoRepetirModel;
begin
  Result := Self;
  FItem := Value;
end;

end.
