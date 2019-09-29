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

uses
  Entidade_Caixa.Model;

{ TCaixaMetodoTrocarOperadorModel }

function TCaixaMetodoTrocarOperadorModel.&End: ICaixaMetodoModel;
var
  CAIXA: TCAIXA;
begin
  Result := FParent.Metodo;

  CAIXA := FParent.Entidade;
  FParent.DAO.Modify(CAIXA);
  CAIXA.OPERADOR := FOperador.Entidade.GUUID;
  FParent.DAO.Update(CAIXA);
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
