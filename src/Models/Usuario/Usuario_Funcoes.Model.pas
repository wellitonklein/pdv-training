unit Usuario_Funcoes.Model;

interface

uses
  Usuario.Model.Interf, System.Generics.Collections, PDVUpdates_Type.Controller;

type
  TUsuarioFuncoesModel = class(TInterfacedObject, IUsuarioFuncoesModel)
  private
    FParent: IUsuarioModel;
  public
    constructor Create(Parent: IUsuarioModel);
    destructor Destroy; override;
    class function New(Parent: IUsuarioModel): IUsuarioFuncoesModel;
    function ListaSenha(var Lista: TList<TRecordSenha>; Tipo: TTypeUsuario): IUsuarioFuncoesModel;
    function &End: IUsuarioModel;
  end;

implementation

{ TUsuarioFuncoesModel }

uses Entidade_Usuario.Model;

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

function TUsuarioFuncoesModel.ListaSenha(var Lista: TList<TRecordSenha>; Tipo: TTypeUsuario): IUsuarioFuncoesModel;
var
  Usuario: TRecordSenha;
  I: Integer;
  FListaUsuario: TList<TUSUARIO>;
begin
  Result := Self;

  case Tipo of
    tuCaixa:   FListaUsuario := FParent.DAO.FindWhere('TIPO = 0');
    tuFiscal:   FListaUsuario := FParent.DAO.FindWhere('TIPO = 1');
    tuGerente:  FListaUsuario := FParent.DAO.FindWhere('TIPO = 2');
  end;

  for I := 0 to Pred(FListaUsuario.Count) do
  begin
    Usuario.Nome  := FListaUsuario[I].NOME;
    Usuario.Senha := FListaUsuario[I].SENHA;
    Lista.Add(Usuario);
  end;
end;

class function TUsuarioFuncoesModel.New(Parent: IUsuarioModel): IUsuarioFuncoesModel;
begin
  Result := Self.Create(Parent);
end;

end.
