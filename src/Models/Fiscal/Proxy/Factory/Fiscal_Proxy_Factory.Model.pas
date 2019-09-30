unit Fiscal_Proxy_Factory.Model;

interface

uses
  Fiscal_Proxy_Factory.Model.Interf, Fiscal_Proxy.Model.Interf;

type
  TFiscalProxyFactoryModel = class(TInterfacedObject, IFiscalProxyFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IFiscalProxyFactoryModel;
    function Identificacao(Parent: IFiscalProxyModel): IFiscalProxyIdentificacaoModel;
    function Emitente(Parent: IFiscalProxyModel): IFiscalProxyEmitenteModel;
    function Destinatario(Parent: IFiscalProxyModel): IFiscalProxyDestinatarioModel;
    function Produto(Parent: IFiscalProxyModel): IFiscalProxyProdutoModel;
    function Pagamento(Parent: IFiscalProxyModel): IFiscalProxyPagamentoModel;
  end;

implementation

uses
  Fiscal_Proxy_Destinatario.Model,
  Fiscal_Proxy_Emitente.Model,
  Fiscal_Proxy_Identificacao.Model,
  Fiscal_Proxy_Pagamento.Model,
  Fiscal_Proxy_Produto.Model;

{ TFiscalProxyFactoryModel }

constructor TFiscalProxyFactoryModel.Create;
begin

end;

function TFiscalProxyFactoryModel.Destinatario(
  Parent: IFiscalProxyModel): IFiscalProxyDestinatarioModel;
begin
  Result := TFiscalProxyDestinatarioModel.New(Parent);
end;

destructor TFiscalProxyFactoryModel.Destroy;
begin

  inherited;
end;

function TFiscalProxyFactoryModel.Emitente(
  Parent: IFiscalProxyModel): IFiscalProxyEmitenteModel;
begin
  Result := TFiscalProxyEmitenteModel.New(Parent);
end;

function TFiscalProxyFactoryModel.Identificacao(
  Parent: IFiscalProxyModel): IFiscalProxyIdentificacaoModel;
begin
  Result := TFiscalProxyIdentificacaoModel.New(Parent);
end;

class function TFiscalProxyFactoryModel.New: IFiscalProxyFactoryModel;
begin
  Result := Self.Create;
end;

function TFiscalProxyFactoryModel.Pagamento(
  Parent: IFiscalProxyModel): IFiscalProxyPagamentoModel;
begin
  Result := TFiscalProxyPagamentoModel.New(Parent);
end;

function TFiscalProxyFactoryModel.Produto(
  Parent: IFiscalProxyModel): IFiscalProxyProdutoModel;
begin
  Result := TFiscalProxyProdutoModel.New(Parent);
end;

end.
