unit Item_Metodo_Factory.Model.Interf;

interface

uses
  Item.Model.Interf;

type

  IItemMetodoFactoryModel = interface
    ['{1CF15768-F9DD-4725-99D6-8ABDAA229A35}']
    function Vender(Parent: IItemModel): IItemMetodoVenderModel;
    function Cancelar(Parent: IItemModel): IItemMetodoCancelarModel;
    function Desconto(Parent: IItemModel): IItemMetodoDescontoModel;
    function Acrescimo(Parent: IItemModel): IItemMetodoAcrescimoModel;
    function Repetir(Parent: IItemModel): IItemMetodoRepetirModel;
  end;

implementation

end.
