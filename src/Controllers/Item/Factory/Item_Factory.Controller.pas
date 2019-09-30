unit Item_Factory.Controller;

interface

uses
  Item_Factory.Controller.Interf, Item.Controller.Interf,
  Venda.Controller.Interf;

type
  TItemFactoryController = class(TInterfacedObject, IItemFactoryController)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IItemFactoryController;
    function Item(Venda: IVendaController): IItemController;
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

function TItemFactoryController.Item(Venda: IVendaController): IItemController;
begin
  Result := TItemController.New(Venda);
end;

class function TItemFactoryController.New: IItemFactoryController;
begin
  Result := Self.Create;
end;

end.
