unit Cliente_Metodo_Factory.Model.Interf;

interface

uses
  Cliente.Model.Interf;

type

  IClienteMetodoFactoryModel = interface
    ['{E8656EBD-920C-4A42-A36C-9E25094A8FE2}']
    function Saldo(Parent: IClienteModel): IClienteMetodoSaldoModel;
    function Buscar(Parent: IClienteModel): IClienteMetodoBuscarModel;
  end;

implementation

end.
