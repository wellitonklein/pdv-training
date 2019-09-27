unit Pagamento_Operacoes.Controller.Interf;

interface

uses
  PDVUpdates_Type.Controller;

type
  IPagamentoOperacoesController = interface;
  IPagamentoOperacoesSelecionarTipoController = interface;

  IPagamentoOperacoesController = interface
    ['{4C8DE614-2A24-4816-9B6E-28262442054F}']
    function SelecionarTipo: IPagamentoOperacoesSelecionarTipoController;
  end;

  IPagamentoOperacoesSelecionarTipoController = interface
    ['{29FA2703-F418-43B1-8A95-FAEBDC02CE7C}']
    function SetTitle(Value: string): IPagamentoOperacoesSelecionarTipoController;
    function SetTextConfirm(Value: string): IPagamentoOperacoesSelecionarTipoController;
    function SetTextCancel(Value: string): IPagamentoOperacoesSelecionarTipoController;
    function &End(var Value: TRecordPagamento): IPagamentoOperacoesController;
  end;

implementation

end.
