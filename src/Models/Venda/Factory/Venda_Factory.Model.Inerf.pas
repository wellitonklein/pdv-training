unit Venda_Factory.Model.Inerf;

interface

uses
  Venda.Model.Inerf;

type

  IVendaFactoryModel = interface
    ['{23E00221-240B-48DF-AB6E-FEF59ADD541E}']
    function Venda: IVendaModel;
  end;

implementation

end.
