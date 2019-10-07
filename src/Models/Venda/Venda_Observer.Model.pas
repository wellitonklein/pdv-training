unit Venda_Observer.Model;

interface

uses
  Venda.Model.Inerf,
  Observer.Controller.Interf;

type
  TVendaObserverModel = class(TInterfacedObject, IVendaObserverModel)
  private
    FParent: IVendaModel;
    FItens: ISubjectItensController;
    FVenda: ISubjectVendaController;
  public
    constructor Create(Parent: IVendaModel);
    destructor Destroy; override;
    class function New(Parent: IVendaModel): IVendaObserverModel;
    function Itens(Value: ISubjectItensController): IVendaObserverModel; overload;
    function Itens: ISubjectItensController; overload;
    function Venda(Value: ISubjectVendaController): IVendaObserverModel; overload;
    function Venda: ISubjectVendaController; overload;
    function &End: IVendaModel;
  end;

implementation

{ TVendaObserverModel }

function TVendaObserverModel.&End: IVendaModel;
begin
  Result := FParent;
end;

constructor TVendaObserverModel.Create(Parent: IVendaModel);
begin
  FParent := Parent;
end;

destructor TVendaObserverModel.Destroy;
begin

  inherited;
end;

function TVendaObserverModel.Itens(
  Value: ISubjectItensController): IVendaObserverModel;
begin
  Result := Self;
  FItens := Value;
end;

function TVendaObserverModel.Itens: ISubjectItensController;
begin
  Result := FItens;
end;

class function TVendaObserverModel.New(Parent: IVendaModel): IVendaObserverModel;
begin
  Result := Self.Create(Parent);
end;

function TVendaObserverModel.Venda(
  Value: ISubjectVendaController): IVendaObserverModel;
begin
  Result := Self;
  FVenda := Value;
end;

function TVendaObserverModel.Venda: ISubjectVendaController;
begin
  Result := FVenda;
end;

end.
