unit Cliente_Factory.Controller;

interface

uses
  Cliente_Factory.Controller.Interf, Cliente.Controller.Interf;

type
  TClienteFactoryController = class(TInterfacedObject, IClienteFactoryController)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IClienteFactoryController;
    function Cliente: IClienteController;
  end;

implementation

uses
  Cliente.Controller;

{ TClienteFactoryController }

function TClienteFactoryController.Cliente: IClienteController;
begin
  Result := TClienteController.New;
end;

constructor TClienteFactoryController.Create;
begin

end;

destructor TClienteFactoryController.Destroy;
begin

  inherited;
end;

class function TClienteFactoryController.New: IClienteFactoryController;
begin
  Result := Self.Create;
end;

end.
