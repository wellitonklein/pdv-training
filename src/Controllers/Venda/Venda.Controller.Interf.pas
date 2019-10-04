unit Venda.Controller.Interf;

interface

uses
  Venda.Model.Inerf;

type
  IVendaController = interface;
  IVendaMetodoController = interface;
  IVendaMetodoItemController = interface;

  IVendaController = interface
    ['{1A6D673C-1A5B-4196-ADA9-21C1F0234E41}']
    function Metodo: IVendaMetodoController;
    function Model: IVendaModel;
  end;

  IVendaMetodoController = interface
    ['{F18F4EF6-7078-45C0-BD34-EB08D5226047}']
    function Abrir: IVendaMetodoController;
    function Pagar: IVendaMetodoController;
    function Fechar: IVendaMetodoController;
    function IdentificarCliente: IVendaMetodoController;
    function VenderItem: IVendaMetodoItemController;
    function EfetuarPagamento: IVendaMetodoController;
    function EfetuarEstorno: IVendaMetodoController;
    function &End: IVendaController;
  end;

  IVendaMetodoItemController = interface
    ['{81929835-186A-4A7A-A2E3-15212ED5FDBB}']
    function Codigo(Value: SmallInt): IVendaMetodoItemController;
    function Quantidade(Value: Currency): IVendaMetodoItemController;
    function Desconto(Value: Currency): IVendaMetodoItemController;
    function Executar: IVendaMetodoItemController;
    function &End: IVendaMetodoController;
  end;

implementation

end.
