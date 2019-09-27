unit Usuario_Senha.Controller;

interface

{ .$I ..\inc\mvcbr.inc }
uses

  System.SysUtils, {$IFDEF LINUX} {$ELSE} {$IFDEF FMX} FMX.Forms, {$ELSE} VCL.Forms, {$ENDIF}{$ENDIF}
  System.Classes, MVCBr.Interf,
  MVCBr.Model, MVCBr.Controller, MVCBr.ApplicationController,
  System.RTTI, Usuario_Senha.Controller.Interf,
  Usuario_SenhaView;

type

  TUsuarioSenhaController = class(TControllerFactory, IUsuarioSenhaController,
    IThisAs<TUsuarioSenhaController>)
  protected
  public
    // inicializar os módulos personalizados em CreateModules
    Procedure CreateModules; virtual;
    Constructor Create; override;
    Destructor Destroy; override;
    /// New Cria nova instância para o Controller
    class function New(): IController; overload;
    class function New(const AView: IView; const AModel: IModel)
      : IController; overload;
    class function New(const AModel: IModel): IController; overload;
    function ThisAs: TUsuarioSenhaController;
    /// Init após criado a instância é chamado para concluir init
    procedure init; override;
  end;

implementation

/// Creator para a classe Controller
Constructor TUsuarioSenhaController.Create;
begin
  inherited;
  /// Inicializar as Views...
  View(TUsuarioSenhaView.New(self));
end;

/// Finaliza o controller
Destructor TUsuarioSenhaController.Destroy;
begin
  inherited;
end;

/// Classe Function basica para criar o controller
class function TUsuarioSenhaController.New(): IController;
begin
  result := New(nil, nil);
end;

/// Classe para criar o controller com View e Model criado
class function TUsuarioSenhaController.New(const AView: IView;
  const AModel: IModel): IController;
var
  vm: IViewModel;
begin
  result := TUsuarioSenhaController.Create as IController;
  result.View(AView).Add(AModel);
  if assigned(AModel) then
    if supports(AModel.This, IViewModel, vm) then
    begin
      vm.View(AView).Controller(result);
    end;
end;

/// Classe para inicializar o Controller com um Modulo inicialz.
class function TUsuarioSenhaController.New(const AModel: IModel): IController;
begin
  result := New(nil, AModel);
end;

/// Cast para a interface local do controller
function TUsuarioSenhaController.ThisAs: TUsuarioSenhaController;
begin
  result := self;
end;

/// Evento INIT chamado apos a inicializacao do controller
procedure TUsuarioSenhaController.init;
var
  ref: TUsuarioSenhaView;
begin
  inherited;
  if not assigned(FView) then
  begin
    Application.CreateForm(TUsuarioSenhaView, ref);
    supports(ref, IView, FView);
{$IFDEF FMX}
    if Application.MainForm = nil then
      Application.RealCreateForms;
{$ENDIF}
  end;
  CreateModules; // < criar os modulos persolnizados

  AfterInit;
end;

/// Adicionar os modulos e MODELs personalizados
Procedure TUsuarioSenhaController.CreateModules;
begin
  // adicionar os seus MODELs aqui
  // exemplo: add( MeuModel.new(self) );
end;

initialization

/// Inicialização automatica do Controller ao iniciar o APP
// TUsuario_SenhaController.New(TUsuario_SenhaView.New,TUsuario_SenhaViewModel.New)).init();

/// Registrar Interface e ClassFactory para o MVCBr
RegisterInterfacedClass(TUsuarioSenhaController.ClassName,
  IUsuarioSenhaController, TUsuarioSenhaController);

finalization

/// Remover o Registro da Interface
unRegisterInterfacedClass(TUsuarioSenhaController.ClassName);

end.
