unit Fiscal_Proxy.Model.Interf;

interface

type
  IFiscalProxyModel = interface;
  IFiscalProxyIdentificacaoModel = interface;
  IFiscalProxyContribuinteModel<T> = interface;
  IFiscalProxyEnderecoModel<T> = interface;
  IFiscalProxyEmitenteModel = interface;
  IFiscalProxyDestinatarioModel = interface;
  IFiscalProxyProdutoListaModel = interface;
  IFiscalProxyProdutoListaIteratorModel = interface;
  IFiscalProxyProdutoModel = interface;
  IFiscalProxyPagamentoListaModel = interface;
  IFiscalProxyPagamentoModel = interface;

  IFiscalProxyModel = interface
    ['{3DB9C487-66D4-44E7-9645-768EF4104BFC}']
    function Identificacao: IFiscalProxyIdentificacaoModel;
    function Emitente: IFiscalProxyEmitenteModel;
    function Destinatario: IFiscalProxyDestinatarioModel;
    function Produto: IFiscalProxyProdutoListaModel;
    function Pagamento: IFiscalProxyPagamentoListaModel;
    function Exec: IFiscalProxyModel;
  end;

  IFiscalProxyIdentificacaoModel = interface
    ['{39400A8E-D161-419E-8DAB-8F519F4B2218}']
    function Numero(Value: SmallInt): IFiscalProxyIdentificacaoModel; overload;
    function Data(Value: TDateTime): IFiscalProxyIdentificacaoModel; overload;
    function Serie(Value: SmallInt): IFiscalProxyIdentificacaoModel; overload;
    function Serie: SmallInt; overload;
    function Numero: SmallInt; overload;
    function Data: TDateTime; overload;
    function &End: IFiscalProxyModel;
  end;

  IFiscalProxyContribuinteModel<T> = interface
    ['{DCC7B58A-E94B-4654-BA7B-882076E47790}']
    function Nome(Value: string): IFiscalProxyContribuinteModel<T>; overload;
    function CPFCNPJ(Value: string): IFiscalProxyContribuinteModel<T>; overload;
    function Fantasia(Value: string): IFiscalProxyContribuinteModel<T>; overload;
    function IE(Value: string): IFiscalProxyContribuinteModel<T>; overload;
    function TeleFone(Value: string): IFiscalProxyContribuinteModel<T>; overload;
    function IEST(Value: string): IFiscalProxyContribuinteModel<T>; overload;
    function IM(Value: string): IFiscalProxyContribuinteModel<T>; overload;
    function CNAE(Value: string): IFiscalProxyContribuinteModel<T>; overload;
    function CRT(Value: SmallInt): IFiscalProxyContribuinteModel<T>; overload;
    function ISUF(Value: string): IFiscalProxyContribuinteModel<T>; overload;
    function Nome: string; overload;
    function Fantasia: string; overload;
    function CPFCNPJ: string; overload;
    function IE: string; overload;
    function TeleFone: string; overload;
    function IEST: string; overload;
    function IM: string; overload;
    function CNAE: string; overload;
    function CRT: SmallInt; overload;
    function ISUF: string; overload;
    function &End: T;
  end;

  IFiscalProxyEnderecoModel<T> = interface
    ['{43BD0828-5BFD-450A-A1E7-C31CE1D74310}']
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

  IFiscalProxyProdutoListaModel = interface
    ['{2AE34789-BEF3-47A2-B526-E511823AFBD3}']
    function IteratorProduto: IFiscalProxyProdutoListaIteratorModel;
    function AddProduto: IFiscalProxyProdutoModel;
    function &EndProduto: IFiscalProxyProdutoListaModel;
    function &End: IFiscalProxyModel;
  end;

  IFiscalProxyProdutoListaIteratorModel = interface
    ['{F0C6B9AB-851B-469B-8429-DA74F9AFBC79}']
    function hasNextProduto: Boolean;
    function NextProduto: IFiscalProxyProdutoModel;
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

  IFiscalProxyPagamentoListaModel = interface
    ['{2AE34789-BEF3-47A2-B526-E511823AFBD3}']
    function AddPagamento: IFiscalProxyPagamentoModel;
    function &EndPagamento: IFiscalProxyPagamentoListaModel;
    function &End: IFiscalProxyModel;
  end;

  IFiscalProxyPagamentoModel = interface
    ['{E99D79D7-5951-4B12-95C8-196F57C8D829}']
    function Descricao(Value: string): IFiscalProxyPagamentoModel; overload;
    function Valor(Value: Currency): IFiscalProxyPagamentoModel; overload;
    function Descricao: string; overload;
    function Valor: Currency; overload;
    function &End: IFiscalProxyModel;
  end;

implementation

end.
