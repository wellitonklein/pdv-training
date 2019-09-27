unit Venda_Factory.Controller;

interface

uses
  Venda_Factory.Controller.Interf, Venda.Controller.Interf;

type
  TVendaFactoryController = class(TInterfacedObject, IVendaFactoryController)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IVendaFactoryController;
    function Venda: IVendaController;
  end;

implementation

uses
  Venda.Controller;

{ TVendaFactoryController }

constructor TVendaFactoryController.Create;
begin

end;

destructor TVendaFactoryController.Destroy;
begin

  inherited;
end;

class function TVendaFactoryController.New: IVendaFactoryController;
begin
  Result := Self.Create;
end;

function TVendaFactoryController.Venda: IVendaController;
begin
  Result := TVendaController.New;
end;

end.
