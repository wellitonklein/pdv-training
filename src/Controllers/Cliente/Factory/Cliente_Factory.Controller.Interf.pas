unit Cliente_Factory.Controller.Interf;

interface

uses
  Cliente.Controller.Interf;

type

  IClienteFactoryController = interface
    ['{FE66B771-3329-4D5E-90A6-C0E9373B013E}']
    function Cliente: IClienteController;
  end;

implementation

end.
