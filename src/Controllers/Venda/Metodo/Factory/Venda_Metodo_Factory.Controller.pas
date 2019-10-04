unit Venda_Metodo_Factory.Controller;

interface

uses
  Venda_Metodo_Factory.Controller.Interf, Venda.Controller.Interf;

type
  TVendaMetodoFactoryController = class(TInterfacedObject, IVendaMetodoFactoryController)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IVendaMetodoFactoryController;
    function Item(Parent: IVendaController): IVendaMetodoItemController;
  end;

implementation

uses
  Venda_Metodo_Item.Controller;

{ TVendaMetodoFactoryController }

constructor TVendaMetodoFactoryController.Create;
begin

end;

destructor TVendaMetodoFactoryController.Destroy;
begin

  inherited;
end;

function TVendaMetodoFactoryController.Item(Parent: IVendaController): IVendaMetodoItemController;
begin
  Result := TVendaMetodoItemController.New(Parent);
end;

class function TVendaMetodoFactoryController.New: IVendaMetodoFactoryController;
begin
  Result := Self.Create;
end;

end.
