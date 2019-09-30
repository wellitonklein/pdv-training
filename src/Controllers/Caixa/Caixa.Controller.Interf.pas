unit Caixa.Controller.Interf;

interface

uses
  Caixa.Model.interf;

type
  ICaixaController = interface;
  ICaixaMetodoController = interface;

  ICaixaController = interface
    ['{C9067D98-929E-4B9D-8ACB-C8B4168D9B0C}']
    function Metodo: ICaixaMetodoController;
  end;

  ICaixaMetodoController = interface
    ['{6D2EB9B7-FF0A-4850-A5BE-157A83A14C1B}']
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

end.
