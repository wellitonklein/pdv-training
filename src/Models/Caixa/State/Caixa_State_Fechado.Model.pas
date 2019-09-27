unit Caixa_State_Fechado.Model;

interface

uses
  Caixa.Model.interf;

type
  TCaixaStateFechadoModel = class(TInterfacedObject, ICaixaMetodoModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : ICaixaMetodoModel;
    function Abrir: ICaixaMetodoAbrirModel;
    function Fechar: ICaixaMetodoFecharModel;
    function Suprimento: ICaixaMetodoSuprimentoModel;
    function Sangria: ICaixaMetodoSangriaModel;
    function Bloquear: ICaixaMetodoBloquearModel;
    function Desbloquear: ICaixaMetodoDesbloquearModel;
    function TrocarOperador: ICaixaMetodoTrocarOperadorModel;
    function &End: ICaixaModel;
  end;

implementation

uses
  System.SysUtils;

{ TCaixaStateFechadoModel }

function TCaixaStateFechadoModel.Abrir: ICaixaMetodoAbrirModel;
begin

end;

function TCaixaStateFechadoModel.Bloquear: ICaixaMetodoBloquearModel;
begin
  raise Exception.Create('O Caixa está fechado');
end;

function TCaixaStateFechadoModel.&End: ICaixaModel;
begin

end;

constructor TCaixaStateFechadoModel.Create;
begin

end;

function TCaixaStateFechadoModel.Desbloquear: ICaixaMetodoDesbloquearModel;
begin
  raise Exception.Create('O Caixa está fechado');
end;

destructor TCaixaStateFechadoModel.Destroy;
begin

  inherited;
end;

function TCaixaStateFechadoModel.Fechar: ICaixaMetodoFecharModel;
begin
  raise Exception.Create('O Caixa já está fechado');
end;

class function TCaixaStateFechadoModel.New: ICaixaMetodoModel;
begin
  Result := Self.Create;
end;

function TCaixaStateFechadoModel.Sangria: ICaixaMetodoSangriaModel;
begin
  raise Exception.Create('O Caixa está fechado');
end;

function TCaixaStateFechadoModel.Suprimento: ICaixaMetodoSuprimentoModel;
begin
  raise Exception.Create('O Caixa está fechado');
end;

function TCaixaStateFechadoModel.TrocarOperador: ICaixaMetodoTrocarOperadorModel;
begin
  raise Exception.Create('O Caixa está fechado');
end;

end.
