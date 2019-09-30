unit Item_Factory.Model.Interf;

interface

uses
  Item.Model.Interf, Venda.Model.Inerf;

type

  IItemFactoryModel = interface
    ['{E812AFDC-AFB7-4577-8E0B-02AD455B91EF}']
    function Item(Venda: IVendaModel): IItemModel;
    function Iterator(Parent: IItemModel): IItemIteratorModel;
  end;

implementation

end.
