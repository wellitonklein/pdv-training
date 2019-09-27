unit Cliente.Controller;

interface

uses
  Cliente.Controller.Interf;

type
  TClienteController = class(TInterfacedObject, IClienteController)
  private
    FMetodo: IClienteMetodoController;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IClienteController;
    function Metodo: IClienteMetodoController;
  end;

implementation

{ TClienteController }

uses
  Cliente_Metodo.Controller;

constructor TClienteController.Create;
begin
  FMetodo := TClienteMetodoController.New(Self);
end;

destructor TClienteController.Destroy;
begin

  inherited;
end;

function TClienteController.Metodo: IClienteMetodoController;
begin
  Result := FMetodo;
end;

class function TClienteController.New: IClienteController;
begin
  Result := Self.Create;
end;

end.
