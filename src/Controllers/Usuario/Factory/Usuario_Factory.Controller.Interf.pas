unit Usuario_Factory.Controller.Interf;

interface

uses
  Usuario.Controller.Interf,
  Usuario_Operacoes.Controller.Interf;

type

  IUsuarioFactoryController = interface
    ['{35370009-E8CA-480D-B30B-CCADBBFF9854}']
    function Usuario: IUsuarioController;
    function Operacoes: IUsuarioOperacoesController;
  end;

implementation

end.
