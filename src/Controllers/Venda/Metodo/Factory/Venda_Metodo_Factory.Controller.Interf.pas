unit Venda_Metodo_Factory.Controller.Interf;

interface

uses
  Venda.Controller.Interf;

type

  IVendaMetodoFactoryController = interface
    ['{81570E1C-99D1-47B1-996D-A03CB90A4BAB}']
    function Item(Parent: IVendaController): IVendaMetodoItemController;
  end;

implementation

end.
