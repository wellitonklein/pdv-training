unit Cliente.Model;

interface

uses
  Cliente.Model.Interf;

type
  TClienteModel = class(TInterfacedObject, IClienteModel, IClienteMetodoModel)
  private
    FState: IClienteMetodoModel;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IClienteModel;
    function Metodo: IClienteMetodoModel;
    function SetState(Value: IClienteMetodoModel): IClienteModel;

    // IClienteMetodoModel
    function Saldo: IClienteMetodoSaldoModel;
    function Buscar: IClienteMetodoBuscarModel;
    function &End: IClienteModel;
  end;

implementation

uses
  Cliente_State_Factory.Model, Cliente_Metodo_Factory.Model;

{ TClienteModel }

function TClienteModel.&End: IClienteModel;
begin
  Result := Self;
end;

function TClienteModel.Buscar: IClienteMetodoBuscarModel;
begin
  FState.Buscar;
  Result := TClienteMetodoFactoryModel.New.Buscar(Self);
end;

constructor TClienteModel.Create;
begin
  FState := TClienteStateFactoryModel.New.Ativo(Self);
end;

destructor TClienteModel.Destroy;
begin

  inherited;
end;

function TClienteModel.Metodo: IClienteMetodoModel;
begin
  Result := Self;
end;

class function TClienteModel.New: IClienteModel;
begin
  Result := Self.Create;
end;

function TClienteModel.Saldo: IClienteMetodoSaldoModel;
begin
  FState.Saldo;
  Result := TClienteMetodoFactoryModel.New.Saldo(Self);
end;

function TClienteModel.SetState(Value: IClienteMetodoModel): IClienteModel;
begin
  Result := Self;
  FState := Value;
end;

end.
