unit Caixa_Metodo_Sangria.Model;

interface

uses
  Caixa.Model.interf, Usuario.Model.Interf;

type
  TCaixaMetodoSangriaModel = class(TInterfacedObject, ICaixaMetodoSangriaModel)
  private
    FParent: ICaixaModel;
    FValor: Currency;
    FAutorizador: IUsuarioModel;
  public
    constructor Create(Parent: ICaixaModel);
    destructor Destroy; override;
    class function New(Parent: ICaixaModel): ICaixaMetodoSangriaModel;
    function SetValor(Value: Currency): ICaixaMetodoSangriaModel;
    function SetAutorizador(Value: IUsuarioModel): ICaixaMetodoSangriaModel;
    function &End: ICaixaMetodoModel;
  end;

implementation

uses
  Entidade_Caixa.Model,
  PDVUpdates.Model,
  PDVUpdates_Type.Controller;

{ TCaixaMetodoSangriaModel }

function TCaixaMetodoSangriaModel.&End: ICaixaMetodoModel;
var
  CAIXA: TCAIXA;
begin
  Result := FParent.Metodo;

  CAIXA := FParent.Entidade;
  FParent.DAO.Modify(CAIXA);
  CAIXA.OPERACOES.Add(TPDVUpdatesModel.New.Entidade.CaixaOperacoes);
  CAIXA.OPERACOES.Last.CAIXA := FParent.Entidade.GUUID;
  CAIXA.OPERACOES.Last.TIPO := Integer(toSangria);
  CAIXA.OPERACOES.Last.VALOR := Self.FValor;
  CAIXA.OPERACOES.Last.FISCAL := Self.FAutorizador.Entidade.GUUID;
  FParent.DAO.Update(CAIXA);
end;

constructor TCaixaMetodoSangriaModel.Create(Parent: ICaixaModel);
begin
  FParent := Parent;
end;

destructor TCaixaMetodoSangriaModel.Destroy;
begin

  inherited;
end;

class function TCaixaMetodoSangriaModel.New(Parent: ICaixaModel): ICaixaMetodoSangriaModel;
begin
  Result := Self.Create(Parent);
end;

function TCaixaMetodoSangriaModel.SetAutorizador(
  Value: IUsuarioModel): ICaixaMetodoSangriaModel;
begin
  Result := Self;
  FAutorizador := Value;
end;

function TCaixaMetodoSangriaModel.SetValor(
  Value: Currency): ICaixaMetodoSangriaModel;
begin
  Result := Self;
  FValor := Value;
end;

end.
