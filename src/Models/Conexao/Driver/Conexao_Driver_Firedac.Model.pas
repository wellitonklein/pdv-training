unit Conexao_Driver_Firedac.Model;

interface

uses
  //FireDac
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.FMXUI.Wait, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client,

  Conexao.Model.Interf;

type
  TConexaoDriverFiredacModel = class(TInterfacedObject, IConexaoDriverModel, IConexaoDriverConfiguracaoModel)
  private
    FParent: IConexaoModel;
    FDriverID: string;
    FDatabase: string;
    FUsername: string;
    FPassword: string;
    FPort: Integer;
    procedure setParametros;
  protected
    FConnection: TFDConnection;
    FGUIxWaitCursor: TFDGUIxWaitCursor;
    FPhysFBDriverLink: TFDPhysFBDriverLink;
  public
    constructor Create(Parent: IConexaoModel);
    destructor Destroy; override;
    class function New(Parent: IConexaoModel): IConexaoDriverModel;

    // IConexaoDriverModel
    function Component: TCustomConnection;
    function Configuracao: IConexaoDriverConfiguracaoModel;
    function &End: IConexaoModel;

    // IConexaoDriverConfiguracaoModel
    function DriverID(const Value: String = 'FB'): IConexaoDriverConfiguracaoModel;
    function Database(const Value: String): IConexaoDriverConfiguracaoModel;
    function UserName(const Value: String): IConexaoDriverConfiguracaoModel;
    function Password(const Value: String): IConexaoDriverConfiguracaoModel;
    function Port(const Value: Integer = 3050): IConexaoDriverConfiguracaoModel;
    function &EndMetodo: IConexaoDriverModel;
  end;

implementation

uses
  System.SysUtils;

{ TConexaoDriverFiredacModel }

function TConexaoDriverFiredacModel.Component: TCustomConnection;
begin
  Result := FConnection;
end;

function TConexaoDriverFiredacModel.Configuracao: IConexaoDriverConfiguracaoModel;
begin
  Result := Self;
end;

function TConexaoDriverFiredacModel.&End: IConexaoModel;
begin
  Result := FParent;
end;

function TConexaoDriverFiredacModel.EndMetodo: IConexaoDriverModel;
begin
  Result := Self;
  setParametros;
end;

constructor TConexaoDriverFiredacModel.Create(Parent: IConexaoModel);
begin
  FParent := Parent;

  FConnection := TFDConnection.Create(nil);
  FGUIxWaitCursor := TFDGUIxWaitCursor.Create(nil);
  FPhysFBDriverLink := TFDPhysFBDriverLink.Create(nil);
end;

function TConexaoDriverFiredacModel.Database(
  const Value: String): IConexaoDriverConfiguracaoModel;
begin
  Result := Self;
  FDatabase := Value;
end;

destructor TConexaoDriverFiredacModel.Destroy;
begin
  FreeAndNil(FConnection);
  FreeAndNil(FGUIxWaitCursor);
  FreeAndNil(FPhysFBDriverLink);
  inherited;
end;

function TConexaoDriverFiredacModel.DriverID(
  const Value: String): IConexaoDriverConfiguracaoModel;
begin
  Result := Self;
  FDriverID := Value;
end;

class function TConexaoDriverFiredacModel.New(Parent: IConexaoModel): IConexaoDriverModel;
begin
  Result := Self.Create(Parent);
end;

function TConexaoDriverFiredacModel.Password(
  const Value: String): IConexaoDriverConfiguracaoModel;
begin
  Result := Self;
  FPassword := Value;
end;

function TConexaoDriverFiredacModel.Port(
  const Value: Integer): IConexaoDriverConfiguracaoModel;
begin
  Result := Self;
  FPort := Value;
end;

procedure TConexaoDriverFiredacModel.setParametros;
begin
  with FConnection.Params do
  begin
    DriverID := FDriverID;
    Database := FDatabase;
    UserName := FUserName;
    Password := FPassword;
  end;
end;

function TConexaoDriverFiredacModel.UserName(
  const Value: String): IConexaoDriverConfiguracaoModel;
begin
  Result := Self;
  FUsername := Value;
end;

end.
