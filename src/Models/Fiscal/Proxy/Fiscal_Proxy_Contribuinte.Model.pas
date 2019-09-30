unit Fiscal_Proxy_Contribuinte.Model;

interface

uses
  Fiscal_Proxy.Model.Interf;

type
  TFiscalProxyContribuinteModel<T> = class(TInterfacedObject, IFiscalProxyContribuinteModel<T>)
  private
    FParent: T;
    FNome: string;
    FCPFCNPJ: string;
    FIE: string;
    FTelefone: string;
  public
    constructor Create(Parent: T);
    destructor Destroy; override;
    class function New(Parent: T): IFiscalProxyContribuinteModel<T>;
    function Nome(Value: string): IFiscalProxyContribuinteModel<T>; overload;
    function CPFCNPJ(Value: string): IFiscalProxyContribuinteModel<T>; overload;
    function IE(Value: string): IFiscalProxyContribuinteModel<T>; overload;
    function TeleFone(Value: string): IFiscalProxyContribuinteModel<T>; overload;
    function Nome: string; overload;
    function CPFCNPJ: string; overload;
    function IE: string; overload;
    function TeleFone: string; overload;
    function &End: T;
  end;

implementation

{ TFiscalProxyContribuinteModel<T> }

function TFiscalProxyContribuinteModel<T>.CPFCNPJ(
  Value: string): IFiscalProxyContribuinteModel<T>;
begin
  Result := Self;
  FCPFCNPJ := Value;
end;

function TFiscalProxyContribuinteModel<T>.&End: T;
begin
  Result := FParent;
end;

function TFiscalProxyContribuinteModel<T>.CPFCNPJ: string;
begin
  Result := FCPFCNPJ;
end;

function TFiscalProxyContribuinteModel<T>.IE: string;
begin
  Result := FIE;
end;

constructor TFiscalProxyContribuinteModel<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

destructor TFiscalProxyContribuinteModel<T>.Destroy;
begin

  inherited;
end;

function TFiscalProxyContribuinteModel<T>.IE(
  Value: string): IFiscalProxyContribuinteModel<T>;
begin
  Result := Self;
  FIE := Value;
end;

class function TFiscalProxyContribuinteModel<T>.New(Parent: T): IFiscalProxyContribuinteModel<T>;
begin
  Result := Self.Create(Parent);
end;

function TFiscalProxyContribuinteModel<T>.Nome: string;
begin
  Result := FNome;
end;

function TFiscalProxyContribuinteModel<T>.Nome(
  Value: string): IFiscalProxyContribuinteModel<T>;
begin
  Result := Self;
  FNome := Value;
end;

function TFiscalProxyContribuinteModel<T>.TeleFone(
  Value: string): IFiscalProxyContribuinteModel<T>;
begin
  Result := Self;
  FTelefone := Value;
end;

function TFiscalProxyContribuinteModel<T>.TeleFone: string;
begin
  Result := FTelefone;
end;

end.
