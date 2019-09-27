unit Usuario_Tipo_Fiscal.Model;

interface

uses
  Usuario.Model.Interf,
  Usuario_Operacoes.Controller.Interf,
  PDVUpdates_Type.Controller,
  System.Generics.Collections,
  Entidade_Usuario.Model;

type
  TUsuarioTipoFiscalModel = class(TInterfacedObject, IUsuarioMetodoModel)
  private
    FParent: IUsuarioModel;
    FResponsibility: IUsuarioMetodoModel;
    FOperacao: IUsuarioOperacoesController;
    FLista: TList<TRecordSenha>;
    FResult: TRecordSenha;
    procedure OnConfirmSenha(Sender: TObject);
    procedure OnCancelSenha(Sender: TObject);
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
  System.SysUtils;

{ TUsuarioTipoFiscalModel }

function TUsuarioTipoFiscalModel.AbrirCaixa: IUsuarioMetodoModel;
begin
  Result := Self;
  PedirSenha;
//  FResponsibility.AbrirCaixa;
end;

function TUsuarioTipoFiscalModel.Suprimento: IUsuarioMetodoModel;
begin
  Result := Self;
  PedirSenha;
//  FResponsibility.Suprimento;
end;

function TUsuarioTipoFiscalModel.TrocarOperador: IUsuarioMetodoModel;
begin
  Result := Self;
  PedirSenha;
//  FResponsibility.TrocarOperador;
end;

function TUsuarioTipoFiscalModel.BloquearCaixa: IUsuarioMetodoModel;
begin
  Result := Self;
  PedirSenha;
//  FResponsibility.BloquearCaixa;
end;

function TUsuarioTipoFiscalModel.CancelarCupom: IUsuarioMetodoModel;
begin
  Result := Self;
  PedirSenha;
//  FResponsibility.CancelarCupom;
end;

function TUsuarioTipoFiscalModel.CancelarItem: IUsuarioMetodoModel;
begin
  Result := Self;
  PedirSenha;
//  FResponsibility.CancelarItem;
end;

constructor TUsuarioTipoFiscalModel.Create(Parent: IUsuarioModel;
  NextResponsibility: IUsuarioMetodoModel);
begin
  FParent := Parent;
  FResponsibility := NextResponsibility;
  FLista := TList<TRecordSenha>.Create;
  FParent.Funcoes.ListaSenha(FLista, tuFiscal);
end;

function TUsuarioTipoFiscalModel.&End: IUsuarioModel;
begin
  Result := FParent;
end;

constructor TUsuarioTipoFiscalModel.Create(Parent: IUsuarioModel);
begin
  FParent := Parent;
end;

function TUsuarioTipoFiscalModel.DesbloquearCaixa: IUsuarioMetodoModel;
begin
  Result := Self;
  PedirSenha;
//  FResponsibility.DesbloquearCaixa;
end;

function TUsuarioTipoFiscalModel.Sangria: IUsuarioMetodoModel;
begin
  Result := Self;
  PedirSenha;
//  FResponsibility.Sangria;
end;

destructor TUsuarioTipoFiscalModel.Destroy;
begin
  FreeAndNil(FLista);
  inherited;
end;

function TUsuarioTipoFiscalModel.DevolverCupom: IUsuarioMetodoModel;
begin
  Result := Self;
  PedirSenha;
//  FResponsibility.DevolverCupom;
end;

function TUsuarioTipoFiscalModel.DevolverItem: IUsuarioMetodoModel;
begin
  Result := Self;
  PedirSenha;
//  FResponsibility.DevolverItem;
end;

function TUsuarioTipoFiscalModel.FecharCaixa: IUsuarioMetodoModel;
begin
  Result := Self;
  PedirSenha;
//  FResponsibility.FecharCaixa;
end;

class function TUsuarioTipoFiscalModel.New(Parent: IUsuarioModel;
  NextResponsibility: IUsuarioMetodoModel): IUsuarioMetodoModel;
begin
  Result := Self.Create(Parent, NextResponsibility);
end;

procedure TUsuarioTipoFiscalModel.OnCancelSenha(Sender: TObject);
begin
  raise Exception.Create('Cancelado');
end;

procedure TUsuarioTipoFiscalModel.OnConfirmSenha(Sender: TObject);
begin
  raise Exception.Create('Confirmado');
end;

procedure TUsuarioTipoFiscalModel.PedirSenha;
begin
  if (FLista.Count <= 0) then Exit;
  
  FOperacao.PedirSenha
    .SetTitle('Entre com a senha do Fiscal')
    .SetTextConfirm('Confirmar')
    .SetTextCancel('Cancelar')
    .Lista(FLista)
    .Result(FResult)
  .&End;
end;

function TUsuarioTipoFiscalModel.SetOperacao(
  Value: IUsuarioOperacoesController): IUsuarioMetodoModel;
begin
  Result := Self;
  FOperacao := Value;
end;

class function TUsuarioTipoFiscalModel.New(Parent: IUsuarioModel)
  : IUsuarioMetodoModel;
begin
  Result := Self.Create(Parent);
end;

end.
