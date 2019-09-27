unit Usuario.Model.Interf;

interface

uses
  // ORMBr
  ormbr.container.objectset.interfaces,

  Entidade_Usuario.Model,
  Usuario_Operacoes.Controller.Interf, PDVUpdates_Type.Controller,
  System.Generics.Collections;

type
  IUsuarioModel = interface;
  IUsuarioMetodoModel = interface;
  IUsuarioFuncoesModel = interface;
  IUsuarioIteratorModel = interface;

  IUsuarioModel = interface
    ['{53C70CA1-94A2-4D66-9452-84BF1F8549DC}']
    function Metodo(Value: IUsuarioMetodoModel): IUsuarioMetodoModel;
    function Iterator: IUsuarioIteratorModel;
    function Entidade: TUsuario;
    function DAO: IContainerObjectSet<TUSUARIO>;
    function Funcoes: IUsuarioFuncoesModel;
  end;

  IUsuarioMetodoModel = interface
    ['{8A268D2C-B242-4B27-926B-D693582C6F27}']
    function SetOperacao(Value: IUsuarioOperacoesController): IUsuarioMetodoModel;
    function AbrirCaixa: IUsuarioMetodoModel;
    function FecharCaixa: IUsuarioMetodoModel;
    function Sangria: IUsuarioMetodoModel;
    function Suprimento: IUsuarioMetodoModel;
    function CancelarCupom: IUsuarioMetodoModel;
    function DevolverCupom: IUsuarioMetodoModel;
    function CancelarItem: IUsuarioMetodoModel;
    function DevolverItem: IUsuarioMetodoModel;
    function BloquearCaixa: IUsuarioMetodoModel;
    function DesbloquearCaixa: IUsuarioMetodoModel;
    function TrocarOperador: IUsuarioMetodoModel;
    function &End: IUsuarioModel;
  end;

  IUsuarioFuncoesModel = interface
    ['{F3FE7867-CBB4-413C-B1BF-D5EF0DB3151B}']
    function ListaSenha(var Lista: TList<TRecordSenha>; Tipo: TTypeUsuario): IUsuarioFuncoesModel;
    function &End: IUsuarioModel;
  end;

  IUsuarioIteratorModel = interface
    ['{6F534029-7969-40D0-B837-D28C34A9DFEB}']
    function hasNext: Boolean;
    function Next: IUsuarioModel;
    function Add(Value: IUsuarioModel): IUsuarioIteratorModel;
    function &End: IUsuarioModel;
  end;

implementation

end.
