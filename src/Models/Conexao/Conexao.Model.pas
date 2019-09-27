unit Conexao.Model;

interface

uses
  //ORMBr
  ormbr.factory.interfaces,
  ormbr.factory.firedac,
  ormbr.dml.generator.firebird,

  Conexao.Model.Interf;

type
  TConexaoModel = class(TInterfacedObject, IConexaoModel)
  private
    FDriver: IConexaoDriverModel;
    procedure SetParametros;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IConexaoModel;

    // IConexaoModel
    function Connection: IDBConnection;
    function Driver: IConexaoDriverModel;
  end;

implementation

uses
  Conexao_Driver_Factory.Model, System.SysUtils;

{ TConexaoModel }

function TConexaoModel.Connection: IDBConnection;
begin
  Result := TFactoryFireDAC.Create(FDriver.Component, dnFirebird);
end;

constructor TConexaoModel.Create;
begin
  FDriver := TConexaoDriverFactoryModel.New.Firedac(Self);
  SetParametros;
end;

destructor TConexaoModel.Destroy;
begin

  inherited;
end;

function TConexaoModel.Driver: IConexaoDriverModel;
begin
  Result := FDriver;
end;

class function TConexaoModel.New: IConexaoModel;
begin
  Result := Self.Create;
end;

procedure TConexaoModel.SetParametros;
begin
  with FDriver.Configuracao do
  begin
    DriverID('FB');
    Database(ExtractFilePath(ParamStr(0)) + 'database\PDVUPDATES.FDB');
    UserName('SYSDBA');
    Password('masterkey');
    Port(3050);
  end;
end;

end.
