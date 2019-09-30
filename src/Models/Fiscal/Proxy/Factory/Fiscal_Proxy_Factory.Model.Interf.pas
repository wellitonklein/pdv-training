unit Fiscal_Proxy_Factory.Model.Interf;

interface

uses
  Fiscal_Proxy.Model.Interf;

type

  IFiscalProxyFactoryModel = interface
    ['{D7DB1DCF-F9B6-4895-9CFA-1684F242E444}']
    function Identificacao(Parent: IFiscalProxyModel): IFiscalProxyIdentificacaoModel;
    function Emitente(Parent: IFiscalProxyModel): IFiscalProxyEmitenteModel;
    function Destinatario(Parent: IFiscalProxyModel): IFiscalProxyDestinatarioModel;
    function Produto(Parent: IFiscalProxyModel): IFiscalProxyProdutoModel;
    function Pagamento(Parent: IFiscalProxyModel): IFiscalProxyPagamentoModel;
  end;

implementation

end.
