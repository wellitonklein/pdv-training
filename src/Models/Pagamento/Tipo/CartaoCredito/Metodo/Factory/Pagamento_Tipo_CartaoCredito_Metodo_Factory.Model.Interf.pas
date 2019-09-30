unit Pagamento_Tipo_CartaoCredito_Metodo_Factory.Model.Interf;

interface

uses
  Pagamento.Model.Interf, Venda.Model.Inerf;

type

  IPagamentoTipoCartaoCreditoMetodoModel = interface
    ['{A634130F-C2A9-4BFE-B416-C5B9DA1B2EF3}']
    function Executar(Parent: IPagamentoTipoMetodoModel; Venda: IVendaModel): IPagamentoMetodoExecutarModel;
    function Estornar(Parent: IPagamentoTipoMetodoModel): IPagamentoMetodoEstornarModel;
  end;

implementation

end.
