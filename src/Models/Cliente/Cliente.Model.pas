unit Cliente.Model;

interface

uses
  Cliente.Model.Interf,
  Entidade_Cliente.Model,
  ormbr.container.objectset.interfaces,
  Conexao.Model.Interf;

type
  TClienteModel = class(TInterfacedObject, IClienteModel, IClienteMetodoModel)
  private
    FConn: IConexaoModel;
    FState: IClienteMetodoModel;
    FEntidade: TCLIENTE;
    FDAO: IContainerObjectSet<TCLIENTE>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IClienteModel;
    function Metodo: IClienteMetodoModel;
    function SetState(Value: IClienteMetodoModel): IClienteModel;
    function Entidade: TCLIENTE; overload;
    function Entidade(Value: TCLIENTE): IClienteModel; overload;
    function DAO: IContainerObjectSet<TCLIENTE>;

    // IClienteMetodoModel
    function Saldo: IClienteMetodoSaldoModel;
    function Buscar: IClienteMetodoBuscarModel;
    function &End: IClienteModel;
  end;

implementation

uses
  Cliente_State_Factory.Model, Cliente_Metodo_Factory.Model, PDVUpdates.Model,
  ormbr.container.objectset, System.SysUtils;

{ TClienteModel }

function TClienteModel.&End: IClienteModel;
begin
  Result := Self;
end;

function TClienteModel.Entidade: TCLIENTE;
begin
  Result := FEntidade;
end;

function TClienteModel.Entidade(Value: TCLIENTE): IClienteModel;
begin
  Result := Self;
  FEntidade := Value;
end;

function TClienteModel.Buscar: IClienteMetodoBuscarModel;
begin
  FState.Buscar;
  Result := TClienteMetodoFactoryModel.New.Buscar(Self);
end;

constructor TClienteModel.Create;
begin
  FConn     := TPDVUpdatesModel.New.Conexao;
  FEntidade := TPDVUpdatesModel.New.Entidade.Cliente;
  FDAO      := TContainerObjectSet<TCLIENTE>.Create(FConn.Connection, 15);
  FState    := TClienteStateFactoryModel.New.Ativo(Self);
end;

function TClienteModel.DAO: IContainerObjectSet<TCLIENTE>;
begin
  Result := FDAO;
end;

destructor TClienteModel.Destroy;
begin
  FreeAndNil(FEntidade);
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
