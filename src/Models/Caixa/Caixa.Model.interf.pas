unit Caixa.Model.interf;

interface

uses
  Usuario.Model.Interf,
  Entidade_Caixa.Model,
  ormbr.container.objectset.interfaces;

type
  ICaixaModel = interface;
  ICaixaMetodoModel = interface;
  ICaixaMetodoAbrirModel = interface;
  ICaixaMetodoFecharModel = interface;
  ICaixaMetodoSuprimentoModel = interface;
  ICaixaMetodoSangriaModel = interface;
  ICaixaMetodoBloquearModel = interface;
  ICaixaMetodoDesbloquearModel = interface;
  ICaixaMetodoTrocarOperadorModel = interface;

  ICaixaModel = interface
    ['{437844E1-00F0-4BF3-AF3B-2E7F24AD1E84}']
    function Metodo: ICaixaMetodoModel;
    function SetState(Value: ICaixaMetodoModel): ICaixaModel;
    function Entidade: TCaixa;
    function DAO: IContainerObjectSet<TCaixa>;
  end;

  ICaixaMetodoModel = interface
    ['{DA52D2B8-B6C8-4707-BCF8-8DAD3AD08108}']
    function Abrir: ICaixaMetodoAbrirModel;
    function Fechar: ICaixaMetodoFecharModel;
    function Suprimento: ICaixaMetodoSuprimentoModel;
    function Sangria: ICaixaMetodoSangriaModel;
    function Bloquear: ICaixaMetodoBloquearModel;
    function Desbloquear: ICaixaMetodoDesbloquearModel;
    function TrocarOperador: ICaixaMetodoTrocarOperadorModel;
    function &End: ICaixaModel;
  end;

  ICaixaMetodoAbrirModel = interface
    ['{B8DB372F-7FC1-4100-8344-A69E51D4914C}']
    function SetValorAbertura(Value: Currency): ICaixaMetodoAbrirModel;
    function SetOperador(Value: IUsuarioModel): ICaixaMetodoAbrirModel;
    function &End: ICaixaMetodoModel;
  end;

  ICaixaMetodoFecharModel = interface
    ['{B8DB372F-7FC1-4100-8344-A69E51D4914C}']
    function SetValorFechamento(Value: Currency): ICaixaMetodoFecharModel;
    function SetFiscal(Value: IUsuarioModel): ICaixaMetodoFecharModel;
    function &End: ICaixaMetodoModel;
  end;

  ICaixaMetodoSuprimentoModel = interface
    ['{B8DB372F-7FC1-4100-8344-A69E51D4914C}']
    function SetValor(Value: Currency): ICaixaMetodoSuprimentoModel;
    function SetAutorizador(Value: IUsuarioModel): ICaixaMetodoSuprimentoModel;
    function &End: ICaixaMetodoModel;
  end;

  ICaixaMetodoSangriaModel = interface
    ['{B8DB372F-7FC1-4100-8344-A69E51D4914C}']
    function SetValor(Value: Currency): ICaixaMetodoSangriaModel;
    function SetAutorizador(Value: IUsuarioModel): ICaixaMetodoSangriaModel;
    function &End: ICaixaMetodoModel;
  end;

  ICaixaMetodoBloquearModel = interface
    ['{0239F156-DF74-48A3-BE97-94A6A1F8370B}']
    function SetAutorizador(Value: IUsuarioModel): ICaixaMetodoBloquearModel;
    function &End: ICaixaMetodoModel;
  end;

  ICaixaMetodoDesbloquearModel = interface
    ['{78021285-14FF-4216-A7B1-47F0F0B7FD3B}']
    function SetAutorizador(Value: IUsuarioModel): ICaixaMetodoDesbloquearModel;
    function &End: ICaixaMetodoModel;
  end;

  ICaixaMetodoTrocarOperadorModel = interface
    ['{34513AE4-A10E-4105-8631-88F1FFB42E1B}']
    function SetOperador(Value: IUsuarioModel): ICaixaMetodoTrocarOperadorModel;
    function SetAutorizador(Value: IUsuarioModel): ICaixaMetodoTrocarOperadorModel;
    function &End: ICaixaMetodoModel;
  end;

implementation

end.
