unit Item_Iterator.Model;

interface

uses
  Item.Model.Interf,
  System.Generics.Collections;

type
  TItemIteratorModel = class(TInterfacedObject, IItemIteratorModel)
  private
    FParent: IItemModel;
    FLista: TList<IItemModel>;
    FCount: SmallInt;
  public
    constructor Create(Parent: IItemModel);
    destructor Destroy; override;
    class function New(Parent: IItemModel): IItemIteratorModel;
    function hasNext: Boolean;
    function Next: IItemModel;
    function Add(Value: IItemModel): IItemIteratorModel;
    function &End: IItemModel;
  end;

implementation

uses
  System.SysUtils;

{ TItemIteratorModel }

function TItemIteratorModel.Add(Value: IItemModel): IItemIteratorModel;
begin
  Result := Self;
  FLista.Add(Value);
end;

function TItemIteratorModel.&End: IItemModel;
begin
  Result := FParent;
end;

constructor TItemIteratorModel.Create(Parent: IItemModel);
begin
  FParent := Parent;
  FLista  := TList<IItemModel>.Create;
end;

destructor TItemIteratorModel.Destroy;
begin
  FreeAndNil(FLista);
  inherited;
end;

function TItemIteratorModel.hasNext: Boolean;
begin
  Result := not (FCount = FLista.Count);
end;

class function TItemIteratorModel.New(Parent: IItemModel): IItemIteratorModel;
begin
  Result := Self.Create(Parent);
end;

function TItemIteratorModel.Next: IItemModel;
begin
  Result := FLista[FCount];
  Inc(FCount);
end;

end.
