unit Dialog_Pagamento.Controller;

interface

{ .$I ..\inc\mvcbr.inc }
uses

  System.SysUtils, {$IFDEF LINUX} {$ELSE} {$IFDEF FMX} FMX.Forms, {$ELSE} VCL.Forms, {$ENDIF}{$ENDIF}
  System.Classes, MVCBr.Interf,
  MVCBr.Model, MVCBr.Controller, MVCBr.ApplicationController,
  System.RTTI, Dialog_Pagamento.Controller.Interf,
  Dialog_PagamentoView;

type

  TDialogPagamentoController = class(TControllerFactory,
    IDialogPagamentoController, IThisAs<TDialogPagamentoController>)
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
    function ThisAs: TDialogPagamentoController;
    /// Init após criado a instância é chamado para concluir init
    procedure init; override;
  end;

implementation

/// Creator para a classe Controller
Constructor TDialogPagamentoController.Create;
begin
  inherited;
  /// Inicializar as Views...
  View(TDialogPagamentoView.New(self));
end;

/// Finaliza o controller
Destructor TDialogPagamentoController.Destroy;
begin
  inherited;
end;

/// Classe Function basica para criar o controller
class function TDialogPagamentoController.New(): IController;
begin
  result := New(nil, nil);
end;

/// Classe para criar o controller com View e Model criado
class function TDialogPagamentoController.New(const AView: IView;
  const AModel: IModel): IController;
var
  vm: IViewModel;
begin
  result := TDialogPagamentoController.Create as IController;
  result.View(AView).Add(AModel);
  if assigned(AModel) then
    if supports(AModel.This, IViewModel, vm) then
    begin
      vm.View(AView).Controller(result);
    end;
end;

/// Classe para inicializar o Controller com um Modulo inicialz.
class function TDialogPagamentoController.New(const AModel: IModel)
  : IController;
begin
  result := New(nil, AModel);
end;

/// Cast para a interface local do controller
function TDialogPagamentoController.ThisAs: TDialogPagamentoController;
begin
  result := self;
end;

/// Evento INIT chamado apos a inicializacao do controller
procedure TDialogPagamentoController.init;
var
  ref: TDialogPagamentoView;
begin
  inherited;
  if not assigned(FView) then
  begin
    Application.CreateForm(TDialogPagamentoView, ref);
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
Procedure TDialogPagamentoController.CreateModules;
begin
  // adicionar os seus MODELs aqui
  // exemplo: add( MeuModel.new(self) );
end;

initialization

/// Inicialização automatica do Controller ao iniciar o APP
// TDialog_PagamentoController.New(TDialog_PagamentoView.New,TDialog_PagamentoViewModel.New)).init();

/// Registrar Interface e ClassFactory para o MVCBr
RegisterInterfacedClass(TDialogPagamentoController.ClassName,
  IDialogPagamentoController, TDialogPagamentoController);

finalization

/// Remover o Registro da Interface
unRegisterInterfacedClass(TDialogPagamentoController.ClassName);

end.
