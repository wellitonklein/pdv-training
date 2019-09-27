unit Venda_State_Factory.Model.Interf;

interface

uses
  Venda.Model.Inerf;

type

  IVendaStateFactoryModel = interface
    ['{5CAC3858-9F27-45A0-B799-E9B4D0BC8E93}']
    function Aberto: IVendaMetodoModel;
    function Pagamento: IVendaMetodoModel;
    function Fechado: IVendaMetodoModel;
  end;

implementation

end.
