unit Caixa_Metodo_Abrir.Model;

interface

uses
  Caixa.Model.interf,
  Usuario.Model.Interf;

type
  TCaixaMetodoAbrirModel = class(TInterfacedObject, ICaixaMetodoAbrirModel)
  private
    FParent: ICaixaModel;
    FValor: Currency;
    FOperador: IUsuarioModel;
  public
    constructor Create(Parent: ICaixaModel);
    destructor Destroy; override;
    class function New(Parent: ICaixaModel): ICaixaMetodoAbrirModel;
    function SetValorAbertura(Value: Currency): ICaixaMetodoAbrirModel;
    function SetOperador(Value: IUsuarioModel): ICaixaMetodoAbrirModel;
    function &End: ICaixaMetodoModel;
  end;

implementation

uses
  System.SysUtils, Caixa_State_Factory.Model;

{ TCaixaMetodoAbrirModel }

function TCaixaMetodoAbrirModel.&End: ICaixaMetodoModel;
begin
  Result := FParent.Metodo;

  FParent.Entidade.VALORABERTURA := Self.FValor;
  FParent.Entidade.USUARIO := FOperador.Entidade.GUUID;
  FParent.Entidade.STATUS  := 0;
  FParent.DAO.Insert(FParent.Entidade);

  FParent.SetState(TCaixaStateFactoryModel.New.Aberto);
end;

constructor TCaixaMetodoAbrirModel.Create(Parent: ICaixaModel);
begin
  FParent := Parent;
end;

destructor TCaixaMetodoAbrirModel.Destroy;
begin

  inherited;
end;

class function TCaixaMetodoAbrirModel.New(Parent: ICaixaModel): ICaixaMetodoAbrirModel;
begin
  Result := Self.Create(Parent);
end;

function TCaixaMetodoAbrirModel.SetOperador(
  Value: IUsuarioModel): ICaixaMetodoAbrirModel;
begin
  Result := Self;
  FOperador := Value;
end;

function TCaixaMetodoAbrirModel.SetValorAbertura(
  Value: Currency): ICaixaMetodoAbrirModel;
begin
  Result := Self;
  if (Value = 0) then
    raise Exception.Create('Não é possível abrir o caixa sem troco');
  FValor := Value;
end;

end.
