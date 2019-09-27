unit Entidade_Factory.Model;

interface

uses
  Entidade.Model.Interf,
  Entidade_Usuario.Model;

type
  TEntidadeFactoryModel = class(TInterfacedObject, IEntidadeFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IEntidadeFactoryModel;
    function Usuario: TUsuario;
  end;

implementation

{ TEntidadeFactoryModel }

constructor TEntidadeFactoryModel.Create;
begin

end;

destructor TEntidadeFactoryModel.Destroy;
begin

  inherited;
end;

class function TEntidadeFactoryModel.New: IEntidadeFactoryModel;
begin
  Result := Self.Create;
end;

function TEntidadeFactoryModel.Usuario: TUsuario;
begin
  Result := TUsuario.Create;
end;

end.
