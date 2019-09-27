unit Cliente.Controller.Interf;

interface

type
  IClienteController = interface;
  IClienteMetodoController = interface;

  IClienteController = interface
    ['{A7B27EA1-9A76-49FA-9A70-75F8DB59D36E}']
    function Metodo: IClienteMetodoController;
  end;

  IClienteMetodoController = interface
    ['{E51519C8-B631-45A3-9DCB-AF7042E3630C}']
    function Saldo: IClienteMetodoController;
    function Buscar: IClienteMetodoController;
    function &End: IClienteController;
  end;

implementation

end.
