unit Cliente_State_Bloqueado.Model;

interface

uses
  Cliente.Model.Interf;

type
  TClienteStateBloqueadoModel = class(TInterfacedObject, IClienteMetodoModel)
  private
    FParent: IClienteModel;
  public
    constructor Create(Parent: IClienteModel);
    destructor Destroy; override;
    class function New(Parent: IClienteModel): IClienteMetodoModel;
    function Saldo: IClienteMetodoSaldoModel;
    function Buscar: IClienteMetodoBuscarModel;
    function &End: IClienteModel;
  end;

implementation

uses
  System.SysUtils;

{ TClienteStateInativoModel }

function TClienteStateBloqueadoModel.&End: IClienteModel;
begin
  Result := FParent;
end;

function TClienteStateBloqueadoModel.Buscar: IClienteMetodoBuscarModel;
begin
  raise Exception.Create('O cliente está bloqueado');
end;

constructor TClienteStateBloqueadoModel.Create(Parent: IClienteModel);
begin
  FParent := Parent;
end;

destructor TClienteStateBloqueadoModel.Destroy;
begin

  inherited;
end;

class function TClienteStateBloqueadoModel.New(Parent: IClienteModel): IClienteMetodoModel;
begin
  Result := Self.Create(Parent);
end;

function TClienteStateBloqueadoModel.Saldo: IClienteMetodoSaldoModel;
begin
  raise Exception.Create('O cliente está bloqueado');
end;

end.
