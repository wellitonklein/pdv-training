unit Fiscal_Proxy_Factory.Model;

interface

uses
  Fiscal_Proxy_Factory.Model.Interf,
  Fiscal_Proxy.Model.Interf,
  System.Generics.Collections, Fiscal.Model.Interf;

type
  TFiscalProxyFactoryModel = class(TInterfacedObject, IFiscalProxyFactoryModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IFiscalProxyFactoryModel;
    function Proxy(Parent: IFiscalComponente): IFiscalProxyModel;
    function Identificacao(Parent: IFiscalProxyModel): IFiscalProxyIdentificacaoModel;
    function Emitente(Parent: IFiscalProxyModel): IFiscalProxyEmitenteModel;
    function Destinatario(Parent: IFiscalProxyModel): IFiscalProxyDestinatarioModel;
    function Produto(Parent: IFiscalProxyModel): IFiscalProxyProdutoModel;
    function Pagamento(Parent: IFiscalProxyModel): IFiscalProxyPagamentoModel;
    function ProdutoLista(Parent: IFiscalProxyModel): IFiscalProxyProdutoListaModel;
    function PagamentoLista(Parent: IFiscalProxyModel): IFiscalProxyPagamentoListaModel;
    function ProdutoIterator(Lista: TList<IFiscalProxyProdutoModel>): IFiscalProxyProdutoIteratorModel;
    function PagamentoIterator(Lista: TList<IFiscalProxyPagamentoModel>): IFiscalProxyPagamentoIteratorModel;
  end;

implementation

uses
  Fiscal_Proxy_Destinatario.Model,
  Fiscal_Proxy_Emitente.Model,
  Fiscal_Proxy_Identificacao.Model,
  Fiscal_Proxy_Pagamento.Model,
  Fiscal_Proxy_Produto.Model,
  Fiscal_Proxy_PagamentoLista.Model,
  Fiscal_Proxy_ProdutoLista.Model,
  Fiscal_Proxy_ProdutoIterator.Model,
  Fiscal_Proxy_PagamentoIterator.Model, Fiscal_Proxy.Model;

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

function TFiscalProxyFactoryModel.PagamentoIterator(
  Lista: TList<IFiscalProxyPagamentoModel>): IFiscalProxyPagamentoIteratorModel;
begin
  Result := TFiscalProxyPagamentoIteratorModel.New(Lista);
end;

function TFiscalProxyFactoryModel.PagamentoLista(
  Parent: IFiscalProxyModel): IFiscalProxyPagamentoListaModel;
begin
  Result := TFiscalProxyPagamentoListaModel.New(Parent);
end;

function TFiscalProxyFactoryModel.Produto(
  Parent: IFiscalProxyModel): IFiscalProxyProdutoModel;
begin
  Result := TFiscalProxyProdutoModel.New(Parent);
end;

function TFiscalProxyFactoryModel.ProdutoIterator(
  Lista: TList<IFiscalProxyProdutoModel>): IFiscalProxyProdutoIteratorModel;
begin
  Result := TFiscalProxyProdutoIteratorModel.New(Lista);
end;

function TFiscalProxyFactoryModel.ProdutoLista(
  Parent: IFiscalProxyModel): IFiscalProxyProdutoListaModel;
begin
  Result := TFiscalProxyProdutoListaModel.New(Parent);
end;

function TFiscalProxyFactoryModel.Proxy(
  Parent: IFiscalComponente): IFiscalProxyModel;
begin
  Result := TFiscalProxyModel.New(Parent);
end;

end.
