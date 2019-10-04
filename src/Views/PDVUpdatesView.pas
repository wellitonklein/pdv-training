unit PDVUpdatesView;

interface

uses
{$IFDEF FMX}FMX.Forms, {$ELSE}VCL.Forms, {$ENDIF}
  System.SysUtils, System.Classes, MVCBr.Interf, System.JSON,
  MVCBr.View, MVCBr.FormView, MVCBr.Controller, Caixa.Controller.Interf,
  FMX.Types, FMX.Controls, FMX.Layouts, FMX.ListBox, Item.Controller.Interf,
  Cliente.Controller.Interf, Pagamento.Controller.Interf,
  Venda.Controller.Interf, FMX.Objects, FMX.Effects, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Edit, Observer.Controller.Interf,
  PDVUpdates_Type.Controller;

type
  /// Interface para a VIEW
  IPDVUpdatesView = interface(IView)
    ['{A7404D38-7092-4BE5-9265-A82220523CF8}']
  end;

  TPDVUpdatesView = class(TFormFactory { TFORM } , IView,
    IThisAs<TPDVUpdatesView>, IPDVUpdatesView, IObserverItensController, IViewAs<IPDVUpdatesView>)
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Rectangle3: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout7: TLayout;
    Rectangle4: TRectangle;
    ShadowEffect2: TShadowEffect;
    Layout8: TLayout;
    Image1: TImage;
    Label1: TLabel;
    edtCodigoProd: TEdit;
    edtQuantidadeProd: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    lblValorUltimoItem: TLabel;
    Label7: TLabel;
    Layout9: TLayout;
    Rectangle5: TRectangle;
    Label8: TLabel;
    lblTotalCupom: TLabel;
    Label10: TLabel;
    ListBox1: TListBox;
    StyleBook1: TStyleBook;
    procedure FormCreate(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    FInited: boolean;
    FCaixa: ICaixaController;
    FItem: IItemController;
    FCliente: IClienteController;
    FPagamento: IPagamentoController;
    FVenda: IVendaController;
    procedure VenderItem;
    function UpdatesItem(Value: TRecordItem): IObserverItensController;
    procedure HeaderListaItens;
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

procedure TPDVUpdatesView.Edit4KeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (KeyChar = #0) then
    VenderItem;
end;

procedure TPDVUpdatesView.FormCreate(Sender: TObject);
begin
  FCaixa     := TPDVUpdatesController.New.Caixa;
  FVenda     := TPDVUpdatesController.New.Venda(FCaixa);
  FItem      := TPDVUpdatesController.New.Item(FVenda);
  FCliente   := TPDVUpdatesController.New.Cliente;
  FPagamento := TPDVUpdatesController.New.Pagamento(FVenda);

  FVenda.ObserverItem.AddObserver(Self);
  HeaderListaItens;
end;

procedure TPDVUpdatesView.HeaderListaItens;
var
  lbItem: TListBoxItem;
begin
  lbItem := TListBoxItem.Create(nil);
  lbItem.StyleLookup := 'ListBoxItemProduto';
  lbItem.StylesData['descricao'] := 'Descrição do produto';
  lbItem.StylesData['quantidade'] := 'Qtde.';
  lbItem.StylesData['valorunitario'] := 'Valor Unit.';
  lbItem.StylesData['valor'] := 'Valor total';
  ListBox1.AddObject(lbItem);
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

function TPDVUpdatesView.UpdatesItem(
  Value: TRecordItem): IObserverItensController;
var
  lbItem: TListBoxItem;
begin
  Result := Self;

  lbItem := TListBoxItem.Create(nil);
  lbItem.StyleLookup := 'ListBoxItemProduto';
  lbItem.StylesData['descricao'] := Value.Descricao;
  lbItem.StylesData['quantidade'] := FormatCurr('0.000x', Value.Quantidade);
  lbItem.StylesData['valorunitario'] := FormatCurr('#,##0.00', Value.ValorUnitario);
  lbItem.StylesData['valor'] := FormatCurr('#,##0.00', Value.ValorTotal);

  lblTotalCupom.Text :=
    FormatCurr(
      '#,##0.00',
      StrToCurr(
        StringReplace(lblTotalCupom.Text, '.', '', [rfReplaceAll, rfIgnoreCase])
      )
      +
      Value.ValorTotal
    );
  lblValorUltimoItem.Text := FormatCurr('R$ #,##0.00', Value.ValorTotal);

  ListBox1.AddObject(lbItem);
end;

function TPDVUpdatesView.ShowView(const AProc: TProc<IView>): integer;
begin
  inherited;
end;

procedure TPDVUpdatesView.VenderItem;
var
  FCodigo: Integer;
  FQtde: Currency;
begin
  if not TryStrToInt(edtCodigoProd.Text, FCodigo) then
    raise Exception.Create('O Código do Produto é inválido');

  if not TryStrToCurr(edtQuantidadeProd.Text, FQtde) then
    raise Exception.Create('A quantidade informada é inválida');  

  FVenda.Metodo
    .VenderItem
      .Codigo(FCodigo)
      .Quantidade(FQtde)
      .Desconto(0)
      .Executar
    .&End;
end;

end.
