unit Empresa.Model.Interf;

interface

uses
  Entidade_Empresa.Model,
  ormbr.container.objectset.interfaces;

type
  IEmpresaModel = interface;
  IEmpresaMetodoModel = interface;

  IEmpresaModel = interface
    ['{BBE74428-182E-4CF6-9DEB-7CD53F9A8AC0}']
    function Metodo: IEmpresaMetodoModel;
    function SetState(Value: IEmpresaMetodoModel): IEmpresaModel;
    function Entidade: TEMPRESA; overload;
    function Entidade(Value: TEMPRESA): IEmpresaModel; overload;
    function DAO: IContainerObjectSet<TEMPRESA>;
  end;

  IEmpresaMetodoModel = interface
    ['{6C3EBE4D-EA33-4983-A494-A87E498092DD}']
  end;

implementation

end.
