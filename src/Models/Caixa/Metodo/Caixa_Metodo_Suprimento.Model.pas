unit Caixa_Metodo_Suprimento.Model;

interface

uses
  Caixa.Model.interf,
  Usuario.Model.Interf;

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

{ TCaixaMetodoSuprimentoModel }

function TCaixaMetodoSuprimentoModel.&End: ICaixaMetodoModel;
begin
  Result := FParent.Metodo;
end;

constructor TCaixaMetodoSuprimentoModel.Create(Parent: ICaixaModel);
begin
  FParent := Parent;
  { TODO -oWelliton -cCaixa : Executar o processo de Suprimento }
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
