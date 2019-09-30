unit Fiscal_Proxy.Model.Interf;

interface

type
  IFiscalProxyModel = interface;
  IFiscalProxyIdentificacaoModel = interface;
  IFiscalProxyContribuinteModel<T> = interface;
  IFiscalProxyEnderecoModel<T> = interface;
  IFiscalProxyEmitenteModel = interface;
  IFiscalProxyDestinatarioModel = interface;
  IFiscalProxyProdutoModel = interface;
  IFiscalProxyPagamentoModel = interface;

  IFiscalProxyModel = interface
    ['{3DB9C487-66D4-44E7-9645-768EF4104BFC}']
    function Identificacao: IFiscalProxyIdentificacaoModel;
    function Emitente: IFiscalProxyEmitenteModel;
    function Destinatario: IFiscalProxyDestinatarioModel;
    function Produto: IFiscalProxyProdutoModel;
    function Pagamento: IFiscalProxyPagamentoModel;
    function Exec: IFiscalProxyModel;
  end;

  IFiscalProxyIdentificacaoModel = interface
    ['{39400A8E-D161-419E-8DAB-8F519F4B2218}']
    function Numero(Value: SmallInt): IFiscalProxyIdentificacaoModel; overload;
    function Data(Value: TDateTime): IFiscalProxyIdentificacaoModel; overload;
    function Numero: SmallInt; overload;
    function Data: TDateTime; overload;
    function &End: IFiscalProxyModel;
  end;

  IFiscalProxyContribuinteModel<T> = interface
    ['{DCC7B58A-E94B-4654-BA7B-882076E47790}']
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

  IFiscalProxyEnderecoModel<T> = interface
    ['{43BD0828-5BFD-450A-A1E7-C31CE1D74310}']
    function Logradouro(Value: string): IFiscalProxyEnderecoModel<T>; overload;
    function Numero(Value: SmallInt): IFiscalProxyEnderecoModel<T>; overload;
    function Bairro(Value: string): IFiscalProxyEnderecoModel<T>; overload;
    function Cidade(Value: string): IFiscalProxyEnderecoModel<T>; overload;
    function UF(Value: string): IFiscalProxyEnderecoModel<T>; overload;
    function CEP(Value: string): IFiscalProxyEnderecoModel<T>; overload;
    function Logradouro: string; overload;
    function Numero: SmallInt; overload;
    function Bairro: string; overload;
    function Cidade: string; overload;
    function UF: string; overload;
    function CEP: string; overload;
    function &End: T;
  end;

  IFiscalProxyEmitenteModel = interface
    ['{E42C8793-B5BB-4AF9-9FB7-CA722982AB26}']
    function Contribuinte: IFiscalProxyContribuinteModel<IFiscalProxyEmitenteModel>;
    function Endereco: IFiscalProxyEnderecoModel<IFiscalProxyEmitenteModel>;
    function &End: IFiscalProxyModel;
  end;

  IFiscalProxyDestinatarioModel = interface
    ['{6A1B1CB3-0C6B-44B9-AB8F-03C73C475117}']
    function Contribuinte: IFiscalProxyContribuinteModel<IFiscalProxyDestinatarioModel>;
    function Endereco: IFiscalProxyEnderecoModel<IFiscalProxyDestinatarioModel>;
    function &End: IFiscalProxyModel;
  end;

  IFiscalProxyProdutoModel = interface
    ['{AA8530AD-61E3-48E4-A665-F7840FB453BC}']
    function Descricao(Value: string): IFiscalProxyProdutoModel; overload;
    function cEAN(Value: string): IFiscalProxyProdutoModel; overload;
    function Qtde(Value: Currency): IFiscalProxyProdutoModel; overload;
    function vUnit(Value: Currency): IFiscalProxyProdutoModel; overload;
    function NCM(Value: string): IFiscalProxyProdutoModel; overload;
    function Aliquota(Value: Currency): IFiscalProxyProdutoModel; overload;
    function ST(Value: Boolean): IFiscalProxyProdutoModel; overload;
    function CEST(Value: string): IFiscalProxyProdutoModel; overload;
    function UND(Value: string): IFiscalProxyProdutoModel; overload;
    function Descricao: string; overload;
    function cEAN: string; overload;
    function Qtde: Currency; overload;
    function vUnit: Currency; overload;
    function NCM: string; overload;
    function Aliquota: Currency; overload;
    function ST: Boolean; overload;
    function CEST: string; overload;
    function UND: string; overload;
    function &End: IFiscalProxyModel;
  end;

  IFiscalProxyPagamentoModel = interface
    ['{E99D79D7-5951-4B12-95C8-196F57C8D829}']
    function Descricao(Value: string): IFiscalProxyPagamentoModel;
    function Valor(Value: Currency): IFiscalProxyPagamentoModel;
    function &End: IFiscalProxyModel;
  end;

implementation

end.
