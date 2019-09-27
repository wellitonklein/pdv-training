unit Item_Factory.Model.Interf;

interface

uses
  Item.Model.Interf;

type

  IItemFactoryModel = interface
    ['{E812AFDC-AFB7-4577-8E0B-02AD455B91EF}']
    function Item: IItemModel;
    function Iterator(Parent: IItemModel): IItemIteratorModel;
  end;

implementation

end.
