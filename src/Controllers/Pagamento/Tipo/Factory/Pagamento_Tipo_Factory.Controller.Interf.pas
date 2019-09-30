unit Pagamento_Tipo_Factory.Controller.Interf;

interface

uses
  Pagamento.Controller.Interf, Venda.Controller.Interf;

type

  IPagamentoTipoFactoryController = interface
    ['{CE5D63CE-9183-4E60-8EBE-723923ACF551}']
    function Dinheiro(Parent: IPagamentoController; Venda: IVendaController): IPagamentoMetodoController;
    function CartaoCredito(Parent: IPagamentoController; Venda: IVendaController): IPagamentoMetodoController;
  end;

implementation

end.
