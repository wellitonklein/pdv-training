unit Cliente_Factory.Model.Interf;

interface

uses
  Cliente.Model.Interf;

type

  IClienteFactoryModel = interface
    ['{02B211A8-7F3C-4E42-930A-94501ADA5088}']
    function Cliente: IClienteModel;
  end;

implementation

end.
