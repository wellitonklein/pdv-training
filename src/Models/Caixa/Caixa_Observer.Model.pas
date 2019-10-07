unit Caixa_Observer.Model;

interface

uses
  Caixa.Model.interf,
  Observer.Controller.Interf;

type
  TCaixaObserverModel = class(TInterfacedObject, ICaixaObserverModel)
  private
    FParent: ICaixaModel;
    FCaixa: ISubjectCaixaController;
  public
    constructor Create(Parent: ICaixaModel);
    destructor Destroy; override;
    class function New(Parent: ICaixaModel): ICaixaObserverModel;
    function Caixa(Value: ISubjectCaixaController): ICaixaObserverModel; overload;
    function Caixa: ISubjectCaixaController; overload;
    function &End: ICaixaModel;
  end;

implementation

{ TCaixaObserverModel }

function TCaixaObserverModel.&End: ICaixaModel;
begin
  Result := FParent;
end;

constructor TCaixaObserverModel.Create(Parent: ICaixaModel);
begin
  FParent := Parent;
end;

destructor TCaixaObserverModel.Destroy;
begin

  inherited;
end;

function TCaixaObserverModel.Caixa(
  Value: ISubjectCaixaController): ICaixaObserverModel;
begin
  Result := Self;
  FCaixa := Value;
end;

function TCaixaObserverModel.Caixa: ISubjectCaixaController;
begin
  Result := FCaixa;
end;

class function TCaixaObserverModel.New(Parent: ICaixaModel): ICaixaObserverModel;
begin
  Result := Self.Create(Parent);
end;

end.
