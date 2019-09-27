unit Usuario_Factory.Model.Interf;

interface

uses
  Usuario.Model.Interf;

type

  IUsuarioFactoryModel = interface
    ['{98E61C0C-5B18-4576-B9F6-61E7CE54E760}']
    function Usuario: IUsuarioModel;
    function Iterator(Parent: IUsuarioModel): IUsuarioIteratorModel;
    function Funcoes(Parent: IUsuarioModel): IUsuarioFuncoesModel;
  end;

implementation

end.
