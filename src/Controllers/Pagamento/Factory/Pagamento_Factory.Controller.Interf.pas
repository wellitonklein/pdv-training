unit Pagamento_Factory.Controller.Interf;

interface

uses
  Pagamento.Controller.Interf,
  Pagamento_Operacoes.Controller.Interf;

type

  IPagamentoFactoryController = interface
    ['{FFB7C1EA-9649-4E65-B2DD-67B9771F1C6F}']
    function Pagamento: IPagamentoController;
    function Operacoes: IPagamentoOperacoesController;
  end;

implementation

end.
