unit Pagamento_Tipo_CartaoCredito_Metodo_Executar.Model;

interface

uses
  Pagamento.Model.Interf, Venda.Model.Inerf;

type
  TPagamentoTipoCartaoCreditoMetodoExecutarModel = class(TInterfacedObject, IPagamentoMetodoExecutarModel)
  private
    FParent: IPagamentoTipoMetodoModel;
    FVenda: IVendaModel;
    FValor: Currency;
    procedure Gravar;
    procedure Fiscal;
  public
    constructor Create(Parent: IPagamentoTipoMetodoModel; Venda: IVendaModel);
    destructor Destroy; override;
    class function New(Parent: IPagamentoTipoMetodoModel; Venda: IVendaModel): IPagamentoMetodoExecutarModel;
    function SetValor(Value: Currency): IPagamentoMetodoExecutarModel;
    function &End: IPagamentoTipoMetodoModel;
  end;

implementation

uses
  PDVUpdates.Model,
  PDVUpdates_Type.Controller;

{ TPagamentoTipoCartaoCreditoMetodoExecutarModel }

function TPagamentoTipoCartaoCreditoMetodoExecutarModel.&End: IPagamentoTipoMetodoModel;
begin
  Result := FParent;
  Gravar;
  Fiscal;
end;

procedure TPagamentoTipoCartaoCreditoMetodoExecutarModel.Fiscal;
begin
  FVenda.ModalidadeFiscal.Proxy.Pagamento
    .AddPagamento
      .Tipo(Integer(tpCartaoCredito))
      .Descricao('CARTAO DE CREDITO')
      .Valor(FValor)
    .&End.EndPagamento
end;

procedure TPagamentoTipoCartaoCreditoMetodoExecutarModel.Gravar;
begin
  FParent.&End.Entidade(TPDVUpdatesModel.New.Entidade.VendaPagamentos);
  FParent.&End.Entidade.VENDA := FVenda.Entidade.GUUID;
  FParent.&End.Entidade.TIPO := Integer(tpCartaoCredito);
  FParent.&End.Entidade.VALOR := FValor;
  FParent.&End.DAO.Insert(FParent.&End.Entidade);
end;

constructor TPagamentoTipoCartaoCreditoMetodoExecutarModel.Create(Parent: IPagamentoTipoMetodoModel; Venda: IVendaModel);
begin
  FParent := Parent;
  FVenda  := Venda;
end;

destructor TPagamentoTipoCartaoCreditoMetodoExecutarModel.Destroy;
begin

  inherited;
end;

class function TPagamentoTipoCartaoCreditoMetodoExecutarModel.New(Parent: IPagamentoTipoMetodoModel; Venda: IVendaModel): IPagamentoMetodoExecutarModel;
begin
  Result := Self.Create(Parent, Venda);
end;

function TPagamentoTipoCartaoCreditoMetodoExecutarModel.SetValor(
  Value: Currency): IPagamentoMetodoExecutarModel;
begin
  Result := Self;
  FValor := Value;
end;

end.
