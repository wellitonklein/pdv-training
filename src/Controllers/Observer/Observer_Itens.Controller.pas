unit Observer_Itens.Controller;

interface

uses
  Observer.Controller.Interf,
  PDVUpdates_Type.Controller, System.Generics.Collections;

type
  TObserverItensController = class(TInterfacedObject, ISubjectItensController)
  private
    FListaObserver: TList<IObserverItensController>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : ISubjectItensController;
    function AddObserver(Value: IObserverItensController): ISubjectItensController;
    function RemoveObserver(Value: IObserverItensController): ISubjectItensController;
    function Notify(Value: TRecordItem): ISubjectItensController;
  end;

implementation

uses
  System.SysUtils;

{ TObserverItensController }

function TObserverItensController.AddObserver(
  Value: IObserverItensController): ISubjectItensController;
begin
  Result := Self;
  FListaObserver.Add(Value);
end;

constructor TObserverItensController.Create;
begin
  FListaObserver := TList<IObserverItensController>.Create;
end;

destructor TObserverItensController.Destroy;
begin
  FreeAndNil(FListaObserver);
  inherited;
end;

class function TObserverItensController.New: ISubjectItensController;
begin
  Result := Self.Create;
end;

function TObserverItensController.Notify(
  Value: TRecordItem): ISubjectItensController;
var
  I: Integer;
begin
  for I := 0 to Pred(FListaObserver.Count) do
    FListaObserver[I].Updates(Value);
end;

function TObserverItensController.RemoveObserver(
  Value: IObserverItensController): ISubjectItensController;
begin
  Result := Self;
  FListaObserver.Delete(FListaObserver.IndexOf(Value));
end;

end.
