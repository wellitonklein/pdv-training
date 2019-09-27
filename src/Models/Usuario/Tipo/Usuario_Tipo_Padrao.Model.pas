unit Usuario_Tipo_Padrao.Model;

interface

uses
  Usuario.Model.Interf,
  Usuario_Operacoes.Controller.Interf;

type
  TUsuarioTipoPadraoModel = class(TInterfacedObject, IUsuarioMetodoModel)
  private
    FParent: IUsuarioModel;
    FOperacao: IUsuarioOperacoesController;
  public
    constructor Create(Parent: IUsuarioModel); overload;
    destructor Destroy; override;
    class function New(Parent: IUsuarioModel): IUsuarioMetodoModel; overload;

    // IUsuarioMetodoModel
    function SetOperacao(Value: IUsuarioOperacoesController): IUsuarioMetodoModel;
    function AbrirCaixa: IUsuarioMetodoModel;
    function FecharCaixa: IUsuarioMetodoModel;
    function Sangria: IUsuarioMetodoModel;
    function Suprimento: IUsuarioMetodoModel;
    function CancelarCupom: IUsuarioMetodoModel;
    function DevolverCupom: IUsuarioMetodoModel;
    function CancelarItem: IUsuarioMetodoModel;
    function DevolverItem: IUsuarioMetodoModel;
    function BloquearCaixa: IUsuarioMetodoModel;
    function DesbloquearCaixa: IUsuarioMetodoModel;
    function TrocarOperador: IUsuarioMetodoModel;
    function &End: IUsuarioModel;
  end;

implementation

{ TUsuarioTipoPadraoModel }

function TUsuarioTipoPadraoModel.AbrirCaixa: IUsuarioMetodoModel;
begin
  Result := Self;
end;

function TUsuarioTipoPadraoModel.Suprimento: IUsuarioMetodoModel;
begin
  Result := Self;
end;

function TUsuarioTipoPadraoModel.TrocarOperador: IUsuarioMetodoModel;
begin
  Result := Self;
end;

function TUsuarioTipoPadraoModel.BloquearCaixa: IUsuarioMetodoModel;
begin
  Result := Self;
end;

function TUsuarioTipoPadraoModel.CancelarCupom: IUsuarioMetodoModel;
begin
  Result := Self;
end;

function TUsuarioTipoPadraoModel.CancelarItem: IUsuarioMetodoModel;
begin
  Result := Self;
end;

function TUsuarioTipoPadraoModel.&End: IUsuarioModel;
begin
  Result := FParent;
end;

constructor TUsuarioTipoPadraoModel.Create(Parent: IUsuarioModel);
begin
  FParent := Parent;
end;

function TUsuarioTipoPadraoModel.DesbloquearCaixa: IUsuarioMetodoModel;
begin
  Result := Self;
end;

function TUsuarioTipoPadraoModel.Sangria: IUsuarioMetodoModel;
begin
  Result := Self;
end;

destructor TUsuarioTipoPadraoModel.Destroy;
begin

  inherited;
end;

function TUsuarioTipoPadraoModel.DevolverCupom: IUsuarioMetodoModel;
begin
  Result := Self;
end;

function TUsuarioTipoPadraoModel.DevolverItem: IUsuarioMetodoModel;
begin
  Result := Self;
end;

function TUsuarioTipoPadraoModel.FecharCaixa: IUsuarioMetodoModel;
begin
  Result := Self;
end;

class function TUsuarioTipoPadraoModel.New(Parent: IUsuarioModel)
  : IUsuarioMetodoModel;
begin
  Result := Self.Create(Parent);
end;

function TUsuarioTipoPadraoModel.SetOperacao(
  Value: IUsuarioOperacoesController): IUsuarioMetodoModel;
begin
  Result := Self;
  FOperacao := Value;
end;

end.
