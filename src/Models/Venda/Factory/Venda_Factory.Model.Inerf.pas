unit Venda_Factory.Model.Inerf;

interface

uses
  Venda.Model.Inerf,
  Caixa.Model.interf;

type

  IVendaFactoryModel = interface
    ['{23E00221-240B-48DF-AB6E-FEF59ADD541E}']
    function Venda(Caixa: ICaixaModel): IVendaModel;
  end;

implementation

end.
