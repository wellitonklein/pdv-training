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
  Caixa_State_Factory.Model,
  PDVUpdates_Type.Controller,
  System.SysUtils, Entidade_Caixa.Model;

{ TCaixaMetodoFecharModel }

function TCaixaMetodoFecharModel.&End: ICaixaMetodoModel;
var
  Caixa: TCaixa;
begin
  Result := FParent.Metodo;

  Caixa := FParent.Entidade;
  FParent.DAO.Modify(Caixa);
  Caixa.DATAFECHAMENTO := Now;
  Caixa.STATUS := Integer(tcsFechado);
  Caixa.VALORFECHAMENTO := Self.FValor;
  Caixa.FISCAL_FECHAMENTO := FFiscal.Entidade.GUUID;
  FParent.DAO.Update(Caixa);
  FParent.Entidade(Caixa);

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
