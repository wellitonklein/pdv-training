unit Caixa_Metodo_Fechar.Model;

interface

uses
  Caixa.Model.interf,
  Usuario.Model.Interf;

type
  TCaixaMetodoFecharModel = class(TInterfacedObject, ICaixaMetodoFecharModel)
  private
    FParent: ICaixaModel;
    FValor: Currency;
    FFiscal: IUsuarioModel;
  public
    constructor Create(Parent: ICaixaModel);
    destructor Destroy; override;
    class function New(Parent: ICaixaModel): ICaixaMetodoFecharModel;
    function SetValorFechamento(Value: Currency): ICaixaMetodoFecharModel;
    function SetFiscal(Value: IUsuarioModel): ICaixaMetodoFecharModel;
    function &End: ICaixaMetodoModel;
  end;

implementation

uses
  Caixa_State_Factory.Model;

{ TCaixaMetodoFecharModel }

function TCaixaMetodoFecharModel.&End: ICaixaMetodoModel;
begin
  Result := FParent.Metodo;
  { TODO -oWelliton -cCaixa : Executar o processo de Fechamento }
  FParent.SetState(TCaixaStateFactoryModel.New.Fechado);
end;

constructor TCaixaMetodoFecharModel.Create(Parent: ICaixaModel);
begin
  FParent := Parent;
end;

destructor TCaixaMetodoFecharModel.Destroy;
begin

  inherited;
end;

class function TCaixaMetodoFecharModel.New(Parent: ICaixaModel): ICaixaMetodoFecharModel;
begin
  Result := Self.Create(Parent);
end;

function TCaixaMetodoFecharModel.SetFiscal(
  Value: IUsuarioModel): ICaixaMetodoFecharModel;
begin
  Result := Self;
  FFiscal := Value;
end;

function TCaixaMetodoFecharModel.SetValorFechamento(
  Value: Currency): ICaixaMetodoFecharModel;
begin
  Result := Self;
  FValor := Value;
end;

end.
