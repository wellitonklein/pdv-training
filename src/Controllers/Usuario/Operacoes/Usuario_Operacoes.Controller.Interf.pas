unit Usuario_Operacoes.Controller.Interf;

interface

uses
  System.Generics.Collections, PDVUpdates_Type.Controller;

type
  IUsuarioOperacoesController = interface;
  IUsuarioOperacaoPedirSenhaController = interface;

  IUsuarioOperacoesController = interface
    ['{FD6C55B3-68F6-4B77-8764-4FCEB4DDCAC0}']
    function PedirSenha: IUsuarioOperacaoPedirSenhaController;
  end;

  IUsuarioOperacaoPedirSenhaController = interface
    ['{9B9D042D-6BB8-4F28-B450-8E279F88D3B9}']
    function SetTitle(Value: string): IUsuarioOperacaoPedirSenhaController;
    function SetTextConfirm(Value: string): IUsuarioOperacaoPedirSenhaController;
    function SetTextCancel(Value: string): IUsuarioOperacaoPedirSenhaController;
    function Lista(Value: TList<TRecordSenha>): IUsuarioOperacaoPedirSenhaController;
    function Result(Value: TRecordSenha): IUsuarioOperacaoPedirSenhaController;
    function &End: IUsuarioOperacoesController;
  end;

implementation

end.
