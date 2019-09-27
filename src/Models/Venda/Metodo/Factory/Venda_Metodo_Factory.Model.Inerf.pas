unit Venda_Metodo_Factory.Model.Inerf;

interface

uses
  Venda.Model.Inerf;

type

  IVendaMetodoFactoryModel = interface
    ['{1C3EE439-4145-423F-9867-4A2128B6BAAD}']
    function Abrir(Parent: IVendaModel): IVendaMetodoAbrirModel;
    function Pagar(Parent: IVendaModel): IVendaMetodoPagarModel;
    function Fechar(Parent: IVendaModel): IVendaMetodoFecharModel;
  end;

implementation

end.
