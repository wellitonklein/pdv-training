unit Observer_Caixa.Controller;

interface

uses
  Observer.Controller.Interf,
  System.Generics.Collections;

type
  TObserverCaixaController = class(TInterfacedObject, ISubjectCaixaController)
  private
    FListaObserver: TList<IObserverCaixaController>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : ISubjectCaixaController;
    function AddObserver(Value: IObserverCaixaController): ISubjectCaixaController;
    function RemoveObserver(Value: IObserverCaixaController): ISubjectCaixaController;
    function Notify(Value: string): ISubjectCaixaController;
  end;

implementation

uses
  System.SysUtils;

{ TObserverCaixaController }

function TObserverCaixaController.AddObserver(Value: IObserverCaixaController): ISubjectCaixaController;
begin
  Result := Self;
  FListaObserver.Add(Value);
end;

constructor TObserverCaixaController.Create;
begin
  FListaObserver := TList<IObserverCaixaController>.Create;
end;

destructor TObserverCaixaController.Destroy;
begin
  FreeAndNil(FListaObserver);
  inherited;
end;

class function TObserverCaixaController.New: ISubjectCaixaController;
begin
  Result := Self.Create;
end;

function TObserverCaixaController.Notify(Value: string): ISubjectCaixaController;
var
  I: Integer;
begin
  for I := 0 to Pred(FListaObserver.Count) do
    FListaObserver[I].UpdatesCaixa(Value);
end;

function TObserverCaixaController.RemoveObserver(Value: IObserverCaixaController): ISubjectCaixaController;
begin
  Result := Self;
  FListaObserver.Delete(FListaObserver.IndexOf(Value));
end;

end.
