unit Pagamento.Controller;

interface

uses
  Pagamento.Controller.Interf,
  Pagamento.Model.Interf, Venda.Controller.Interf;

type
  TPagamentoController = class(TInterfacedObject, IPagamentoController)
  private
    FModel: IPagamentoModel;
    FVenda: IVendaController;
  public
    constructor Create(Venda: IVendaController);
    destructor Destroy; override;
    class function New(Venda: IVendaController): IPagamentoController;
    function Model: IPagamentoModel;
    function Executar: IPagamentoMetodoController;
    function Estornar: IPagamentoMetodoController;
    function Venda: IVendaController;
  end;

implementation

uses
  Pagamento_Tipo_Factory.Controller,
  PDVUpdates.Model,
  PDVUpdates_Type.Controller,
  Pagamento_Factory.Controller;

{ TPagamentoController }

constructor TPagamentoController.Create(Venda: IVendaController);
begin
  FVenda := Venda;
  FModel := TPDVUpdatesModel.New.Pagamento(Venda.Model);
end;

destructor TPagamentoController.Destroy;
begin

  inherited;
end;

function TPagamentoController.Estornar: IPagamentoMetodoController;
var
  FPagamento: TRecordPagamento;
begin
  TPagamentoFactoryController.New.Operacoes
    .SelecionarTipo
      .SetTitle('Selecione o tipo do Pagamento')
      .SetTextConfirm('Confirmar')
      .SetTextCancel('Cancelar')
    .&End(FPagamento);

  case FPagamento.Tipo of
    tpDinheiro:
      Result := TPagamentoTipoFactoryController.New.Dinheiro(Self, FVenda).Estornar;
    tpCartaoCredito:
      Result := TPagamentoTipoFactoryController.New.CartaoCredito(Self, FVenda).Estornar;
  end;
end;

function TPagamentoController.Executar: IPagamentoMetodoController;
var
  FPagamento: TRecordPagamento;
begin
  TPagamentoFactoryController.New.Operacoes
    .SelecionarTipo
      .SetTitle('Selecione o tipo do Pagamento')
      .SetTextConfirm('Confirmar')
      .SetTextCancel('Cancelar')
    .&End(FPagamento);

  case FPagamento.Tipo of
    tpDinheiro:
      Result := TPagamentoTipoFactoryController.New.Dinheiro(Self, FVenda).Executar;
    tpCartaoCredito:
      Result := TPagamentoTipoFactoryController.New.CartaoCredito(Self, FVenda).Executar;
  end;
end;

function TPagamentoController.Model: IPagamentoModel;
begin
  Result := FModel;
end;

class function TPagamentoController.New(Venda: IVendaController): IPagamentoController;
begin
  Result := Self.Create(Venda);
end;

function TPagamentoController.Venda: IVendaController;
begin
  Result := FVenda;
end;

end.
