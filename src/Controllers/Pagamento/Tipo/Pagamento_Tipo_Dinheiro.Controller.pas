unit Pagamento_Tipo_Dinheiro.Controller;

interface

uses
  Pagamento.Controller.Interf, Pagamento.Model.Interf, Venda.Controller.Interf;

type
  TPagamentoTipoDinheiroController = class(TInterfacedObject, IPagamentoMetodoController)
  private
    FParent: IPagamentoController;
    FModel: IPagamentoModel;
    FVenda: IVendaController;
  public
    constructor Create(Parent: IPagamentoController; Venda: IVendaController);
    destructor Destroy; override;
    class function New(Parent: IPagamentoController; Venda: IVendaController): IPagamentoMetodoController;
    function Executar: IPagamentoMetodoController;
    function Estornar: IPagamentoMetodoController;
    function &End: IPagamentoController;
  end;

implementation

uses
  PDVUpdates.Model, Captura_ValorView;

{ TPagamentoTipoDinheiroController }

function TPagamentoTipoDinheiroController.&End: IPagamentoController;
begin
  Result := FParent;
end;

constructor TPagamentoTipoDinheiroController.Create(Parent: IPagamentoController; Venda: IVendaController);
begin
  FParent := Parent;
  FVenda  := Venda;
  FModel  := TPDVUpdatesModel.New.Pagamento(FVenda.Model);
end;

destructor TPagamentoTipoDinheiroController.Destroy;
begin

  inherited;
end;

function TPagamentoTipoDinheiroController.Estornar: IPagamentoMetodoController;
begin
  Result := Self;
  FModel.Tipo.Dinheiro
    .Estornar
      .SetIndex(
        Trunc(
          TCapturaValorView.New(nil).ExibeForm(
            'Informe o código do Pagamento via Dinheiro a ser estornado',
            'Confirmar',
            'Cancelar'
          )
        )
      )
    .&End
end;

function TPagamentoTipoDinheiroController.Executar: IPagamentoMetodoController;
begin
  Result := Self;
  FModel.Tipo.Dinheiro
    .Executar
      .SetValor(
        TCapturaValorView.New(nil).ExibeForm(
          'Informe o valor do Pagamento via dinheiro',
          'Confirmar',
          'Cancelar'
        )
      )
    .&End
end;

class function TPagamentoTipoDinheiroController.New(Parent: IPagamentoController; Venda: IVendaController): IPagamentoMetodoController;
begin
  Result := Self.Create(Parent, Venda);
end;

end.
