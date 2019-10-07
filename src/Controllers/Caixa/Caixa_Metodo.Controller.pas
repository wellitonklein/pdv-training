unit Caixa_Metodo.Controller;

interface

uses
  Caixa.Controller.Interf, Caixa.Model.interf, Captura_ValorView;

type
  TCaixaMetodoController = class(TInterfacedObject, ICaixaMetodoController)
  private
    FParent: ICaixaController;
    FModel: ICaixaModel;
  public
    constructor Create(Parent: ICaixaController);
    destructor Destroy; override;
    class function New(Parent: ICaixaController): ICaixaMetodoController;
    function Abrir: ICaixaMetodoController;
    function Fechar: ICaixaMetodoController;
    function Suprimento: ICaixaMetodoController;
    function Sangria: ICaixaMetodoController;
    function Bloquear: ICaixaMetodoController;
    function Desbloquear: ICaixaMetodoController;
    function TrocarOperador: ICaixaMetodoController;
    function Model: ICaixaModel;
    function &End: ICaixaController;
  end;

implementation

uses
  PDVUpdates.Model,
  Usuario_Factory.Controller,
  System.SysUtils;

{ TCaixaMetodoController }

function TCaixaMetodoController.Abrir: ICaixaMetodoController;
begin
  Result := Self;
  FModel.Metodo
    .Abrir
      .SetFiscal(
        TUsuarioFactoryController.New.Usuario.Caixa.AbrirCaixa.&End
      )
      .SetOperador(
        TUsuarioFactoryController.New.Usuario.Caixa.DesbloquearCaixa.&End
      )
      .SetValorAbertura(
        TCapturaValorView.New(nil).ExibeForm('Valor da abertura', 'Confirmar', 'Cancelar')
      )
    .&End;
end;

function TCaixaMetodoController.Bloquear: ICaixaMetodoController;
begin
  Result := Self;
  FModel.Metodo
    .Bloquear
      .SetAutorizador(
        TUsuarioFactoryController.New.Usuario.Caixa.BloquearCaixa.&End
      )
    .&End;
end;

function TCaixaMetodoController.&End: ICaixaController;
begin
  Result := FParent;
end;

constructor TCaixaMetodoController.Create(Parent: ICaixaController);
begin
  FParent := Parent;
  FModel  :=
    TPDVUpdatesModel.New.Caixa
      .Observers
        .Caixa(FParent.ObserverCaixa)
      .&End;
end;

function TCaixaMetodoController.Desbloquear: ICaixaMetodoController;
begin
  Result := Self;
  FModel.Metodo
    .Desbloquear
      .SetAutorizador(
        TUsuarioFactoryController.New.Usuario.Caixa.DesbloquearCaixa.&End
      )
    .&End;
end;

destructor TCaixaMetodoController.Destroy;
begin

  inherited;
end;

function TCaixaMetodoController.Fechar: ICaixaMetodoController;
begin
  Result := Self;
  FModel.Metodo
    .Fechar
      .SetFiscal(
        TUsuarioFactoryController.New.Usuario.Caixa.FecharCaixa.&End
      )
      .SetValorFechamento(
        TCapturaValorView.New(nil).ExibeForm('Valor do fechamento', 'Confirmar', 'Cancelar')
      )
    .&End;
end;

function TCaixaMetodoController.Model: ICaixaModel;
begin
  Result := FModel;
end;

class function TCaixaMetodoController.New(Parent: ICaixaController): ICaixaMetodoController;
begin
  Result := Self.Create(Parent);
end;

function TCaixaMetodoController.Sangria: ICaixaMetodoController;
begin
  Result := Self;
  FModel.Metodo
    .Sangria
      .SetAutorizador(
        TUsuarioFactoryController.New.Usuario.Caixa.Sangria.&End
      )
      .SetValor(
        TCapturaValorView.New(nil).ExibeForm('Valor da sangria', 'Confirmar', 'Cancelar')
      )
    .&End;
end;

function TCaixaMetodoController.Suprimento: ICaixaMetodoController;
begin
  Result := Self;
  FModel.Metodo
    .Suprimento
      .SetAutorizador(
        TUsuarioFactoryController.New.Usuario.Caixa.Suprimento.&End
      )
      .SetValor(
        TCapturaValorView.New(nil).ExibeForm('Valor do suprimento', 'Confirmar', 'Cancelar')
      )
    .&End;
end;

function TCaixaMetodoController.TrocarOperador: ICaixaMetodoController;
begin
  Result := Self;
  FModel.Metodo
    .TrocarOperador
      .SetOperador(
        TUsuarioFactoryController.New.Usuario.Caixa.DesbloquearCaixa.&End
      )
      .SetAutorizador(
        TUsuarioFactoryController.New.Usuario.Caixa.TrocarOperador.&End
      )
    .&End;
end;

end.
