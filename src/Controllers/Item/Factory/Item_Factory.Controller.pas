unit Item_Factory.Controller;

interface

uses
  Item_Factory.Controller.Interf, Item.Controller.Interf;

type
  TItemFactoryController = class(TInterfacedObject, IItemFactoryController)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IItemFactoryController;
    function Item: IItemController;
  end;

implementation

uses
  Item.Controller;

{ TItemFactoryController }

constructor TItemFactoryController.Create;
begin

end;

destructor TItemFactoryController.Destroy;
begin

  inherited;
end;

function TItemFactoryController.Item: IItemController;
begin
  Result := TItemController.New;
end;

class function TItemFactoryController.New: IItemFactoryController;
begin
  Result := Self.Create;
end;

end.
