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

{ TCaixaMetodoSangriaModel }

function TCaixaMetodoSangriaModel.&End: ICaixaMetodoModel;
begin
  Result := FParent.Metodo;
  { TODO -oWelliton -cCaixa : Executar o processo de Sangria }
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
