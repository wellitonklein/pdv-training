unit Venda.Controller.Interf;

interface

type
  IVendaController = interface;
  IVendaMetodoController = interface;

  IVendaController = interface
    ['{1A6D673C-1A5B-4196-ADA9-21C1F0234E41}']
    function Metodo: IVendaMetodoController;
  end;

  IVendaMetodoController = interface
    ['{F18F4EF6-7078-45C0-BD34-EB08D5226047}']
    function Abrir: IVendaMetodoController;
    function Pagar: IVendaMetodoController;
    function Fechar: IVendaMetodoController;
    function IdentificarCliente: IVendaMetodoController;
    function VenderItem: IVendaMetodoController;
    function EfetuarPagamento: IVendaMetodoController;
    function EfetuarEstorno: IVendaMetodoController;
    function &End: IVendaController;
  end;

implementation

end.
