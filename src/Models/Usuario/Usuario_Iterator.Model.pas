unit Usuario_Iterator.Model;

interface

uses
  Usuario.Model.Interf,
  System.Generics.Collections;

type
  TUsuarioIteratorModel = class(TInterfacedObject, IUsuarioIteratorModel)
  private
    FParent: IUsuarioModel;
    FCount: Integer;
    FLista: TList<IUsuarioModel>;
  public
    constructor Create(Parent: IUsuarioModel);
    destructor Destroy; override;
    class function New(Parent: IUsuarioModel): IUsuarioIteratorModel;
    function hasNext: Boolean;
    function Next: IUsuarioModel;
    function Add(Value: IUsuarioModel): IUsuarioIteratorModel;
    function &End: IUsuarioModel;
  end;

implementation

uses
  System.SysUtils;

{ TUsuarioIteratorModel }

function TUsuarioIteratorModel.Add(Value: IUsuarioModel): IUsuarioIteratorModel;
begin
  Result := self;
  FLista.Add(Value);
end;

function TUsuarioIteratorModel.&End: IUsuarioModel;
begin
  Result := FParent;
end;

constructor TUsuarioIteratorModel.Create(Parent: IUsuarioModel);
begin
  FParent := Parent;
  FCount := 0;
  FLista := TList<IUsuarioModel>.Create;
end;

destructor TUsuarioIteratorModel.Destroy;
begin
  FreeAndNil(FLista);
  inherited;
end;

function TUsuarioIteratorModel.hasNext: Boolean;
begin
  Result := (not FCount = FLista.Count);
end;

class function TUsuarioIteratorModel.New(Parent: IUsuarioModel): IUsuarioIteratorModel;
begin
  Result := Self.Create(Parent);
end;

function TUsuarioIteratorModel.Next: IUsuarioModel;
begin
  Result := FLista.Items[FCount];
  Inc(FCount);
end;

end.
