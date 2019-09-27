unit Entidade.Model.Interf;

interface

uses
  Entidade_Usuario.Model;

type

  IEntidadeFactoryModel = interface
    ['{EF7BE100-7722-404A-9674-D95D9CA1ABC4}']
    function Usuario: TUsuario;
  end;

implementation

end.
