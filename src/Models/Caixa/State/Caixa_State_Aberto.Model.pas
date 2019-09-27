unit Caixa_State_Aberto.Model;

interface

uses
  Caixa.Model.interf;

type
  TCaixaStateAbertoModel = class(TInterfacedObject, ICaixaMetodoModel)
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

{ TCaixaStateAbertoModel }

function TCaixaStateAbertoModel.Abrir: ICaixaMetodoAbrirModel;
begin
  raise Exception.Create('O Caixa já está aberto');
end;

function TCaixaStateAbertoModel.Bloquear: ICaixaMetodoBloquearModel;
begin

end;

function TCaixaStateAbertoModel.&End: ICaixaModel;
begin

end;

constructor TCaixaStateAbertoModel.Create;
begin

end;

function TCaixaStateAbertoModel.Desbloquear: ICaixaMetodoDesbloquearModel;
begin
  raise Exception.Create('O Caixa já está desbloqueado');
end;

destructor TCaixaStateAbertoModel.Destroy;
begin

  inherited;
end;

function TCaixaStateAbertoModel.Fechar: ICaixaMetodoFecharModel;
begin

end;

class function TCaixaStateAbertoModel.New: ICaixaMetodoModel;
begin
  Result := Self.Create;
end;

function TCaixaStateAbertoModel.Sangria: ICaixaMetodoSangriaModel;
begin

end;

function TCaixaStateAbertoModel.Suprimento: ICaixaMetodoSuprimentoModel;
begin

end;

function TCaixaStateAbertoModel.TrocarOperador: ICaixaMetodoTrocarOperadorModel;
begin

end;

end.
