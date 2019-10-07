unit Observer.Controller.Interf;

interface

uses
  PDVUpdates_Type.Controller;

type

  IObserverItensController = interface
    ['{733248A8-6788-4FF2-856D-F5C0688BCC4C}']
    function UpdatesItem(Value: TRecordItem): IObserverItensController;
  end;

  ISubjectItensController = interface
    ['{CE110461-AF4A-438D-85E4-06B990C87A43}']
    function AddObserver(Value: IObserverItensController): ISubjectItensController;
    function RemoveObserver(Value: IObserverItensController): ISubjectItensController;
    function Notify(Value: TRecordItem): ISubjectItensController;
  end;

  IObserverCaixaController = interface
    ['{1DB7D531-5656-4234-B0FF-6EB5477B402A}']
    function UpdatesCaixa(Value: string): IObserverCaixaController;
  end;

  ISubjectCaixaController = interface
    ['{66D07D27-CE58-4035-9B88-A584900CF57A}']
    function AddObserver(Value: IObserverCaixaController): ISubjectCaixaController;
    function RemoveObserver(Value: IObserverCaixaController): ISubjectCaixaController;
    function Notify(Value: string): ISubjectCaixaController;
  end;

implementation

end.
