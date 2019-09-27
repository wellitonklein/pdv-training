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
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IUsuarioModel;
    function Metodo(Value: IUsuarioMetodoModel): IUsuarioMetodoModel;
    function Iterator: IUsuarioIteratorModel;
    function Entidade: TUsuario;
    function DAO: IContainerObjectSet<TUSUARIO>;
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
  FIterator := TUsuarioFactoryModel.New.Iterator(Self);
  FEntidade := TPDVUpdatesModel.New.Entidade.Usuario;
  FDAO      := TContainerObjectSet<TUSUARIO>.Create(FConn.Connection, 15);
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
