unit Fiscal_Proxy.Model;

interface

uses
  Fiscal_Proxy.Model.Interf, System.Generics.Collections, Fiscal.Model.Interf;

type
  TFiscalProxyModel = class(TInterfacedObject, IFiscalProxyModel,
    IFiscalProxyProdutoListaModel, IFiscalProxyPagamentoListaModel)
  private
    FParent: IFiscalComponente;
    FIdentificacao: IFiscalProxyIdentificacaoModel;
    FEmitente: IFiscalProxyEmitenteModel;
    FDestinatario: IFiscalProxyDestinatarioModel;
    FProdutoLista: TList<IFiscalProxyProdutoModel>;
    FPagamentoLista: TList<IFiscalProxyPagamentoModel>;
  public
    constructor Create(Parent: IFiscalComponente);
    destructor Destroy; override;
    class function New(Parent: IFiscalComponente): IFiscalProxyModel;

    // IFiscalProxyModel
    function Identificacao: IFiscalProxyIdentificacaoModel;
    function Emitente: IFiscalProxyEmitenteModel;
    function Destinatario: IFiscalProxyDestinatarioModel;
    function Produto: IFiscalProxyProdutoListaModel;
    function Pagamento: IFiscalProxyPagamentoListaModel;
    function Exec: IFiscalProxyModel;

    // IFiscalProxyProdutoListaModel
    function AddProduto: IFiscalProxyProdutoModel;
    function &EndProduto: IFiscalProxyProdutoListaModel;

    // IFiscalProxyPagamentoListaModel
    function AddPagamento: IFiscalProxyPagamentoModel;
    function &EndPagamento: IFiscalProxyPagamentoListaModel;

    // IFiscalProxyProdutoListaModel && IFiscalProxyPagamentoListaModel
    function &End: IFiscalProxyModel;
  end;

implementation

uses
  Fiscal_Proxy_Factory.Model,
  System.SysUtils;

{ TFiscalProxyModel }

function TFiscalProxyModel.&End: IFiscalProxyModel;
begin
  Result := Self;
end;

function TFiscalProxyModel.AddPagamento: IFiscalProxyPagamentoModel;
begin
  FPagamentoLista.Add(TFiscalProxyFactoryModel.New.Pagamento(Self));
  Result := FPagamentoLista.Items[Pred(FPagamentoLista.Count)];
end;

function TFiscalProxyModel.AddProduto: IFiscalProxyProdutoModel;
begin
  FProdutoLista.Add(TFiscalProxyFactoryModel.New.Produto(Self));
  Result := FProdutoLista.Items[Pred(FProdutoLista.Count)];
end;

constructor TFiscalProxyModel.Create(Parent: IFiscalComponente);
begin
  FParent         := Parent;
  FIdentificacao  := TFiscalProxyFactoryModel.New.Identificacao(Self);
  FEmitente       := TFiscalProxyFactoryModel.New.Emitente(Self);
  FDestinatario   := TFiscalProxyFactoryModel.New.Destinatario(Self);
  FProdutoLista   := TList<IFiscalProxyProdutoModel>.Create;
  FPagamentoLista := TList<IFiscalProxyPagamentoModel>.Create;
end;

function TFiscalProxyModel.Destinatario: IFiscalProxyDestinatarioModel;
begin
  Result := FDestinatario;
end;

destructor TFiscalProxyModel.Destroy;
begin
  FreeAndNil(FProdutoLista);
  FreeAndNil(FPagamentoLista);
  inherited;
end;

function TFiscalProxyModel.Emitente: IFiscalProxyEmitenteModel;
begin
  Result := FEmitente;
end;

function TFiscalProxyModel.&EndPagamento: IFiscalProxyPagamentoListaModel;
begin
  Result := Self;
end;

function TFiscalProxyModel.&EndProduto: IFiscalProxyProdutoListaModel;
begin
  Result := Self;
end;

function TFiscalProxyModel.Exec: IFiscalProxyModel;
begin
  Result := Self;
  FParent.Emitir(Self);
end;

function TFiscalProxyModel.Identificacao: IFiscalProxyIdentificacaoModel;
begin
  Result := FIdentificacao;
end;

class function TFiscalProxyModel.New(Parent: IFiscalComponente): IFiscalProxyModel;
begin
  Result := Self.Create(Parent);
end;

function TFiscalProxyModel.Pagamento: IFiscalProxyPagamentoListaModel;
begin
  Result := Self;
end;

function TFiscalProxyModel.Produto: IFiscalProxyProdutoListaModel;
begin
  Result := Self;
end;

end.
