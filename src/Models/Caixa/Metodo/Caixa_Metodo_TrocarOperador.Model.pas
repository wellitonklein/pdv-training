unit Caixa_Metodo_TrocarOperador.Model;

interface

uses
  Caixa.Model.interf, Usuario.Model.Interf;

type
  TCaixaMetodoTrocarOperadorModel = class(TInterfacedObject, ICaixaMetodoTrocarOperadorModel)
  private
    FParent: ICaixaModel;
    FOperador: IUsuarioModel;
    FAutorizador: IUsuarioModel;
  public
    constructor Create(Parent: ICaixaModel);
    destructor Destroy; override;
    class function New(Parent: ICaixaModel): ICaixaMetodoTrocarOperadorModel;
    function SetOperador(Value: IUsuarioModel): ICaixaMetodoTrocarOperadorModel;
    function SetAutorizador(Value: IUsuarioModel): ICaixaMetodoTrocarOperadorModel;
    function &End: ICaixaMetodoModel;
  end;

implementation

{ TCaixaMetodoTrocarOperadorModel }

function TCaixaMetodoTrocarOperadorModel.&End: ICaixaMetodoModel;
begin
  Result := FParent.Metodo;
  { TODO -oWelliton -cCaixa : Executar o processo de Trocar de Operador }
end;

constructor TCaixaMetodoTrocarOperadorModel.Create(Parent: ICaixaModel);
begin
  FParent := Parent;
end;

destructor TCaixaMetodoTrocarOperadorModel.Destroy;
begin

  inherited;
end;

class function TCaixaMetodoTrocarOperadorModel.New(Parent: ICaixaModel): ICaixaMetodoTrocarOperadorModel;
begin
  Result := Self.Create(Parent);
end;

function TCaixaMetodoTrocarOperadorModel.SetAutorizador(
  Value: IUsuarioModel): ICaixaMetodoTrocarOperadorModel;
begin
  Result := Self;
  FAutorizador := Value;
end;

function TCaixaMetodoTrocarOperadorModel.SetOperador(
  Value: IUsuarioModel): ICaixaMetodoTrocarOperadorModel;
begin
  Result := Self;
  FOperador := Value;
end;

end.
