unit Caixa_Metodo_Factory.Model.Interf;

interface

uses
  Caixa.Model.interf;

type

  ICaixaMetodoFactoryModel = interface
    ['{A80D6A77-BCD9-4835-9F04-A922FB1A61C1}']
    function Abrir(Parent: ICaixaModel): ICaixaMetodoAbrirModel;
    function Fechar(Parent: ICaixaModel): ICaixaMetodoFecharModel;
    function Suprimento(Parent: ICaixaModel): ICaixaMetodoSuprimentoModel;
    function Sangria(Parent: ICaixaModel): ICaixaMetodoSangriaModel;
    function Bloquear(Parent: ICaixaModel): ICaixaMetodoBloquearModel;
    function Desbloquear(Parent: ICaixaModel): ICaixaMetodoDesbloquearModel;
    function TrocarOperador(Parent: ICaixaModel): ICaixaMetodoTrocarOperadorModel;
  end;

implementation

end.
