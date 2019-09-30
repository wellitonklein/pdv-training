unit Pagamento_Tipo_CartaoCredito.Controller;

interface

uses
  Pagamento.Controller.Interf, Pagamento.Model.Interf, Venda.Controller.Interf;

type
  TPagamentoTipoCartaoCreditoController = class(TInterfacedObject, IPagamentoMetodoController)
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
    function SelecaoPagamento: IPagamentoMetodoController;
    function &End: IPagamentoController;
  end;

implementation

uses
  PDVUpdates.Model, Captura_ValorView;

{ TPagamentoTipoCartaoCreditoController }

function TPagamentoTipoCartaoCreditoController.&End: IPagamentoController;
begin
  Result := FParent;
end;

constructor TPagamentoTipoCartaoCreditoController.Create(Parent: IPagamentoController; Venda: IVendaController);
begin
  FParent := Parent;
  FVenda  := Venda;
  FModel  := TPDVUpdatesModel.New.Pagamento(FVenda.Model);
end;

destructor TPagamentoTipoCartaoCreditoController.Destroy;
begin

  inherited;
end;

function TPagamentoTipoCartaoCreditoController.Estornar: IPagamentoMetodoController;
begin
  Result := Self;
  FModel.Tipo.CartaoCredito
    .Estornar
      .SetIndex(
        Trunc(
          TCapturaValorView.New(nil).ExibeForm(
            'Informe o código do Pagamento via Cartão de Crédito a ser estornado',
            'Confirmar',
            'Cancelar'
          )
        )
      )
    .&End
end;

function TPagamentoTipoCartaoCreditoController.Executar: IPagamentoMetodoController;
begin
  Result := Self;
  FModel.Tipo.CartaoCredito
    .Executar
      .SetValor(
        TCapturaValorView.New(nil).ExibeForm(
          'Informe o valor do Pagamento via Cartão de Crédito',
          'Confirmar',
          'Cancelar'
        )
      )
    .&End
end;

class function TPagamentoTipoCartaoCreditoController.New(Parent: IPagamentoController; Venda: IVendaController): IPagamentoMetodoController;
begin
  Result := Self.Create(Parent, Venda);
end;

function TPagamentoTipoCartaoCreditoController.SelecaoPagamento: IPagamentoMetodoController;
begin
  Result := Self;

end;

end.

