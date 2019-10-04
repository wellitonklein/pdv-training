unit Observer.Controller.Interf;

interface

uses
  PDVUpdates_Type.Controller;

type

  IObserverItensController = interface
    ['{733248A8-6788-4FF2-856D-F5C0688BCC4C}']
    function Updates(Value: TRecordItem): IObserverItensController;
  end;

  ISubjectItensController = interface
    ['{CE110461-AF4A-438D-85E4-06B990C87A43}']
    function AddObserver(Value: IObserverItensController): ISubjectItensController;
    function RemoveObserver(Value: IObserverItensController): ISubjectItensController;
    function Notify(Value: TRecordItem): ISubjectItensController;
  end;

implementation

end.
