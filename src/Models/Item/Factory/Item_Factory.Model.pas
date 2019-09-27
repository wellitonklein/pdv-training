unit Item_Factory.Model;

interface

uses
  Item_Factory.Model.Interf,
  Item.Model.Interf;

type
  TItemFactoryModel = class(TInterfacedObject, IItemFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IItemFactoryModel;
    function Item: IItemModel;
    function Iterator(Parent: IItemModel): IItemIteratorModel;
  end;

implementation

uses
  Item.Model, Item_Iterator.Model;

{ TItemFactoryModel }

constructor TItemFactoryModel.Create;
begin

end;

destructor TItemFactoryModel.Destroy;
begin

  inherited;
end;

function TItemFactoryModel.Item: IItemModel;
begin
  Result := TItemModel.New;
end;

function TItemFactoryModel.Iterator(Parent: IItemModel): IItemIteratorModel;
begin
  Result := TItemIteratorModel.New(Parent);
end;

class function TItemFactoryModel.New: IItemFactoryModel;
begin
  Result := Self.Create;
end;

end.
