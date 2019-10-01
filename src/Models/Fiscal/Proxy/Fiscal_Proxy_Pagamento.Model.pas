unit Fiscal_Proxy_Pagamento.Model;

interface

uses
  Fiscal_Proxy.Model.Interf;

type
  TFiscalProxyPagamentoModel = class(TInterfacedObject, IFiscalProxyPagamentoModel)
  private
    FParent: IFiscalProxyModel;
    FTipo: SmallInt;
    FDescricao: string;
    FValor: Currency;
  public
    constructor Create(Parent: IFiscalProxyModel);
    destructor Destroy; override;
    class function New(Parent: IFiscalProxyModel): IFiscalProxyPagamentoModel;
    function Tipo(Value: SmallInt): IFiscalProxyPagamentoModel; overload;
    function Descricao(Value: string): IFiscalProxyPagamentoModel; overload;
    function Valor(Value: Currency): IFiscalProxyPagamentoModel; overload;
    function Tipo: SmallInt; overload;
    function Descricao: string; overload;
    function Valor: Currency; overload;
    function &End: IFiscalProxyModel;
  end;

implementation

{ TFiscalProxyPagamentoModel }

function TFiscalProxyPagamentoModel.&End: IFiscalProxyModel;
begin
  Result := FParent;
end;

constructor TFiscalProxyPagamentoModel.Create(Parent: IFiscalProxyModel);
begin
  FParent := Parent;
end;

function TFiscalProxyPagamentoModel.Descricao: string;
begin
  Result := FDescricao;
end;

function TFiscalProxyPagamentoModel.Descricao(
  Value: string): IFiscalProxyPagamentoModel;
begin
  Result := Self;
  FDescricao := Value;
end;

destructor TFiscalProxyPagamentoModel.Destroy;
begin

  inherited;
end;

class function TFiscalProxyPagamentoModel.New(Parent: IFiscalProxyModel): IFiscalProxyPagamentoModel;
begin
  Result := Self.Create(Parent);
end;

function TFiscalProxyPagamentoModel.Tipo(
  Value: SmallInt): IFiscalProxyPagamentoModel;
begin
  Result := Self;
  FTipo := Value;
end;

function TFiscalProxyPagamentoModel.Tipo: SmallInt;
begin
  Result := FTipo;
end;

function TFiscalProxyPagamentoModel.Valor: Currency;
begin
  Result := FValor;
end;

function TFiscalProxyPagamentoModel.Valor(
  Value: Currency): IFiscalProxyPagamentoModel;
begin
  Result := Self;
  FValor := Value;
end;

end.
