unit Fiscal.Model.Interf;

interface

uses
  Fiscal_Proxy.Model.Interf;

type

  IFiscalComponente = interface
    ['{B7961E97-C2DC-43BA-AB9E-7C255A0B31DD}']
//    function Driver: T;
    function Emitir(Proxy: IFiscalProxyModel): IFiscalComponente;
  end;

implementation

end.
