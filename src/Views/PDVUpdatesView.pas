unit PDVUpdatesView;

interface

uses
{$IFDEF FMX}FMX.Forms, {$ELSE}VCL.Forms, {$ENDIF}
  System.SysUtils, System.Classes, MVCBr.Interf, System.JSON,
  MVCBr.View, MVCBr.FormView, MVCBr.Controller, Caixa.Controller.Interf,
  FMX.Types, FMX.Controls, FMX.Layouts, FMX.ListBox, Item.Controller.Interf,
  Cliente.Controller.Interf, Pagamento.Controller.Interf,
  Venda.Controller.Interf;

type
  /// Interface para a VIEW
  IPDVUpdatesView = interface(IView)
    ['{A7404D38-7092-4BE5-9265-A82220523CF8}']
  end;

  TPDVUpdatesView = class(TFormFactory { TFORM } , IView,
    IThisAs<TPDVUpdatesView>, IPDVUpdatesView, IViewAs<IPDVUpdatesView>)
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    ListBox2: TListBox;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    ListBoxItem10: TListBoxItem;
    ListBoxItem11: TListBoxItem;
    ListBoxItem12: TListBoxItem;
    ListBoxItem13: TListBoxItem;
    ListBox3: TListBox;
    ListBoxItem14: TListBoxItem;
    ListBoxItem15: TListBoxItem;
    ListBoxItem16: TListBoxItem;
    ListBoxItem17: TListBoxItem;
    ListBoxItem18: TListBoxItem;
    ListBoxItem19: TListBoxItem;
    ListBoxItem20: TListBoxItem;
    ListBoxItem21: TListBoxItem;
    ListBoxItem22: TListBoxItem;
    ListBoxItem23: TListBoxItem;
    ListBoxItem24: TListBoxItem;
    procedure FormCreate(Sender: TObject);
    procedure ListBoxItem1Click(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure ListBoxItem3Click(Sender: TObject);
    procedure ListBoxItem4Click(Sender: TObject);
    procedure ListBoxItem5Click(Sender: TObject);
    procedure ListBoxItem6Click(Sender: TObject);
    procedure ListBoxItem7Click(Sender: TObject);
    procedure ListBoxItem8Click(Sender: TObject);
    procedure ListBoxItem9Click(Sender: TObject);
    procedure ListBoxItem10Click(Sender: TObject);
    procedure ListBoxItem11Click(Sender: TObject);
    procedure ListBoxItem12Click(Sender: TObject);
    procedure ListBoxItem13Click(Sender: TObject);
    procedure ListBoxItem14Click(Sender: TObject);
    procedure ListBoxItem15Click(Sender: TObject);
    procedure ListBoxItem16Click(Sender: TObject);
    procedure ListBoxItem17Click(Sender: TObject);
    procedure ListBoxItem18Click(Sender: TObject);
    procedure ListBoxItem19Click(Sender: TObject);
    procedure ListBoxItem20Click(Sender: TObject);
    procedure ListBoxItem21Click(Sender: TObject);
    procedure ListBoxItem22Click(Sender: TObject);
    procedure ListBoxItem23Click(Sender: TObject);
    procedure ListBoxItem24Click(Sender: TObject);
  private
    FInited: boolean;
    FCaixa: ICaixaController;
    FItem: IItemController;
    FCliente: IClienteController;
    FPagamento: IPagamentoController;
    FVenda: IVendaController;
  protected
    function Controller(const aController: IController): IView; override;
  public
    { Public declarations }
    class function New(aController: IController): IView;
    function ThisAs: TPDVUpdatesView;
    function ViewAs: IPDVUpdatesView;
    function ShowView(const AProc: TProc<IView>): integer; override;
  end;

Implementation

uses
  PDVUpdates.Controller;

{$R *.fmx}

function TPDVUpdatesView.ViewAs: IPDVUpdatesView;
begin
  result := self;
end;

procedure TPDVUpdatesView.FormCreate(Sender: TObject);
begin
  FCaixa     := TPDVUpdatesController.New.Caixa;
  FVenda     := TPDVUpdatesController.New.Venda(FCaixa);
  FItem      := TPDVUpdatesController.New.Item(FVenda);
  FCliente   := TPDVUpdatesController.New.Cliente;
  FPagamento := TPDVUpdatesController.New.Pagamento(FVenda);
end;

procedure TPDVUpdatesView.ListBoxItem10Click(Sender: TObject);
begin
  FItem.Metodo.Desconto;
end;

procedure TPDVUpdatesView.ListBoxItem11Click(Sender: TObject);
begin
  FItem.Metodo.Acrescimo;
end;

procedure TPDVUpdatesView.ListBoxItem12Click(Sender: TObject);
begin
  FItem.Metodo.Repetir;
end;

procedure TPDVUpdatesView.ListBoxItem13Click(Sender: TObject);
begin
  FCliente.Metodo.Saldo;
end;

procedure TPDVUpdatesView.ListBoxItem14Click(Sender: TObject);
begin
  FPagamento.Executar.Executar;
end;

procedure TPDVUpdatesView.ListBoxItem15Click(Sender: TObject);
begin
  FPagamento.Executar.Estornar;
end;

procedure TPDVUpdatesView.ListBoxItem16Click(Sender: TObject);
begin
  FPagamento.Executar.Executar;
end;

procedure TPDVUpdatesView.ListBoxItem17Click(Sender: TObject);
begin
  FPagamento.Executar.Estornar;
end;

procedure TPDVUpdatesView.ListBoxItem18Click(Sender: TObject);
begin
  FVenda.Metodo.Abrir;
end;

procedure TPDVUpdatesView.ListBoxItem19Click(Sender: TObject);
begin
  FVenda.Metodo.Pagar;
end;

procedure TPDVUpdatesView.ListBoxItem1Click(Sender: TObject);
begin
  FCaixa.Metodo.Abrir;
end;

procedure TPDVUpdatesView.ListBoxItem20Click(Sender: TObject);
begin
  FVenda.Metodo.Fechar;
end;

procedure TPDVUpdatesView.ListBoxItem21Click(Sender: TObject);
begin
  FVenda.Metodo.IdentificarCliente;
end;

procedure TPDVUpdatesView.ListBoxItem22Click(Sender: TObject);
begin
  FVenda.Metodo.VenderItem;
end;

procedure TPDVUpdatesView.ListBoxItem23Click(Sender: TObject);
begin
  FVenda.Metodo.EfetuarPagamento;
end;

procedure TPDVUpdatesView.ListBoxItem24Click(Sender: TObject);
begin
  FVenda.Metodo.EfetuarEstorno;
end;

procedure TPDVUpdatesView.ListBoxItem2Click(Sender: TObject);
begin
  FCaixa.Metodo.Fechar;
end;

procedure TPDVUpdatesView.ListBoxItem3Click(Sender: TObject);
begin
  FCaixa.Metodo.Suprimento;
end;

procedure TPDVUpdatesView.ListBoxItem4Click(Sender: TObject);
begin
  FCaixa.Metodo.Sangria;
end;

procedure TPDVUpdatesView.ListBoxItem5Click(Sender: TObject);
begin
  FCaixa.Metodo.TrocarOperador;
end;

procedure TPDVUpdatesView.ListBoxItem6Click(Sender: TObject);
begin
  FCaixa.Metodo.Bloquear;
end;

procedure TPDVUpdatesView.ListBoxItem7Click(Sender: TObject);
begin
  FCaixa.Metodo.Desbloquear;
end;

procedure TPDVUpdatesView.ListBoxItem8Click(Sender: TObject);
begin
  FItem.Metodo.Vender;
end;

procedure TPDVUpdatesView.ListBoxItem9Click(Sender: TObject);
begin
  FItem.Metodo.Cancelar;
end;

class function TPDVUpdatesView.New(aController: IController): IView;
begin
  result := TPDVUpdatesView.create(nil);
  result.Controller(aController);
end;

function TPDVUpdatesView.Controller(const aController: IController): IView;
begin
  result := inherited Controller(aController);
  if not FInited then
  begin
    init;
    FInited := true;
  end;
end;

function TPDVUpdatesView.ThisAs: TPDVUpdatesView;
begin
  result := self;
end;

function TPDVUpdatesView.ShowView(const AProc: TProc<IView>): integer;
begin
  inherited;
end;

end.
