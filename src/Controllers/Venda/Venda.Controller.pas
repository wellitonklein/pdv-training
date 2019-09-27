unit Venda.Controller;

interface

uses
  Venda.Controller.Interf;

type
  TVendaController = class(TInterfacedObject, IVendaController)
  private
    FMetodo: IVendaMetodoController;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IVendaController;
    function Metodo: IVendaMetodoController;
  end;

implementation

uses
  Venda_Metodo.Controller;

{ TVendaController }

constructor TVendaController.Create;
begin
  FMetodo := TVendaMetodoController.New(Self);
end;

destructor TVendaController.Destroy;
begin

  inherited;
end;

function TVendaController.Metodo: IVendaMetodoController;
begin
  Result := FMetodo;
end;

class function TVendaController.New: IVendaController;
begin
  Result := Self.Create;
end;

end.
