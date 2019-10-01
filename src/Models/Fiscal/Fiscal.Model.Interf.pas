unit Fiscal.Model.Interf;

interface

uses
  Fiscal_Proxy.Model.Interf;

type
  IFiscalModel = interface;
  IFiscalComponente = interface;

  IFiscalModel = interface
    ['{25AC2E32-6DFD-4AFF-A85F-EB80765E6C30}']
    function Proxy(Value: IFiscalComponente): IFiscalProxyModel; overload;
    function Proxy: IFiscalProxyModel; overload;
    function NFCe: IFiscalComponente;
  end;

  IFiscalComponente = interface
    ['{B7961E97-C2DC-43BA-AB9E-7C255A0B31DD}']
    function Emitir(Proxy: IFiscalProxyModel): IFiscalComponente;
  end;

implementation

end.
