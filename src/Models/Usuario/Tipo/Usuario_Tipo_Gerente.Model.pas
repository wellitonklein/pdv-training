unit Usuario_Tipo_Gerente.Model;

interface

uses
  Usuario.Model.Interf,
  Usuario_Operacoes.Controller.Interf, PDVUpdates_Type.Controller,
  System.Classes, System.Generics.Collections, Entidade_Usuario.Model;

type
  TUsuarioTipoGerenteModel = class(TInterfacedObject, IUsuarioMetodoModel)
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

{ TUsuarioTipoGerenteModel }

function TUsuarioTipoGerenteModel.AbrirCaixa: IUsuarioMetodoModel;
begin
  Result := Self;
  FResponsibility.AbrirCaixa;
end;

function TUsuarioTipoGerenteModel.Suprimento: IUsuarioMetodoModel;
begin
  Result := Self;
  FResponsibility.Suprimento;
end;

function TUsuarioTipoGerenteModel.TrocarOperador: IUsuarioMetodoModel;
begin
  Result := Self;
  FResponsibility.TrocarOperador;
end;

function TUsuarioTipoGerenteModel.BloquearCaixa: IUsuarioMetodoModel;
begin
  Result := Self;
  FResponsibility.BloquearCaixa;
end;

function TUsuarioTipoGerenteModel.CancelarCupom: IUsuarioMetodoModel;
begin
  Result := Self;
  FResponsibility.CancelarCupom;
end;

function TUsuarioTipoGerenteModel.CancelarItem: IUsuarioMetodoModel;
begin
  Result := Self;
  FResponsibility.CancelarItem;
end;

constructor TUsuarioTipoGerenteModel.Create(Parent: IUsuarioModel;
  NextResponsibility: IUsuarioMetodoModel);
begin
  FParent := Parent;
  FResponsibility := NextResponsibility;
  FLista := TObjectList<TUsuario>.Create;
  FParent.Funcoes.ListaSenha(FLista, tuGerente);
end;

function TUsuarioTipoGerenteModel.&End: IUsuarioModel;
begin
  Result := FParent;
end;

constructor TUsuarioTipoGerenteModel.Create(Parent: IUsuarioModel);
begin
  FParent := Parent;
end;

function TUsuarioTipoGerenteModel.DesbloquearCaixa: IUsuarioMetodoModel;
begin
  Result := Self;
  FResponsibility.DesbloquearCaixa;
end;

function TUsuarioTipoGerenteModel.Sangria: IUsuarioMetodoModel;
begin
  Result := Self;
  FResponsibility.Sangria;
end;

destructor TUsuarioTipoGerenteModel.Destroy;
begin

  inherited;
end;

function TUsuarioTipoGerenteModel.DevolverCupom: IUsuarioMetodoModel;
begin
  Result := Self;
  FResponsibility.DevolverCupom;
end;

function TUsuarioTipoGerenteModel.DevolverItem: IUsuarioMetodoModel;
begin
  Result := Self;
  FResponsibility.DevolverItem;
end;

function TUsuarioTipoGerenteModel.FecharCaixa: IUsuarioMetodoModel;
begin
  Result := Self;
  FResponsibility.FecharCaixa;
end;

class function TUsuarioTipoGerenteModel.New(Parent: IUsuarioModel;
  NextResponsibility: IUsuarioMetodoModel): IUsuarioMetodoModel;
begin
  Result := Self.Create(Parent, NextResponsibility);
end;

procedure TUsuarioTipoGerenteModel.PedirSenha;
begin
  if (FLista.Count <= 0) then Exit;

  FOperacao.PedirSenha
    .SetTitle('Entre com a senha do Gerente')
    .SetTextConfirm('Confirmar')
    .SetTextCancel('Cancelar')
    .Lista(FLista)
    .Result(FResult)
  .&End;
  FParent.Entidade(FResult);
end;

function TUsuarioTipoGerenteModel.SetOperacao(
  Value: IUsuarioOperacoesController): IUsuarioMetodoModel;
begin
  Result := Self;
  FOperacao := Value;
end;

class function TUsuarioTipoGerenteModel.New(Parent: IUsuarioModel)
  : IUsuarioMetodoModel;
begin
  Result := Self.Create(Parent);
end;

end.
