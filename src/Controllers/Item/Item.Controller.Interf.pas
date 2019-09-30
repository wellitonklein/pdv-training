unit Item.Controller.Interf;

interface

uses
  Venda.Controller.Interf;

type
  IItemController = interface;
  IItemMetodoController = interface;

  IItemController = interface
    ['{A5AB7B77-483F-42F9-8853-3D9049CA034A}']
    function Metodo: IItemMetodoController;
    function Venda: IVendaController;
  end;

  IItemMetodoController = interface
    ['{451D1AF6-AF23-4280-8A82-B1766EF7D508}']
    function Vender: IItemMetodoController;
    function Cancelar: IItemMetodoController;
    function Desconto: IItemMetodoController;
    function Acrescimo: IItemMetodoController;
    function Repetir: IItemMetodoController;
    function &End: IItemController;
  end;

implementation

end.
