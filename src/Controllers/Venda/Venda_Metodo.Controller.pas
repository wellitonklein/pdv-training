unit Venda_Metodo.Controller;

interface

uses
  Venda.Controller.Interf,
  Caixa.Controller.Interf;

type
  TVendaMetodoController = class(TInterfacedObject, IVendaMetodoController)
  private
    FParent: IVendaController;
    FCaixaController: ICaixaController;
    function VerificaFinalizacao: IVendaMetodoController;
  public
    constructor Create(Parent: IVendaController; Caixa: ICaixaController);
    destructor Destroy; override;
    class function New(Parent: IVendaController; Caixa: ICaixaController): IVendaMetodoController;
    function Abrir: IVendaMetodoController;
    function Pagar: IVendaMetodoController;
    function Fechar: IVendaMetodoController;
    function IdentificarCliente: IVendaMetodoController;
    function VenderItem: IVendaMetodoItemController;
    function EfetuarPagamento: IVendaMetodoController;
    function EfetuarEstorno: IVendaMetodoController;
    function &End: IVendaController;
  end;

implementation

uses
  PDVUpdates.Controller,
  PDVUpdates.Model,
  Captura_ValorView,
  System.SysUtils, Venda_Metodo_Factory.Controller;

{ TVendaMetodoController }

function TVendaMetodoController.Abrir: IVendaMetodoController;
begin
  Result := Self;
  FParent.Model.Metodo
    .Abrir
    .&End;
end;

function TVendaMetodoController.EfetuarEstorno: IVendaMetodoController;
begin
  Result := Self;
  FParent.Model.Pagamentos
    .Iterator
      .Add(
        TPDVUpdatesController.New
          .Pagamento(FParent)
            .Estornar.&End
          .Model
      )
    .&End;
end;

function TVendaMetodoController.EfetuarPagamento: IVendaMetodoController;
begin
  Result := Self;
  FParent.Model.Pagamentos
    .Iterator
      .Add(
        TPDVUpdatesController.New
          .Pagamento(FParent)
            .Executar.&End
          .Model
      )
    .&End;
  Self.VerificaFinalizacao;
end;

function TVendaMetodoController.&End: IVendaController;
begin
  Result := FParent;
end;

constructor TVendaMetodoController.Create(Parent: IVendaController; Caixa: ICaixaController);
begin
  FParent       := Parent;
  FCaixaController := Caixa;
end;

destructor TVendaMetodoController.Destroy;
begin

  inherited;
end;

function TVendaMetodoController.Fechar: IVendaMetodoController;
begin
  Result := Self;
  FParent.Model.Metodo
    .Fechar
    .&End;
end;

function TVendaMetodoController.IdentificarCliente: IVendaMetodoController;
begin
  Result := Self;
  FParent.Model.Cliente(
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

class function TVendaMetodoController.New(Parent: IVendaController; Caixa: ICaixaController): IVendaMetodoController;
begin
  Result := Self.Create(Parent, Caixa);
end;

function TVendaMetodoController.Pagar: IVendaMetodoController;
begin
  Result := Self;
  FParent.Model.Metodo
    .Pagar
    .&End;
end;

function TVendaMetodoController.VenderItem: IVendaMetodoItemController;
begin
  Result := TVendaMetodoFactoryController.New.Item(FParent);
end;

function TVendaMetodoController.VerificaFinalizacao: IVendaMetodoController;
begin
  Result := Self;

//  if (FParent.Model.Pagamentos.ValorTotal >= FParent.Model.Itens.ValorTotal) then
  FParent.Metodo.Fechar;
end;

end.
