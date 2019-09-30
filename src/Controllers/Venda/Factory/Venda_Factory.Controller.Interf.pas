unit Venda_Factory.Controller.Interf;

interface

uses
  Venda.Controller.Interf, Caixa.Controller.Interf;

type

  IVendaFactoryController = interface
    ['{87862A04-8670-4598-AA10-CCA1D954F884}']
    function Venda(Caixa: ICaixaController): IVendaController;
  end;

implementation

end.
