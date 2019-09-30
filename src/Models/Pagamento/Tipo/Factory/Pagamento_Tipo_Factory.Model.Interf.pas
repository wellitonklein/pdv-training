unit Pagamento_Tipo_Factory.Model.Interf;

interface

uses
  Pagamento.Model.Interf,
  Venda.Model.Inerf;

type

  IPagamentoTipoFactoryModel = interface
    ['{F9B50FE5-0A54-4FDF-80A1-2E89AC72A202}']
    function Dinheiro(Parent: IPagamentoModel; Venda: IVendaModel): IPagamentoTipoMetodoModel;
    function CartaoCredito(Parent: IPagamentoModel; Venda: IVendaModel): IPagamentoTipoMetodoModel;
  end;

implementation

end.
