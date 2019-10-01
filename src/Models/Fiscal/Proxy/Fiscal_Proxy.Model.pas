unit Fiscal_Proxy.Model;

interface

uses
  Fiscal_Proxy.Model.Interf,
  System.Generics.Collections,
  Fiscal.Model.Interf;

type
  TFiscalProxyModel = class(TInterfacedObject, IFiscalProxyModel)
  private
    FParent: IFiscalModel;
    FComponente: IFiscalComponente;
    FIdentificacao: IFiscalProxyIdentificacaoModel;
    FEmitente: IFiscalProxyEmitenteModel;
    FDestinatario: IFiscalProxyDestinatarioModel;
    FProduto: IFiscalProxyProdutoListaModel;
    FPagamento: IFiscalProxyPagamentoListaModel;
  public
    constructor Create(Parent: IFiscalModel);
    destructor Destroy; override;
    class function New(Parent: IFiscalModel): IFiscalProxyModel;

    // IFiscalProxyModel
    function Identificacao: IFiscalProxyIdentificacaoModel;
    function Emitente: IFiscalProxyEmitenteModel;
    function Destinatario: IFiscalProxyDestinatarioModel;
    function Produto: IFiscalProxyProdutoListaModel;
    function Pagamento: IFiscalProxyPagamentoListaModel;
    function Componente(Value: IFiscalComponente): IFiscalProxyModel;
    function &End: IFiscalModel;
    function Exec: IFiscalProxyModel;
  end;

implementation

uses
  Fiscal_Proxy_Factory.Model;

{ TFiscalProxyModel }


function TFiscalProxyModel.&End: IFiscalModel;
begin
  Result := FParent;
end;

function TFiscalProxyModel.Componente(
  Value: IFiscalComponente): IFiscalProxyModel;
begin
  Result := Self;
  FComponente := Value;
end;

constructor TFiscalProxyModel.Create(Parent: IFiscalModel);
begin
  FParent         := Parent;
  FIdentificacao  := TFiscalProxyFactoryModel.New.Identificacao(Self);
  FEmitente       := TFiscalProxyFactoryModel.New.Emitente(Self);
  FDestinatario   := TFiscalProxyFactoryModel.New.Destinatario(Self);
  FProduto        := TFiscalProxyFactoryModel.New.ProdutoLista(Self);
  FPagamento      := TFiscalProxyFactoryModel.New.PagamentoLista(Self);
end;

function TFiscalProxyModel.Destinatario: IFiscalProxyDestinatarioModel;
begin
  Result := FDestinatario;
end;

destructor TFiscalProxyModel.Destroy;
begin
  inherited;
end;

function TFiscalProxyModel.Emitente: IFiscalProxyEmitenteModel;
begin
  Result := FEmitente;
end;

function TFiscalProxyModel.Exec: IFiscalProxyModel;
begin
  Result := Self;
  FParent.NFCe.Emitir(Self);
end;

function TFiscalProxyModel.Identificacao: IFiscalProxyIdentificacaoModel;
begin
  Result := FIdentificacao;
end;

class function TFiscalProxyModel.New(Parent: IFiscalModel): IFiscalProxyModel;
begin
  Result := Self.Create(Parent);
end;

function TFiscalProxyModel.Pagamento: IFiscalProxyPagamentoListaModel;
begin
  Result := FPagamento;
end;

function TFiscalProxyModel.Produto: IFiscalProxyProdutoListaModel;
begin
  Result := FProduto;
end;

end.
