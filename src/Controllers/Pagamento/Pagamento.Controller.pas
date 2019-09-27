unit Pagamento.Controller;

interface

uses
  Pagamento.Controller.Interf,
  Pagamento.Model.Interf;

type
  TPagamentoController = class(TInterfacedObject, IPagamentoController)
  private
    FModel: IPagamentoModel;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IPagamentoController;
    function Model: IPagamentoModel;
    function Executar: IPagamentoMetodoController;
    function Estornar: IPagamentoMetodoController;
  end;

implementation

uses
  Pagamento_Tipo_Factory.Controller,
  PDVUpdates.Model,
  PDVUpdates_Type.Controller,
  Pagamento_Factory.Controller;

{ TPagamentoController }

constructor TPagamentoController.Create;
begin
  FModel := TPDVUpdatesModel.New.Pagamento;
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
      Result := TPagamentoTipoFactoryController.New.Dinheiro(Self).Estornar;
    tpCartaoCredito:
      Result := TPagamentoTipoFactoryController.New.CartaoCredito(Self).Estornar;
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
      Result := TPagamentoTipoFactoryController.New.Dinheiro(Self).Executar;
    tpCartaoCredito:
      Result := TPagamentoTipoFactoryController.New.CartaoCredito(Self).Executar;
  end;
end;

function TPagamentoController.Model: IPagamentoModel;
begin
  Result := FModel;
end;

class function TPagamentoController.New: IPagamentoController;
begin
  Result := Self.Create;
end;

end.
