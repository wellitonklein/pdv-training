unit Pagamento_Factory.Model.Interf;

interface

uses
  Pagamento.Model.Interf, Venda.Model.Inerf;

type

  IPagamentoFactoryModel = interface
    ['{08BB11B1-19FB-4BDF-B2FE-A7B321F92052}']
    function Pagamento(Venda: IVendaModel): IPagamentoModel;
    function Iterator(Parent: IPagamentoModel): IPagamentoIteratorModel;
  end;

implementation

end.
