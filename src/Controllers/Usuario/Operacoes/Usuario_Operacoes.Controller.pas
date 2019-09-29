unit Usuario_Operacoes.Controller;

interface

uses
  Usuario_Operacoes.Controller.Interf,
  PDVUpdates_Type.Controller,
  System.Generics.Collections, Entidade_Usuario.Model;

type
  TUsuarioOperacoesController = class(TInterfacedObject,
    IUsuarioOperacoesController, IUsuarioOperacaoPedirSenhaController)
  private
    FLista: TObjectList<TUsuario>;
    FResult: ^TUsuario;
    FTitle, FTextConfirm, FTextCancel: string;
    procedure ValidarSenha;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IUsuarioOperacoesController;

    // IUsuarioOperacoesController
    function PedirSenha: IUsuarioOperacaoPedirSenhaController;

    // IUsuarioOperacaoPedirSenhaController
    function SetTitle(Value: string): IUsuarioOperacaoPedirSenhaController;
    function SetTextConfirm(Value: string): IUsuarioOperacaoPedirSenhaController;
    function SetTextCancel(Value: string): IUsuarioOperacaoPedirSenhaController;
    function Lista(Value: TObjectList<TUsuario>): IUsuarioOperacaoPedirSenhaController;
    function Result(var Value: TUSUARIO): IUsuarioOperacaoPedirSenhaController;
    function &End: IUsuarioOperacoesController;
  end;

implementation

{ TUsuarioOperacoesController }

uses
  Usuario_SenhaView,
  System.SysUtils;

function TUsuarioOperacoesController.&End: IUsuarioOperacoesController;
begin
  Result := Self;
  TUsuarioSenhaView.New(nil)
    .ExibirForm(
      FTitle,
      FTextConfirm,
      FTextCancel,
      FLista,
      FResult^
    );
  ValidarSenha;
end;

function TUsuarioOperacoesController.Lista(Value: TObjectList<TUsuario>): IUsuarioOperacaoPedirSenhaController;
begin
  Result := Self;
  FLista := Value;
end;

constructor TUsuarioOperacoesController.Create;
begin
  FTitle := '';
  FTextConfirm := '';
  FTextCancel := '';
end;

destructor TUsuarioOperacoesController.Destroy;
begin

  inherited;
end;

class function TUsuarioOperacoesController.New: IUsuarioOperacoesController;
begin
  Result := Self.Create;
end;

function TUsuarioOperacoesController.PedirSenha: IUsuarioOperacaoPedirSenhaController;
begin
  Result := Self;
end;

function TUsuarioOperacoesController.Result(var Value: TUSUARIO): IUsuarioOperacaoPedirSenhaController;
begin
  Result := Self;
  FResult := @Value;
end;

function TUsuarioOperacoesController.SetTextCancel(
  Value: string): IUsuarioOperacaoPedirSenhaController;
begin
  Result := Self;
  FTextCancel := Value;
end;

function TUsuarioOperacoesController.SetTextConfirm(
  Value: string): IUsuarioOperacaoPedirSenhaController;
begin
  Result := Self;
  FTextConfirm := Value;
end;

function TUsuarioOperacoesController.SetTitle(
  Value: string): IUsuarioOperacaoPedirSenhaController;
begin
  Result := Self;
  FTitle := Value;
end;

procedure TUsuarioOperacoesController.ValidarSenha;
var
  I: Integer;
begin
  for I := 0 to Pred(FLista.Count) do
    if (FLista[I].Nome = FResult.Nome) and (FLista[I].Senha <> FResult.Senha) then
      raise Exception.Create('Senha inválida');
end;

end.
