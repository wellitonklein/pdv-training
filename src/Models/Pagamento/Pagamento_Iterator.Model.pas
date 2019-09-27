unit Pagamento_Iterator.Model;

interface

uses
  Pagamento.Model.Interf, System.Generics.Collections;

type
  TPagamentoIteratorModel = class(TInterfacedObject, IPagamentoIteratorModel)
  private
    FParent: IPagamentoModel;
    FLista: TList<IPagamentoModel>;
    FCount: SmallInt;
  public
    constructor Create(Parent: IPagamentoModel);
    destructor Destroy; override;
    class function New(Parent: IPagamentoModel): IPagamentoIteratorModel;
    function hasNext: Boolean;
    function Next: IPagamentoModel;
    function Add(Value: IPagamentoModel): IPagamentoIteratorModel;
    function &End: IPagamentoModel;
  end;

implementation

uses
  System.SysUtils;

{ TPagamentoIteratorModel }

function TPagamentoIteratorModel.Add(
  Value: IPagamentoModel): IPagamentoIteratorModel;
begin
  Result := Self;
  FLista.Add(Value);
end;

function TPagamentoIteratorModel.&End: IPagamentoModel;
begin
  Result := FParent;
end;

constructor TPagamentoIteratorModel.Create(Parent: IPagamentoModel);
begin
  FParent := Parent;
  FLista  := TList<IPagamentoModel>.Create;
end;

destructor TPagamentoIteratorModel.Destroy;
begin
  FreeAndNil(FLista);
  inherited;
end;

function TPagamentoIteratorModel.hasNext: Boolean;
begin
  Result := not (FCount = FLista.Count);
end;

class function TPagamentoIteratorModel.New(Parent: IPagamentoModel): IPagamentoIteratorModel;
begin
  Result := Self.Create(Parent);
end;

function TPagamentoIteratorModel.Next: IPagamentoModel;
begin
  Result := FLista[FCount];
  Inc(FCount);
end;

end.
