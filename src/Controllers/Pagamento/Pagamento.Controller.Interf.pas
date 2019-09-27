unit Pagamento.Controller.Interf;

interface

uses
  Pagamento.Model.Interf;

type
  IPagamentoController = interface;
  IPagamentoMetodoController = interface;

  IPagamentoController = interface
    ['{64D3D980-9017-4865-86D8-2003DF2E99DB}']
    function Model: IPagamentoModel;
    function Executar: IPagamentoMetodoController;
    function Estornar: IPagamentoMetodoController;
  end;

  IPagamentoMetodoController = interface
    ['{F7D45FE5-EE5A-478D-8D09-E102235DDF49}']
    function Executar: IPagamentoMetodoController;
    function Estornar: IPagamentoMetodoController;
    function &End: IPagamentoController;
  end;

implementation

end.
