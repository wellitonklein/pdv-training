unit Item_Factory.Controller.Interf;

interface

uses
  Item.Controller.Interf, Venda.Controller.Interf;

type

  IItemFactoryController = interface
    ['{5F0D013A-8BCE-495E-BA4B-E72C59D3A4ED}']
    function Item(Venda: IVendaController): IItemController;
  end;

implementation

end.
