unit Caixa.Model;

interface

uses
  Caixa.Model.interf,
  Entidade_Caixa.Model,
  ormbr.container.objectset.interfaces, Conexao.Model.Interf;

type
  TCaixaModel = class(TInterfacedObject, ICaixaModel, ICaixaMetodoModel)
  private
    FConn: IConexaoModel;
    FState: ICaixaMetodoModel;
    FEntidade: TCAIXA;
    FDAO: IContainerObjectSet<TCaixa>;
    FObservers: ICaixaObserverModel;
    function SetStatusCaixa: ICaixaMetodoModel;
    procedure RecuperarCaixa;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : ICaixaModel;

    // ICaixaModel
    function Metodo: ICaixaMetodoModel;
    function SetState(Value: ICaixaMetodoModel): ICaixaModel;
    function Entidade: TCaixa; overload;
    function Entidade(Value: TCAIXA): ICaixaModel; overload;
    function DAO: IContainerObjectSet<TCaixa>;
    function Observers: ICaixaObserverModel;

    // ICaixaMetodoModel
    function Abrir: ICaixaMetodoAbrirModel;
    function Fechar: ICaixaMetodoFecharModel;
    function Suprimento: ICaixaMetodoSuprimentoModel;
    function Sangria: ICaixaMetodoSangriaModel;
    function Bloquear: ICaixaMetodoBloquearModel;
    function Desbloquear: ICaixaMetodoDesbloquearModel;
    function TrocarOperador: ICaixaMetodoTrocarOperadorModel;
    function &End: ICaixaModel;
  end;

implementation

uses
  Caixa_Metodo_Factory.Model, Caixa_State_Factory.Model, PDVUpdates.Model,
  ormbr.container.objectset, PDVUpdates_Type.Controller, System.SysUtils,
  Caixa_Observer.Model;

{ TCaixaModel }

function TCaixaModel.Abrir: ICaixaMetodoAbrirModel;
begin
  FState.Abrir;
  Result := TCaixaMetodoFactoryModel.New.Abrir(Self);
end;

function TCaixaModel.Bloquear: ICaixaMetodoBloquearModel;
begin
  FState.Bloquear;
  Result := TCaixaMetodoFactoryModel.New.Bloquear(Self);
end;

function TCaixaModel.&End: ICaixaModel;
begin
  Result := Self;
end;

function TCaixaModel.Entidade(Value: TCAIXA): ICaixaModel;
begin
  Result := Self;
  FEntidade := Value;
end;

function TCaixaModel.Entidade: TCaixa;
begin
  Result := FEntidade;
end;

constructor TCaixaModel.Create;
begin
  FConn      := TPDVUpdatesModel.New.Conexao;
  FEntidade  := TPDVUpdatesModel.New.Entidade.Caixa;
  FDAO       := TContainerObjectSet<TCaixa>.Create(FConn.Connection, 15);
  FState     := SetStatusCaixa;
  FObservers := TCaixaObserverModel.New(Self);
end;

function TCaixaModel.DAO: IContainerObjectSet<TCaixa>;
begin
  Result := FDAO;
end;

function TCaixaModel.Desbloquear: ICaixaMetodoDesbloquearModel;
begin
  FState.Desbloquear;
  Result := TCaixaMetodoFactoryModel.New.Desbloquear(Self);
end;

destructor TCaixaModel.Destroy;
begin
  FreeAndNil(FEntidade);
  inherited;
end;

function TCaixaModel.Fechar: ICaixaMetodoFecharModel;
begin
  FState.Fechar;
  Result := TCaixaMetodoFactoryModel.New.Fechar(Self);
end;

function TCaixaModel.Metodo: ICaixaMetodoModel;
begin
  Result := Self;
end;

class function TCaixaModel.New: ICaixaModel;
begin
  Result := Self.Create;
end;

function TCaixaModel.Observers: ICaixaObserverModel;
begin
  Result := FObservers;
end;

procedure TCaixaModel.RecuperarCaixa;
begin
  try
    FEntidade := FDAO.FindWhere('', 'DATAABERTURA DESC').Items[0];
  except
    FEntidade.STATUS := -1;
  end;
end;

function TCaixaModel.SetStatusCaixa: ICaixaMetodoModel;
begin
  RecuperarCaixa;
  case TTypeCaixaStatus(FEntidade.STATUS) of
    tcsAberto: Result := TCaixaStateFactoryModel.New.Aberto;
    tcsBloqueado: Result := TCaixaStateFactoryModel.New.Bloqueado;
    tcsFechado: Result := TCaixaStateFactoryModel.New.Fechado;
    else Result := TCaixaStateFactoryModel.New.Fechado;
  end;
end;

function TCaixaModel.Sangria: ICaixaMetodoSangriaModel;
begin
  FState.Sangria;
  Result := TCaixaMetodoFactoryModel.New.Sangria(Self);
end;

function TCaixaModel.SetState(Value: ICaixaMetodoModel): ICaixaModel;
begin
  Result := Self;
  FState := Value;
end;

function TCaixaModel.Suprimento: ICaixaMetodoSuprimentoModel;
begin
  FState.Suprimento;
  Result := TCaixaMetodoFactoryModel.New.Suprimento(Self);
end;

function TCaixaModel.TrocarOperador: ICaixaMetodoTrocarOperadorModel;
begin
  FState.TrocarOperador;
  Result := TCaixaMetodoFactoryModel.New.TrocarOperador(Self);
end;

end.
