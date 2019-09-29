unit Caixa_Metodo_Suprimento.Model;

interface

uses
  Caixa.Model.interf,
  Usuario.Model.Interf, PDVUpdates.Model, PDVUpdates_Type.Controller;

type
  TCaixaMetodoSuprimentoModel = class(TInterfacedObject, ICaixaMetodoSuprimentoModel)
  private
    FParent: ICaixaModel;
    FValor: Currency;
    FAutorizador: IUsuarioModel;
  public
    constructor Create(Parent: ICaixaModel);
    destructor Destroy; override;
    class function New(Parent: ICaixaModel): ICaixaMetodoSuprimentoModel;
    function SetValor(Value: Currency): ICaixaMetodoSuprimentoModel;
    function SetAutorizador(Value: IUsuarioModel): ICaixaMetodoSuprimentoModel;
    function &End: ICaixaMetodoModel;
  end;

implementation

uses
  Entidade_Caixa.Model;

{ TCaixaMetodoSuprimentoModel }

function TCaixaMetodoSuprimentoModel.&End: ICaixaMetodoModel;
var
  CAIXA: TCAIXA;
begin
  Result := FParent.Metodo;

  CAIXA := FParent.Entidade;
  FParent.DAO.Modify(CAIXA);
  CAIXA.OPERACOES.Add(TPDVUpdatesModel.New.Entidade.CaixaOperacoes);
  CAIXA.OPERACOES.Last.CAIXA := FParent.Entidade.GUUID;
  CAIXA.OPERACOES.Last.TIPO := Integer(toSuprimento);
  CAIXA.OPERACOES.Last.VALOR := Self.FValor;
  CAIXA.OPERACOES.Last.FISCAL := Self.FAutorizador.Entidade.GUUID;
  FParent.DAO.Update(CAIXA);
end;

constructor TCaixaMetodoSuprimentoModel.Create(Parent: ICaixaModel);
begin
  FParent := Parent;
end;

destructor TCaixaMetodoSuprimentoModel.Destroy;
begin

  inherited;
end;

class function TCaixaMetodoSuprimentoModel.New(Parent: ICaixaModel): ICaixaMetodoSuprimentoModel;
begin
  Result := Self.Create(Parent);
end;

function TCaixaMetodoSuprimentoModel.SetAutorizador(
  Value: IUsuarioModel): ICaixaMetodoSuprimentoModel;
begin
  Result := Self;
  FAutorizador := Value;
end;

function TCaixaMetodoSuprimentoModel.SetValor(
  Value: Currency): ICaixaMetodoSuprimentoModel;
begin
  Result := Self;
  FValor := Value;
end;

end.
