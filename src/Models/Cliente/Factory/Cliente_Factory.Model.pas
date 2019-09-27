unit Cliente_Factory.Model;

interface

uses
  Cliente_Factory.Model.Interf, Cliente.Model.Interf;

type
  TClienteFactoryModel = class(TInterfacedObject, IClienteFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IClienteFactoryModel;
    function Cliente: IClienteModel;
  end;

implementation

uses
  Cliente.Model;

{ TClienteFactoryModel }

function TClienteFactoryModel.Cliente: IClienteModel;
begin
  Result := TClienteModel.New;
end;

constructor TClienteFactoryModel.Create;
begin

end;

destructor TClienteFactoryModel.Destroy;
begin

  inherited;
end;

class function TClienteFactoryModel.New: IClienteFactoryModel;
begin
  Result := Self.Create;
end;

end.
