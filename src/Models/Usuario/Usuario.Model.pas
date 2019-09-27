unit Usuario.Model;

interface

uses
  Usuario.Model.Interf,
  Entidade_Usuario.Model;

type
  TUsuarioModel = class(TInterfacedObject, IUsuarioModel)
  private
    FTipoMetodo: IUsuarioMetodoModel;
    FIterator: IUsuarioIteratorModel;
    FEntidade: TUsuario;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IUsuarioModel;
    function Metodo(Value: IUsuarioMetodoModel): IUsuarioMetodoModel;
    function Iterator: IUsuarioIteratorModel;
    function Entidade: TUsuario;
  end;

implementation

uses
  Usuario_Factory.Model,
  Entidade_Factory.Model,
  System.SysUtils;

{ TUsuarioModel }

constructor TUsuarioModel.Create;
begin
  FIterator := TUsuarioFactoryModel.New.Iterator(Self);
  FEntidade := TEntidadeFactoryModel.New.Usuario;
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
