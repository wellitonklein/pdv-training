unit Usuario_Tipo_Caixa.Model;

interface

uses
  Usuario.Model.Interf,
  Usuario_Operacoes.Controller.Interf,
  System.Generics.Collections, Entidade_Usuario.Model;

type
  TUsuarioTipoCaixaModel = class(TInterfacedObject, IUsuarioMetodoModel)
  private
    FParent: IUsuarioModel;
    FResponsibility: IUsuarioMetodoModel;
    FOperacao: IUsuarioOperacoesController;
    FLista: TObjectList<TUsuario>;
    FResult: TUsuario;
    procedure PedirSenha;
  public
    constructor Create(Parent: IUsuarioModel); overload;
    constructor Create(Parent: IUsuarioModel;
      NextResponsibility: IUsuarioMetodoModel); overload;
    destructor Destroy; override;
    class function New(Parent: IUsuarioModel): IUsuarioMetodoModel; overload;
    class function New(Parent: IUsuarioModel;
      NextResponsibility: IUsuarioMetodoModel): IUsuarioMetodoModel; overload;

    // IUsuarioMetodoModel
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

implementation

uses
  PDVUpdates_Type.Controller;

{ TUsuarioTipoCaixaModel }

function TUsuarioTipoCaixaModel.AbrirCaixa: IUsuarioMetodoModel;
begin
  Result := Self;
  FResponsibility.AbrirCaixa;
end;

function TUsuarioTipoCaixaModel.Suprimento: IUsuarioMetodoModel;
begin
  Result := Self;
  PedirSenha;
//  FResponsibility.Suprimento;
end;

function TUsuarioTipoCaixaModel.TrocarOperador: IUsuarioMetodoModel;
begin
  Result := Self;
  FResponsibility.TrocarOperador;
end;

function TUsuarioTipoCaixaModel.BloquearCaixa: IUsuarioMetodoModel;
begin
  Result := Self;
  PedirSenha;
//  FResponsibility.BloquearCaixa;
end;

function TUsuarioTipoCaixaModel.CancelarCupom: IUsuarioMetodoModel;
begin
  Result := Self;
  FResponsibility.CancelarCupom;
end;

function TUsuarioTipoCaixaModel.CancelarItem: IUsuarioMetodoModel;
begin
  Result := Self;
  FResponsibility.CancelarItem;
end;

constructor TUsuarioTipoCaixaModel.Create(Parent: IUsuarioModel;
  NextResponsibility: IUsuarioMetodoModel);
var
  Usuario: TUsuario;
begin
  FParent := Parent;
  FResponsibility := NextResponsibility;
  FLista := TObjectList<TUsuario>.Create;
  FParent.Funcoes.ListaSenha(FLista, tuCaixa);
end;

function TUsuarioTipoCaixaModel.&End: IUsuarioModel;
begin
  Result := FParent;
end;

constructor TUsuarioTipoCaixaModel.Create(Parent: IUsuarioModel);
begin
  FParent := Parent;
end;

function TUsuarioTipoCaixaModel.DesbloquearCaixa: IUsuarioMetodoModel;
begin
  Result := Self;
  PedirSenha;
//  FResponsibility.DesbloquearCaixa;
end;

function TUsuarioTipoCaixaModel.Sangria: IUsuarioMetodoModel;
begin
  Result := Self;
  FResponsibility.Sangria;
end;

destructor TUsuarioTipoCaixaModel.Destroy;
begin

  inherited;
end;

function TUsuarioTipoCaixaModel.DevolverCupom: IUsuarioMetodoModel;
begin
  Result := Self;
  FResponsibility.DevolverCupom;
end;

function TUsuarioTipoCaixaModel.DevolverItem: IUsuarioMetodoModel;
begin
  Result := Self;
  FResponsibility.DevolverItem;
end;

function TUsuarioTipoCaixaModel.FecharCaixa: IUsuarioMetodoModel;
begin
  Result := Self;
  FResponsibility.FecharCaixa;
end;

class function TUsuarioTipoCaixaModel.New(Parent: IUsuarioModel;
  NextResponsibility: IUsuarioMetodoModel): IUsuarioMetodoModel;
begin
  Result := Self.Create(Parent, NextResponsibility);
end;

procedure TUsuarioTipoCaixaModel.PedirSenha;
begin
  if (FLista.Count <= 0) then Exit;

  FOperacao.PedirSenha
    .SetTitle('Entre com a senha do Caixa')
    .SetTextConfirm('Confirmar')
    .SetTextCancel('Cancelar')
    .Lista(FLista)
    .Result(FResult)
  .&End;
  FParent.Entidade(FResult);
end;

function TUsuarioTipoCaixaModel.SetOperacao(
  Value: IUsuarioOperacoesController): IUsuarioMetodoModel;
begin
  Result := Self;
  FOperacao := Value;
end;

class function TUsuarioTipoCaixaModel.New(Parent: IUsuarioModel)
  : IUsuarioMetodoModel;
begin
  Result := Self.Create(Parent);
end;

end.
