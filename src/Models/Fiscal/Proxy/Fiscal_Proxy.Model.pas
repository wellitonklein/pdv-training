unit Fiscal_Proxy.Model;

interface

uses
  Fiscal_Proxy.Model.Interf;

type
  TFiscalProxyModel = class(TInterfacedObject, IFiscalProxyModel)
  private
    FIdentificacao: IFiscalProxyIdentificacaoModel;
    FEmitente: IFiscalProxyEmitenteModel;
    FDestinatario: IFiscalProxyDestinatarioModel;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IFiscalProxyModel;
    function Identificacao: IFiscalProxyIdentificacaoModel;
    function Emitente: IFiscalProxyEmitenteModel;
    function Destinatario: IFiscalProxyDestinatarioModel;
//    function Produto: IFiscalProxyProdutoModel;
//    function Pagamento: IFiscalProxyPagamentoModel;
//    function Exec: IFiscalProxyModel;
  end;

implementation

uses
  Fiscal_Proxy_Factory.Model;

{ TFiscalProxyModel }

constructor TFiscalProxyModel.Create;
begin
  FIdentificacao := TFiscalProxyFactoryModel.New.Identificacao(Self);
  FEmitente := TFiscalProxyFactoryModel.New.Emitente(Self);
  FDestinatario := TFiscalProxyFactoryModel.New.Destinatario(Self);
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

function TFiscalProxyModel.Identificacao: IFiscalProxyIdentificacaoModel;
begin
  Result := FIdentificacao;
end;

class function TFiscalProxyModel.New: IFiscalProxyModel;
begin
  Result := Self.Create;
end;

end.
