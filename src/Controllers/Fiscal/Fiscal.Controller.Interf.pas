unit Fiscal.Controller.Interf;

interface

uses
  Fiscal.Model.Interf;

type

  IFiscalController = interface
    ['{254AB844-EFBF-44ED-9249-52BC6AD4576A}']
    function ProxyFiscal: IFiscalModel;
  end;

implementation

end.
