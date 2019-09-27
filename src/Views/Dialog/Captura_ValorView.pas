unit Captura_ValorView;

interface

uses
{$IFDEF FMX}FMX.Forms, {$ELSE}VCL.Forms, {$ENDIF}
  System.SysUtils, System.Classes, MVCBr.Interf, System.JSON,
  MVCBr.View, MVCBr.FormView, MVCBr.Controller, FMX.Edit, FMX.ListBox,
  FMX.StdCtrls, FMX.Controls, FMX.Controls.Presentation, FMX.Types, FMX.Layouts;

type
  ICapturaValorView = interface(IView)
    ['{AEC2501F-3448-4A25-96B2-137483A873EE}']
    function ExibeForm(Title, TextConfirm, TextCancel: string): Currency;
  end;

  /// Object Factory que implementa a interface da VIEW
  TCapturaValorView = class(TFMXFormFactory { TFORM } , IView,
    IThisAs<TCapturaValorView>, ICapturaValorView,
    IViewAs<ICapturaValorView>)
    Layout1: TLayout;
    ToolBar1: TToolBar;
    Label1: TLabel;
    ToolBar2: TToolBar;
    Layout2: TLayout;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FInited: boolean;
  protected
    function Controller(const aController: IController): IView; override;
  public
    { Public declarations }
    class function New(aController: IController): ICapturaValorView;
    function ThisAs: TCapturaValorView;
    function ViewAs: ICapturaValorView;
    function ShowView(const AProc: TProc<IView>): integer; override;
    function ExibeForm(Title, TextConfirm, TextCancel: string): Currency;
  end;

Implementation

uses
  System.UITypes;

{$R *.fmx}

function TCapturaValorView.ViewAs: ICapturaValorView;
begin
  result := self;
end;

function TCapturaValorView.ExibeForm(Title, TextConfirm,
  TextCancel: string): Currency;
begin
  Edit1.Text := EmptyStr;
  Label1.Text := Title;
  Button1.Text := TextConfirm;
  Button2.Text := TextCancel;

  case Self.ShowModal of
    mrOk:
      Result := StrToCurrDef(Edit1.Text, 0);
    mrCancel:
      raise Exception.Create('Ação cancelada pelo usuário');
  end;
end;

class function TCapturaValorView.New(aController: IController): ICapturaValorView;
begin
  result := TCapturaValorView.create(nil);
//  result.Controller(aController);
end;

procedure TCapturaValorView.Button1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TCapturaValorView.Button2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TCapturaValorView.Controller(const aController: IController): IView;
begin
  result := inherited Controller(aController);
  if not FInited then
  begin
    init;
    FInited := true;
  end;
end;

function TCapturaValorView.ThisAs: TCapturaValorView;
begin
  result := self;
end;

function TCapturaValorView.ShowView(const AProc: TProc<IView>): integer;
begin
  inherited;
end;

end.
