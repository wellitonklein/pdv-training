unit Fiscal_Proxy_Produto.Model;

interface

uses
  Fiscal_Proxy.Model.Interf;

type
  TFiscalProxyProdutoModel = class(TInterfacedObject, IFiscalProxyProdutoModel)
  private
    FParent: IFiscalProxyModel;
    FCodigo: string;
    FDescricao: string;
    FCEAN: string;
    FQtde: Currency;
    FVUnit: Currency;
    FDesconto: Currency;
    FNCM: string;
    FAliquota: Currency;
    FST: Boolean;
    FCEST: string;
    FUND: string;
    FCFOP: string;
  public
    constructor Create(Parent: IFiscalProxyModel);
    destructor Destroy; override;
    class function New(Parent: IFiscalProxyModel): IFiscalProxyProdutoModel;
    function Codigo(Value: string): IFiscalProxyProdutoModel; overload;
    function Descricao(Value: string): IFiscalProxyProdutoModel; overload;
    function cEAN(Value: string): IFiscalProxyProdutoModel; overload;
    function Qtde(Value: Currency): IFiscalProxyProdutoModel; overload;
    function vUnit(Value: Currency): IFiscalProxyProdutoModel; overload;
    function Desconto(Value: Currency): IFiscalProxyProdutoModel; overload;
    function NCM(Value: string): IFiscalProxyProdutoModel; overload;
    function Aliquota(Value: Currency): IFiscalProxyProdutoModel; overload;
    function ST(Value: Boolean): IFiscalProxyProdutoModel; overload;
    function CEST(Value: string): IFiscalProxyProdutoModel; overload;
    function UND(Value: string): IFiscalProxyProdutoModel; overload;
    function CFOP(Value: string): IFiscalProxyProdutoModel; overload;
    function Codigo: string; overload;
    function Descricao: string; overload;
    function cEAN: string; overload;
    function Qtde: Currency; overload;
    function vUnit: Currency; overload;
    function Desconto: Currency; overload;
    function NCM: string; overload;
    function Aliquota: Currency; overload;
    function ST: Boolean; overload;
    function CEST: string; overload;
    function UND: string; overload;
    function CFOP: string; overload;
    function &End: IFiscalProxyModel;
  end;

implementation

{ TFiscalProxyProdutoModel }

function TFiscalProxyProdutoModel.Aliquota: Currency;
begin
  Result := FAliquota;
end;

function TFiscalProxyProdutoModel.Aliquota(
  Value: Currency): IFiscalProxyProdutoModel;
begin
  Result := Self;
  FAliquota := Value;
end;

function TFiscalProxyProdutoModel.cEAN: string;
begin
  Result := FCEAN;
end;

function TFiscalProxyProdutoModel.cEAN(Value: string): IFiscalProxyProdutoModel;
begin
  Result := Self;
  FCEAN := Value;
end;

function TFiscalProxyProdutoModel.CEST(Value: string): IFiscalProxyProdutoModel;
begin
  Result := Self;
  FCEST := Value;
end;

function TFiscalProxyProdutoModel.CEST: string;
begin
  Result := FCEST;
end;

function TFiscalProxyProdutoModel.CFOP(Value: string): IFiscalProxyProdutoModel;
begin
  Result := Self;
  FCFOP := Value;
end;

function TFiscalProxyProdutoModel.CFOP: string;
begin
  Result := FCFOP;
end;

function TFiscalProxyProdutoModel.Codigo(
  Value: string): IFiscalProxyProdutoModel;
begin
  Result := Self;
  FCodigo := Value;
end;

function TFiscalProxyProdutoModel.Codigo: string;
begin
  Result := FCodigo;
end;

function TFiscalProxyProdutoModel.&End: IFiscalProxyModel;
begin
  Result := FParent;
end;

constructor TFiscalProxyProdutoModel.Create(Parent: IFiscalProxyModel);
begin
  FParent := Parent;
end;

function TFiscalProxyProdutoModel.Descricao(
  Value: string): IFiscalProxyProdutoModel;
begin
  Result := Self;
  FDescricao := Value;
end;

function TFiscalProxyProdutoModel.Desconto(
  Value: Currency): IFiscalProxyProdutoModel;
begin
  Result := Self;
  FDesconto := Value;
end;

function TFiscalProxyProdutoModel.Desconto: Currency;
begin
  Result := FDesconto;
end;

function TFiscalProxyProdutoModel.Descricao: string;
begin
  Result := FDescricao;
end;

destructor TFiscalProxyProdutoModel.Destroy;
begin

  inherited;
end;

function TFiscalProxyProdutoModel.NCM(Value: string): IFiscalProxyProdutoModel;
begin
  Result := Self;
  FNCM := Value;
end;

function TFiscalProxyProdutoModel.NCM: string;
begin
  Result := FNCM;
end;

class function TFiscalProxyProdutoModel.New(Parent: IFiscalProxyModel): IFiscalProxyProdutoModel;
begin
  Result := Self.Create(Parent);
end;

function TFiscalProxyProdutoModel.Qtde(
  Value: Currency): IFiscalProxyProdutoModel;
begin
  Result := Self;
  FQtde := Value;
end;

function TFiscalProxyProdutoModel.Qtde: Currency;
begin
  Result := FQtde;
end;

function TFiscalProxyProdutoModel.ST(Value: Boolean): IFiscalProxyProdutoModel;
begin
  Result := Self;
  FST := Value;
end;

function TFiscalProxyProdutoModel.ST: Boolean;
begin
  Result := FST;
end;

function TFiscalProxyProdutoModel.UND: string;
begin
  Result := FUND;
end;

function TFiscalProxyProdutoModel.UND(Value: string): IFiscalProxyProdutoModel;
begin
  Result := Self;
  FUND := Value;
end;

function TFiscalProxyProdutoModel.vUnit(
  Value: Currency): IFiscalProxyProdutoModel;
begin
  Result := Self;
  FVUnit := Value;
end;

function TFiscalProxyProdutoModel.vUnit: Currency;
begin
  Result := FVUnit;
end;

end.
