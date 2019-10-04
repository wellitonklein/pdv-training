unit Venda.Controller;

interface

uses
  Venda.Controller.Interf,
  Caixa.Controller.Interf,
  Venda.Model.Inerf, Observer.Controller.Interf;

type
  TVendaController = class(TInterfacedObject, IVendaController)
  private
    FMetodo: IVendaMetodoController;
    FCaixa: ICaixaController;
    FVendaModel: IVendaModel;
    FObserverItens: ISubjectItensController;
  public
    constructor Create(Caixa: ICaixaController);
    destructor Destroy; override;
    class function New(Caixa: ICaixaController): IVendaController;
    function Metodo: IVendaMetodoController;
    function Model: IVendaModel;
    function ObserverItem: ISubjectItensController;
  end;

implementation

uses
  Venda_Metodo.Controller,
  PDVUpdates.Model,
  PDVUpdates.Controller,
  Observer_Itens.Controller;

{ TVendaController }

constructor TVendaController.Create(Caixa: ICaixaController);
begin
  FCaixa      := Caixa;
  FMetodo     := TVendaMetodoController.New(Self, FCaixa);
  FObserverItens := TObserverItensController.New;

  FVendaModel :=
    TPDVUpdatesModel.New
      .Venda(
        FCaixa.Metodo.Model
      )
      .ModalidadeFiscal(
        TPDVUpdatesController.New.Fiscal.ProxyFiscal
      )
      .Observers
        .Itens(FObserverItens)
      .&End;
end;

destructor TVendaController.Destroy;
begin

  inherited;
end;

function TVendaController.Metodo: IVendaMetodoController;
begin
  Result := FMetodo;
end;

function TVendaController.Model: IVendaModel;
begin
  Result := FVendaModel;
end;

class function TVendaController.New(Caixa: ICaixaController): IVendaController;
begin
  Result := Self.Create(Caixa);
end;

function TVendaController.ObserverItem: ISubjectItensController;
begin
  Result := FObserverItens;
end;

end.
