unit Conexao_Factory.Model;

interface

uses
  Conexao_Factory.Model.Interf, Conexao.Model.Interf;

type
  TConexaoFactoryModel = class(TInterfacedObject, IConexaoFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IConexaoFactoryModel;
    function Conexao: IConexaoModel;
  end;

implementation

uses
  Conexao.Model;

{ TConexaoFactoryModel }

function TConexaoFactoryModel.Conexao: IConexaoModel;
begin
  Result := TConexaoModel.New;
end;

constructor TConexaoFactoryModel.Create;
begin

end;

destructor TConexaoFactoryModel.Destroy;
begin

  inherited;
end;

class function TConexaoFactoryModel.New: IConexaoFactoryModel;
begin
  Result := Self.Create;
end;

end.
