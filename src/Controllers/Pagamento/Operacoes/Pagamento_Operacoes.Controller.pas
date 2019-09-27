unit Pagamento_Operacoes.Controller;

interface

uses
  Pagamento_Operacoes.Controller.Interf,
  PDVUpdates_Type.Controller,
  System.Generics.Collections;

type
  TPagamentoOperacoesController = class(TInterfacedObject,
    IPagamentoOperacoesController, IPagamentoOperacoesSelecionarTipoController)
  private
    FLista: TList<TRecordPagamento>;
    FResult: TRecordPagamento;
    FTitle, FTextConfirm, FTextCancel: string;
    procedure PreencherLista;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IPagamentoOperacoesController;

    // IPagamentoOperacoesController
    function SelecionarTipo: IPagamentoOperacoesSelecionarTipoController;

    // IPagamentoOperacoesSelecionarTipoController
    function SetTitle(Value: string): IPagamentoOperacoesSelecionarTipoController;
    function SetTextConfirm(Value: string): IPagamentoOperacoesSelecionarTipoController;
    function SetTextCancel(Value: string): IPagamentoOperacoesSelecionarTipoController;
    function &End(var Value: TRecordPagamento): IPagamentoOperacoesController;
  end;

implementation

uses
  Dialog_PagamentoView, System.SysUtils;

{ TPagamentoOperacoesController }

function TPagamentoOperacoesController.&End(var Value: TRecordPagamento): IPagamentoOperacoesController;
begin
  Result := Self;

  TDialogPagamentoView.New(nil)
    .ExibirForm(
      FTitle,
      FTextConfirm,
      FTextCancel,
      FLista,
      FResult
    );

  Value := FResult;
end;

procedure TPagamentoOperacoesController.PreencherLista;
var
  Pagamento: TRecordPagamento;
begin
  Pagamento.Descricao := 'Dinheiro';
  Pagamento.Tipo := tpDinheiro;
  FLista.Add(Pagamento);
  Pagamento.Descricao := 'Cartão de Crédito';
  Pagamento.Tipo := tpCartaoCredito;
  FLista.Add(Pagamento);
end;

constructor TPagamentoOperacoesController.Create;
begin
  FTitle := '';
  FTextConfirm := '';
  FTextCancel := '';

  FLista := TList<TRecordPagamento>.Create;
  PreencherLista;
end;

destructor TPagamentoOperacoesController.Destroy;
begin
  FreeAndNil(FLista);
  inherited;
end;

class function TPagamentoOperacoesController.New: IPagamentoOperacoesController;
begin
  Result := Self.Create;
end;

function TPagamentoOperacoesController.SelecionarTipo: IPagamentoOperacoesSelecionarTipoController;
begin
  Result := Self;
end;

function TPagamentoOperacoesController.SetTextCancel(
  Value: string): IPagamentoOperacoesSelecionarTipoController;
begin
  Result := Self;
  FTextCancel := Value;
end;

function TPagamentoOperacoesController.SetTextConfirm(
  Value: string): IPagamentoOperacoesSelecionarTipoController;
begin
  Result := Self;
  FTextConfirm := Value;
end;

function TPagamentoOperacoesController.SetTitle(
  Value: string): IPagamentoOperacoesSelecionarTipoController;
begin
  Result := Self;
  FTitle := Value;
end;

end.
