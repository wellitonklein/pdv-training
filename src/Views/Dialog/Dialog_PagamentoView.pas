unit Dialog_PagamentoView;

interface

uses
{$IFDEF FMX}FMX.Forms, {$ELSE}VCL.Forms, {$ENDIF}
  System.SysUtils, System.Classes, MVCBr.Interf, System.JSON,
  MVCBr.View, MVCBr.FormView, MVCBr.Controller, PDVUpdates_Type.Controller,
  System.Generics.Collections, FMX.Edit, FMX.ListBox, FMX.StdCtrls,
  FMX.Controls, FMX.Controls.Presentation, FMX.Types, FMX.Layouts;

type
  /// Interface para a VIEW
  IDialogPagamentoView = interface(IView)
    ['{C0643EA9-88CE-4442-97D9-6E3CD1BB21AF}']
    procedure ExibirForm(Title, TextConfir, TextCancel: String;
      Lista: TList<TRecordPagamento>; var Result: TRecordPagamento);
  end;

  /// Object Factory que implementa a interface da VIEW
  TDialogPagamentoView = class(TFMXFormFactory { TFORM } , IView,
    IThisAs<TDialogPagamentoView>, IDialogPagamentoView,
    IViewAs<IDialogPagamentoView>)
    Layout1: TLayout;
    ToolBar1: TToolBar;
    Label1: TLabel;
    ToolBar2: TToolBar;
    Layout2: TLayout;
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FInited: boolean;
    procedure PreencherCombo(Lista: TList<TRecordPagamento>);
  protected
    function Controller(const aController: IController): IView; override;
  public
    { Public declarations }
    class function New(aController: IController): IDialogPagamentoView;
    function ThisAs: TDialogPagamentoView;
    function ViewAs: IDialogPagamentoView;
    function ShowView(const AProc: TProc<IView>): integer; override;
    procedure ExibirForm(Title, TextConfir, TextCancel: String;
      Lista: TList<TRecordPagamento>; var Result: TRecordPagamento);
  end;

Implementation

uses
  System.UITypes;

{$R *.fmx}

function TDialogPagamentoView.ViewAs: IDialogPagamentoView;
begin
  result := self;
end;

procedure TDialogPagamentoView.ExibirForm(Title, TextConfir, TextCancel: String;
  Lista: TList<TRecordPagamento>; var Result: TRecordPagamento);
begin
  PreencherCombo(Lista);
  Label1.Text := Title;
  Button1.Text := TextConfir;
  Button2.Text := TextCancel;

  if (self.ShowModal = mrCancel) then
    raise Exception.Create('Operação cancelada pelo usuário');

  Result.Descricao := ListBox1.Items[ListBox1.ItemIndex];
  Result.Tipo := TTypePagamento(ListBox1.Items.Objects[ListBox1.ItemIndex]);
end;

class function TDialogPagamentoView.New(aController: IController): IDialogPagamentoView;
begin
  result := TDialogPagamentoView.create(nil);
//  result.Controller(aController);
end;

procedure TDialogPagamentoView.PreencherCombo(Lista: TList<TRecordPagamento>);
var
  I: Integer;
begin
  for I := 0 to Pred(Lista.Count) do
    ListBox1.Items.AddObject(Lista[I].Descricao, TObject(Lista[I].Tipo));

  ListBox1.ItemIndex := 0;
end;

procedure TDialogPagamentoView.Button1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TDialogPagamentoView.Button2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TDialogPagamentoView.Controller(const aController: IController): IView;
begin
  result := inherited Controller(aController);
  if not FInited then
  begin
    init;
    FInited := true;
  end;
end;

function TDialogPagamentoView.ThisAs: TDialogPagamentoView;
begin
  result := self;
end;

function TDialogPagamentoView.ShowView(const AProc: TProc<IView>): integer;
begin
  inherited;
end;

end.
