unit Item_State_Factory.Model.Interf;

interface

uses
  Item.Model.Interf;

type

  IItemStateFactoryModel = interface
    ['{068385BA-074F-4361-81EF-74BB83670F64}']
    function Ativo: IItemMetodoModel;
    function Inativo: IItemMetodoModel;
    function Vendido: IItemMetodoModel;
  end;

implementation

end.
