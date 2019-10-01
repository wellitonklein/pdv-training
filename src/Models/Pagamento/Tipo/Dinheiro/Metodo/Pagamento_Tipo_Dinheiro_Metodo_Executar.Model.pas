unit Pagamento_Tipo_Dinheiro_Metodo_Executar.Model;

interface

uses
  Pagamento.Model.Interf, Venda.Model.Inerf;

type
  TPagamentoTipoDinheiroMetodoExecutarModel = class(TInterfacedObject, IPagamentoMetodoExecutarModel)
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
  PDVUpdates.Model, PDVUpdates_Type.Controller;

{ TPagamentoTipoDinheiroMetodoExecutarModel }

function TPagamentoTipoDinheiroMetodoExecutarModel.&End: IPagamentoTipoMetodoModel;
begin
  Result := FParent;
  Gravar;
  Fiscal;
end;

procedure TPagamentoTipoDinheiroMetodoExecutarModel.Fiscal;
begin
  FVenda.ModalidadeFiscal.Proxy.Pagamento
    .AddPagamento
      .Tipo(Integer(tpDinheiro))
      .Descricao('DINHEIRO')
      .Valor(FValor)
    .&End.EndPagamento
end;

procedure TPagamentoTipoDinheiroMetodoExecutarModel.Gravar;
begin
  FParent.&End.Entidade(TPDVUpdatesModel.New.Entidade.VendaPagamentos);
  FParent.&End.Entidade.VENDA := FVenda.Entidade.GUUID;
  FParent.&End.Entidade.TIPO := Integer(tpDinheiro);
  FParent.&End.Entidade.VALOR := FValor;
  FParent.&End.DAO.Insert(FParent.&End.Entidade);
end;

constructor TPagamentoTipoDinheiroMetodoExecutarModel.Create(Parent: IPagamentoTipoMetodoModel; Venda: IVendaModel);
begin
  FParent := Parent;
  FVenda  := Venda;
end;

destructor TPagamentoTipoDinheiroMetodoExecutarModel.Destroy;
begin

  inherited;
end;

class function TPagamentoTipoDinheiroMetodoExecutarModel.New(Parent: IPagamentoTipoMetodoModel; Venda: IVendaModel): IPagamentoMetodoExecutarModel;
begin
  Result := Self.Create(Parent, Venda);
end;

function TPagamentoTipoDinheiroMetodoExecutarModel.SetValor(
  Value: Currency): IPagamentoMetodoExecutarModel;
begin
  Result := Self;
  FValor := Value;
end;

end.
