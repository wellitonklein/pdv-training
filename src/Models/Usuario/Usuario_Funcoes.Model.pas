unit Usuario_Funcoes.Model;

interface

uses
  Usuario.Model.Interf, System.Generics.Collections, PDVUpdates_Type.Controller,
  Entidade_Usuario.Model;

type
  TUsuarioFuncoesModel = class(TInterfacedObject, IUsuarioFuncoesModel)
  private
    FParent: IUsuarioModel;
  public
    constructor Create(Parent: IUsuarioModel);
    destructor Destroy; override;
    class function New(Parent: IUsuarioModel): IUsuarioFuncoesModel;
    function ListaSenha(var Lista: TObjectList<TUsuario>; Tipo: TTypeUsuario): IUsuarioFuncoesModel;
    function &End: IUsuarioModel;
  end;

implementation

{ TUsuarioFuncoesModel }

function TUsuarioFuncoesModel.&End: IUsuarioModel;
begin
  Result := FParent;
end;

constructor TUsuarioFuncoesModel.Create(Parent: IUsuarioModel);
begin
  FParent := Parent;
end;

destructor TUsuarioFuncoesModel.Destroy;
begin

  inherited;
end;

function TUsuarioFuncoesModel.ListaSenha(var Lista: TObjectList<TUsuario>; Tipo: TTypeUsuario): IUsuarioFuncoesModel;
begin
  Result := Self;

  case Tipo of
    tuCaixa:   Lista := FParent.DAO.FindWhere('TIPO = 0');
    tuFiscal:   Lista := FParent.DAO.FindWhere('TIPO = 1');
    tuGerente:  Lista := FParent.DAO.FindWhere('TIPO = 2');
  end;
end;

class function TUsuarioFuncoesModel.New(Parent: IUsuarioModel): IUsuarioFuncoesModel;
begin
  Result := Self.Create(Parent);
end;

end.
