unit Observer_Venda.Controller;

interface

uses
  Observer.Controller.Interf,
  System.Generics.Collections;

type
  TObserverVendaController = class(TInterfacedObject, ISubjectVendaController)
  private
    FListaObserver: TList<IObserverVendaController>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : ISubjectVendaController;
    function AddObserver(Value: IObserverVendaController): ISubjectVendaController;
    function RemoveObserver(Value: IObserverVendaController): ISubjectVendaController;
    function NotifyStatus(Value: string): ISubjectVendaController;
    function NotifyLimparVenda: ISubjectVendaController;
  end;

implementation

uses
  System.SysUtils;

{ TObserverVendaController }

function TObserverVendaController.AddObserver(Value: IObserverVendaController): ISubjectVendaController;
begin
  Result := Self;
  FListaObserver.Add(Value);
end;

constructor TObserverVendaController.Create;
begin
  FListaObserver := TList<IObserverVendaController>.Create;
end;

destructor TObserverVendaController.Destroy;
begin
  FreeAndNil(FListaObserver);
  inherited;
end;

class function TObserverVendaController.New: ISubjectVendaController;
begin
  Result := Self.Create;
end;

function TObserverVendaController.NotifyLimparVenda: ISubjectVendaController;
var
  I: Integer;
begin
  for I := 0 to Pred(FListaObserver.Count) do
    FListaObserver[I].LimparVenda;
end;

function TObserverVendaController.NotifyStatus(Value: string): ISubjectVendaController;
var
  I: Integer;
begin
  for I := 0 to Pred(FListaObserver.Count) do
    FListaObserver[I].UpdatesStatus(Value);
end;

function TObserverVendaController.RemoveObserver(Value: IObserverVendaController): ISubjectVendaController;
begin
  Result := Self;
  FListaObserver.Delete(FListaObserver.IndexOf(Value));
end;

end.
