unit Usuario_SenhaView;

interface

uses
{$IFDEF FMX}FMX.Forms, {$ELSE}VCL.Forms, {$ENDIF}
  System.SysUtils, System.Classes, MVCBr.Interf, System.JSON,
  MVCBr.View, MVCBr.FormView, MVCBr.Controller, FMX.Types, FMX.Controls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox, FMX.Edit,
  PDVUpdates_Type.Controller, System.Generics.Collections;

type
  IUsuarioSenhaView = interface(IView)
    ['{14D77D20-F3D7-490E-AFF1-7F66A3497F12}']
    procedure ExibirForm(Title, TextConfir, TextCancel: String;
      Lista: TList<TRecordSenha>; var Result: TRecordSenha);
  end;

  TUsuarioSenhaView = class(TFMXFormFactory { TFORM } , IView,
    IThisAs<TUsuarioSenhaView>, IUsuarioSenhaView, IViewAs<IUsuarioSenhaView>)
    Layout1: TLayout;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Layout2: TLayout;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FInited: boolean;
    procedure PreencherCombo(Lista: TList<TRecordSenha>);
  protected
    function Controller(const aController: IController): IView; override;
  public
    { Public declarations }
    class function New(aController: IController): IUsuarioSenhaView;
    function ThisAs: TUsuarioSenhaView;
    function ViewAs: IUsuarioSenhaView;
    function ShowView(const AProc: TProc<IView>): integer; override;

    procedure ExibirForm(Title, TextConfir, TextCancel: String;
      Lista: TList<TRecordSenha>; var Result: TRecordSenha);
  end;

Implementation

uses
  System.UITypes;

{$R *.fmx}

function TUsuarioSenhaView.ViewAs: IUsuarioSenhaView;
begin
  Result := self;
end;

procedure TUsuarioSenhaView.ExibirForm(Title, TextConfir, TextCancel: String;
  Lista: TList<TRecordSenha>; var Result: TRecordSenha);
begin
  PreencherCombo(Lista);
  Label1.Text := Title;
  Button1.Text := TextConfir;
  Button2.Text := TextCancel;

  if (self.ShowModal = mrCancel) then
    raise Exception.Create('Operação cancelada pelo usuário');

  Result.Nome := ComboBox1.Items[ComboBox1.ItemIndex];
  Result.Senha := Edit1.Text;
end;

class function TUsuarioSenhaView.New(aController: IController): IUsuarioSenhaView;
begin
  Result := TUsuarioSenhaView.Create(nil);
//  Result.Controller(aController);
end;

procedure TUsuarioSenhaView.PreencherCombo(Lista: TList<TRecordSenha>);
var
  I: Integer;
begin
  for I := 0 to Pred(Lista.Count) do
    ComboBox1.Items.Add(Lista[I].Nome);

  ComboBox1.ItemIndex := 0;
end;

procedure TUsuarioSenhaView.Button1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TUsuarioSenhaView.Button2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TUsuarioSenhaView.Controller(const aController: IController): IView;
begin
  Result := inherited Controller(aController);
  if not FInited then
  begin
    init;
    FInited := true;
  end;
end;

function TUsuarioSenhaView.ThisAs: TUsuarioSenhaView;
begin
  Result := self;
end;

function TUsuarioSenhaView.ShowView(const AProc: TProc<IView>): integer;
begin
  inherited;
end;

end.
