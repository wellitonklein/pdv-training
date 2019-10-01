unit PDVUpdates.Controller;

interface

{ .$I ..\inc\mvcbr.inc }
uses

  System.SysUtils, {$IFDEF LINUX} {$ELSE} {$IFDEF FMX} FMX.Forms, {$ELSE} VCL.Forms, {$ENDIF}{$ENDIF}
  System.Classes, MVCBr.Interf,
  MVCBr.Model, MVCBr.Controller, MVCBr.ApplicationController,
  System.RTTI, PDVUpdates.Controller.Interf,
  PDVUpdatesView, Usuario.Controller.Interf, Caixa.Controller.Interf,
  Item.Controller.Interf, Cliente.Controller.Interf,
  Pagamento.Controller.Interf, Venda.Controller.Interf,
  Fiscal.Controller.Interf;

type

  TPDVUpdatesController = class(TControllerFactory, IPDVUpdatesController,
    IThisAs<TPDVUpdatesController>)
  protected
  public
    Procedure CreateModules; virtual;
    Constructor Create; override;
    Destructor Destroy; override;
    class function New: IPDVUpdatesController;
    function ThisAs: TPDVUpdatesController;
    procedure init; override;

    function Usuario: IUsuarioController;
    function Caixa: ICaixaController;
    function Item(Venda: IVendaController): IItemController;
    function Cliente: IClienteController;
    function Pagamento(Venda: IVendaController): IPagamentoController;
    function Venda(Caixa: ICaixaController): IVendaController;
    function Fiscal: IFiscalController;
  end;

implementation

uses
  Usuario_Factory.Controller, Caixa_Factory.Controller,
  Item_Factory.Controller, Cliente_Factory.Controller,
  Pagamento_Factory.Controller, Venda_Factory.Controller,
  Fiscal_Factory.Controller;

function TPDVUpdatesController.Caixa: ICaixaController;
begin
  Result := TCaixaFactoryController.New.Caixa;
end;

function TPDVUpdatesController.Cliente: IClienteController;
begin
  Result := TClienteFactoryController.New.Cliente;
end;

Constructor TPDVUpdatesController.Create;
begin
  inherited;

end;

Destructor TPDVUpdatesController.Destroy;
begin
  inherited;
end;

function TPDVUpdatesController.Fiscal: IFiscalController;
begin
  Result := TFiscalFactoryController.New.Fiscal;
end;

class function TPDVUpdatesController.New(): IPDVUpdatesController;
begin
  result := Self.Create;
end;

function TPDVUpdatesController.Pagamento(Venda: IVendaController): IPagamentoController;
begin
  Result := TPagamentoFactoryController.New.Pagamento(Venda);
end;

function TPDVUpdatesController.ThisAs: TPDVUpdatesController;
begin
  result := self;
end;

function TPDVUpdatesController.Usuario: IUsuarioController;
begin
  Result := TUsuarioFactoryController.New.Usuario;
end;

function TPDVUpdatesController.Venda(Caixa: ICaixaController): IVendaController;
begin
  Result := TVendaFactoryController.New.Venda(Caixa);
end;

procedure TPDVUpdatesController.init;
var
  ref: TPDVUpdatesView;
begin
  inherited;
  if not assigned(FView) then
  begin
    Application.CreateForm(TPDVUpdatesView, ref);
    supports(ref, IView, FView);
{$IFDEF FMX}
    if Application.MainForm = nil then
      Application.RealCreateForms;
{$ENDIF}
  end;
  CreateModules;
  AfterInit;
end;

function TPDVUpdatesController.Item(Venda: IVendaController): IItemController;
begin
  Result := TItemFactoryController.New.Item(Venda);
end;

/// Adicionar os modulos e MODELs personalizados
Procedure TPDVUpdatesController.CreateModules;
begin

end;

initialization

RegisterInterfacedClass(TPDVUpdatesController.ClassName, IPDVUpdatesController,
  TPDVUpdatesController);

finalization

unRegisterInterfacedClass(TPDVUpdatesController.ClassName);

end.
