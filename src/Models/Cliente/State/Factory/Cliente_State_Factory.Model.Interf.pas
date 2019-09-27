unit Cliente_State_Factory.Model.Interf;

interface

uses
  Cliente.Model.Interf;

type

  IClienteStateFactoryModel = interface
    ['{24410E7D-587B-4C20-B05E-C6454AEC57D2}']
    function Ativo(Parent: IClienteModel): IClienteMetodoModel;
    function Inativo(Parent: IClienteModel): IClienteMetodoModel;
    function Bloqueado(Parent: IClienteModel): IClienteMetodoModel;
  end;

implementation

end.
