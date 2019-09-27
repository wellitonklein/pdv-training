unit Usuario_Tipo_Factory.Model.Interf;

interface

uses
  Usuario.Model.Interf,
  PDVUpdates_Type.Controller;

type

  IUsuarioTipoFactoryModel = interface
    ['{79B69829-6B28-4CDA-9544-356C1B10D381}']
    function UsuarioTipo(Parent: IUsuarioModel; Tipo: TTypeUsuario;
      NextResponsibility: IUsuarioMetodoModel = nil): IUsuarioMetodoModel;
  end;

implementation

end.
