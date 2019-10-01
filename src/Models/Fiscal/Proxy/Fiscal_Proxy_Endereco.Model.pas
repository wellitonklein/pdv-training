unit Fiscal_Proxy_Endereco.Model;

interface

uses
  Fiscal.Model.Interf;

type
  TFiscalProxyEnderecoModel<T> = class(TInterfacedObject, IFiscalProxyEnderecoModel<T>)
  private
    FParent: T;
    FLogradouro: string;
    FNumero: string;
    FBairro: string;
    FComplemento: string;
    FCidade: string;
    FcMunFG: Integer;
    FUF: string;
    FCEP: Integer;
  public
    constructor Create(Parent: T);
    destructor Destroy; override;
    class function New(Parent: T): IFiscalProxyEnderecoModel<T>;
    function Logradouro(Value: string): IFiscalProxyEnderecoModel<T>; overload;
    function Numero(Value: string): IFiscalProxyEnderecoModel<T>; overload;
    function Bairro(Value: string): IFiscalProxyEnderecoModel<T>; overload;
    function Complemento(Value: string): IFiscalProxyEnderecoModel<T>; overload;
    function Cidade(Value: string): IFiscalProxyEnderecoModel<T>; overload;
    function cMunFG(Value: Integer): IFiscalProxyEnderecoModel<T>; overload;
    function UF(Value: string): IFiscalProxyEnderecoModel<T>; overload;
    function CEP(Value: Integer): IFiscalProxyEnderecoModel<T>; overload;
    function Logradouro: string; overload;
    function Numero: string; overload;
    function Bairro: string; overload;
    function Complemento: string; overload;
    function Cidade: string; overload;
    function cMunFG: Integer; overload;
    function UF: string; overload;
    function CEP: Integer; overload;
    function &End: T;
  end;

implementation

{ TFiscalProxyEnderecoModel<T> }

function TFiscalProxyEnderecoModel<T>.Bairro: string;
begin
  Result := FBairro;
end;

function TFiscalProxyEnderecoModel<T>.Bairro(
  Value: string): IFiscalProxyEnderecoModel<T>;
begin
  Result := Self;
  FBairro := Value;
end;

function TFiscalProxyEnderecoModel<T>.CEP(
  Value: Integer): IFiscalProxyEnderecoModel<T>;
begin
  Result := Self;
  FCEP:= Value;
end;

function TFiscalProxyEnderecoModel<T>.CEP: Integer;
begin
  Result := FCEP;
end;

function TFiscalProxyEnderecoModel<T>.Cidade: string;
begin
  Result := FCidade;
end;

function TFiscalProxyEnderecoModel<T>.cMunFG(
  Value: Integer): IFiscalProxyEnderecoModel<T>;
begin
  Result := Self;
  FcMunFG := Value;
end;

function TFiscalProxyEnderecoModel<T>.cMunFG: Integer;
begin
  Result := FcMunFG;
end;

function TFiscalProxyEnderecoModel<T>.Cidade(
  Value: string): IFiscalProxyEnderecoModel<T>;
begin
  Result := Self;
  FCidade := Value;
end;

function TFiscalProxyEnderecoModel<T>.&End: T;
begin
  Result := FParent;
end;

function TFiscalProxyEnderecoModel<T>.Complemento(
  Value: string): IFiscalProxyEnderecoModel<T>;
begin
  Result := Self;
  FComplemento := Value;
end;

function TFiscalProxyEnderecoModel<T>.Complemento: string;
begin
  Result := FComplemento;
end;

constructor TFiscalProxyEnderecoModel<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

destructor TFiscalProxyEnderecoModel<T>.Destroy;
begin

  inherited;
end;

function TFiscalProxyEnderecoModel<T>.Logradouro: string;
begin
  Result := FLogradouro;
end;

function TFiscalProxyEnderecoModel<T>.Logradouro(
  Value: string): IFiscalProxyEnderecoModel<T>;
begin
  Result := Self;
  FLogradouro := Value;
end;

class function TFiscalProxyEnderecoModel<T>.New(Parent: T): IFiscalProxyEnderecoModel<T>;
begin
  Result := Self.Create(Parent);
end;

function TFiscalProxyEnderecoModel<T>.Numero(
  Value: string): IFiscalProxyEnderecoModel<T>;
begin
  Result := Self;
  FNumero := Value;
end;

function TFiscalProxyEnderecoModel<T>.Numero: string;
begin
  Result := FNumero;
end;

function TFiscalProxyEnderecoModel<T>.UF: string;
begin
  Result := FUF;
end;

function TFiscalProxyEnderecoModel<T>.UF(
  Value: string): IFiscalProxyEnderecoModel<T>;
begin
  Result := Self;
  FUF := Value;
end;

end.
