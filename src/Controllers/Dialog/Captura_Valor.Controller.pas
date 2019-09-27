unit Captura_Valor.Controller;

interface

{ .$I ..\inc\mvcbr.inc }
uses

  System.SysUtils, {$IFDEF LINUX} {$ELSE} {$IFDEF FMX} FMX.Forms, {$ELSE} VCL.Forms, {$ENDIF}{$ENDIF}
  System.Classes, MVCBr.Interf,
  MVCBr.Model, MVCBr.Controller, MVCBr.ApplicationController,
  System.RTTI, Captura_Valor.Controller.Interf,
  Captura_ValorView;

type

  TCapturaValorController = class(TControllerFactory, ICapturaValorController,
    IThisAs<TCapturaValorController>)
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
    function ThisAs: TCapturaValorController;
    /// Init após criado a instância é chamado para concluir init
    procedure init; override;
  end;

implementation

/// Creator para a classe Controller
Constructor TCapturaValorController.Create;
begin
  inherited;
  /// Inicializar as Views...
  View(TCapturaValorView.New(self));
end;

/// Finaliza o controller
Destructor TCapturaValorController.Destroy;
begin
  inherited;
end;

/// Classe Function basica para criar o controller
class function TCapturaValorController.New(): IController;
begin
  result := New(nil, nil);
end;

/// Classe para criar o controller com View e Model criado
class function TCapturaValorController.New(const AView: IView;
  const AModel: IModel): IController;
var
  vm: IViewModel;
begin
  result := TCapturaValorController.Create as IController;
  result.View(AView).Add(AModel);
  if assigned(AModel) then
    if supports(AModel.This, IViewModel, vm) then
    begin
      vm.View(AView).Controller(result);
    end;
end;

/// Classe para inicializar o Controller com um Modulo inicialz.
class function TCapturaValorController.New(const AModel: IModel): IController;
begin
  result := New(nil, AModel);
end;

/// Cast para a interface local do controller
function TCapturaValorController.ThisAs: TCapturaValorController;
begin
  result := self;
end;

/// Evento INIT chamado apos a inicializacao do controller
procedure TCapturaValorController.init;
var
  ref: TCapturaValorView;
begin
  inherited;
  if not assigned(FView) then
  begin
    Application.CreateForm(TCapturaValorView, ref);
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
Procedure TCapturaValorController.CreateModules;
begin
  // adicionar os seus MODELs aqui
  // exemplo: add( MeuModel.new(self) );
end;

initialization

/// Inicialização automatica do Controller ao iniciar o APP
// TCaptura_ValorController.New(TCaptura_ValorView.New,TCaptura_ValorViewModel.New)).init();

/// Registrar Interface e ClassFactory para o MVCBr
RegisterInterfacedClass(TCapturaValorController.ClassName,
  ICapturaValorController, TCapturaValorController);

finalization

/// Remover o Registro da Interface
unRegisterInterfacedClass(TCapturaValorController.ClassName);

end.
