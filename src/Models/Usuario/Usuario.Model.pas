unit Usuario.Model;

interface

uses
  Usuario.Model.Interf,
  Entidade_Usuario.Model,
  ormbr.container.objectset.interfaces,
  Conexao.Model.Interf;

type
  TUsuarioModel = class(TInterfacedObject, IUsuarioModel)
  private
    FConn: IConexaoModel;
    FTipoMetodo: IUsuarioMetodoModel;
    FIterator: IUsuarioIteratorModel;
    FEntidade: TUsuario;
    FDAO: IContainerObjectSet<TUSUARIO>;
    FFuncoes: IUsuarioFuncoesModel;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IUsuarioModel;
    function Metodo(Value: IUsuarioMetodoModel): IUsuarioMetodoModel;
    function Iterator: IUsuarioIteratorModel;
    function Entidade: TUsuario;
    function DAO: IContainerObjectSet<TUSUARIO>;
    function Funcoes: IUsuarioFuncoesModel;
  end;

implementation

uses
  System.SysUtils,
  ormbr.container.objectset,
  PDVUpdates.Model,
  Usuario_Factory.Model;

{ TUsuarioModel }

constructor TUsuarioModel.Create;
begin
  FConn     := TPDVUpdatesModel.New.Conexao;
  FEntidade := TPDVUpdatesModel.New.Entidade.Usuario;
  FDAO      := TContainerObjectSet<TUSUARIO>.Create(FConn.Connection, 15);
  FIterator := TUsuarioFactoryModel.New.Iterator(Self);
  FFuncoes  := TUsuarioFactoryModel.New.Funcoes(Self);
end;

function TUsuarioModel.DAO: IContainerObjectSet<TUSUARIO>;
begin
  Result := FDAO;
end;

destructor TUsuarioModel.Destroy;
begin
  FreeAndNil(FEntidade);
  inherited;
end;

function TUsuarioModel.Entidade: TUsuario;
begin
  Result := FEntidade;
end;

function TUsuarioModel.Funcoes: IUsuarioFuncoesModel;
begin
  Result := FFuncoes;
end;

function TUsuarioModel.Iterator: IUsuarioIteratorModel;
begin
  Result := FIterator;
end;

function TUsuarioModel.Metodo(Value: IUsuarioMetodoModel): IUsuarioMetodoModel;
begin
  FTipoMetodo := Value;
  Result := FTipoMetodo;
end;

class function TUsuarioModel.New: IUsuarioModel;
begin
  Result := Self.Create;
end;

end.
