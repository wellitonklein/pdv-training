unit Venda_Metodo.Controller;

interface

uses
  Venda.Controller.Interf,
  Venda.Model.Inerf;

type
  TVendaMetodoController = class(TInterfacedObject, IVendaMetodoController)
  private
    FParent: IVendaController;
    FVendaModel: IVendaModel;
  public
    constructor Create(Parent: IVendaController);
    destructor Destroy; override;
    class function New(Parent: IVendaController): IVendaMetodoController;
    function Abrir: IVendaMetodoController;
    function Pagar: IVendaMetodoController;
    function Fechar: IVendaMetodoController;
    function IdentificarCliente: IVendaMetodoController;
    function VenderItem: IVendaMetodoController;
    function EfetuarPagamento: IVendaMetodoController;
    function EfetuarEstorno: IVendaMetodoController;
    function &End: IVendaController;
  end;

implementation

uses
  PDVUpdates.Model,
  System.SysUtils,
  Captura_ValorView,
  PDVUpdates.Controller;

{ TVendaMetodoController }

function TVendaMetodoController.Abrir: IVendaMetodoController;
begin
  Result := Self;
  FVendaModel.Metodo
    .Abrir
    .&End;
end;

function TVendaMetodoController.EfetuarEstorno: IVendaMetodoController;
begin
  Result := Self;
  FVendaModel.Pagamentos
    .Iterator
      .Add(
        TPDVUpdatesController.New
          .Pagamento
            .Estornar.&End
          .Model
      )
    .&End;
end;

function TVendaMetodoController.EfetuarPagamento: IVendaMetodoController;
begin
  Result := Self;
  FVendaModel.Pagamentos
    .Iterator
      .Add(
        TPDVUpdatesController.New
          .Pagamento
            .Executar.&End
          .Model
      )
    .&End;
end;

function TVendaMetodoController.&End: IVendaController;
begin
  Result := FParent;
end;

constructor TVendaMetodoController.Create(Parent: IVendaController);
begin
  FParent       := Parent;
  FVendaModel   := TPDVUpdatesModel.New.Venda;
end;

destructor TVendaMetodoController.Destroy;
begin

  inherited;
end;

function TVendaMetodoController.Fechar: IVendaMetodoController;
begin
  Result := Self;
  FVendaModel.Metodo
    .Fechar
    .&End;
end;

function TVendaMetodoController.IdentificarCliente: IVendaMetodoController;
begin
  Result := Self;
  FVendaModel.Cliente(
    TPDVUpdatesModel.New.Cliente
      .Metodo
        .Buscar
          .PorCPF(
            CurrToStr(
              TCapturaValorView.New(nil)
                .ExibeForm('Informe o CPF do cliente', 'Confirmar', 'Cancelar')
            )
          )
        .&End
      .&End // <-- Retornar o IClienteModel
  );
end;

class function TVendaMetodoController.New(Parent: IVendaController): IVendaMetodoController;
begin
  Result := Self.Create(Parent);
end;

function TVendaMetodoController.Pagar: IVendaMetodoController;
begin
  Result := Self;
  FVendaModel.Metodo
    .Pagar
    .&End;
end;

function TVendaMetodoController.VenderItem: IVendaMetodoController;
begin
  Result := Self;

  FVendaModel.Itens
    .Iterator
      .Add(
        TPDVUpdatesModel.New.Item
          .Metodo
            .Vender
              .SetItem(
                Trunc(
                  TCapturaValorView.New(nil)
                    .ExibeForm('Informe o código do Item', 'Confirmar', 'Cancelar')
                )
              )
            .&End
          .&End
      )
    .&End;
end;

end.
