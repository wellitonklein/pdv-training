unit Conexao_Driver_Factory.Model;

interface

uses
  Conexao_Driver_Factory.Model.interf, Conexao.Model.Interf;

type
  TConexaoDriverFactoryModel = class(TInterfacedObject, IConexaoDriverFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IConexaoDriverFactoryModel;
    function Firedac(Parent: IConexaoModel): IConexaoDriverModel;
  end;

implementation

uses
  Conexao_Driver_Firedac.Model;

{ TConexaoDriverFactoryModel }

constructor TConexaoDriverFactoryModel.Create;
begin

end;

destructor TConexaoDriverFactoryModel.Destroy;
begin

  inherited;
end;

function TConexaoDriverFactoryModel.Firedac(Parent: IConexaoModel): IConexaoDriverModel;
begin
  Result := TConexaoDriverFiredacModel.New(Parent);
end;

class function TConexaoDriverFactoryModel.New: IConexaoDriverFactoryModel;
begin
  Result := Self.Create;
end;

end.
