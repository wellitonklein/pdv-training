unit Caixa_State_Factory.Model.Interf;

interface

uses
  Caixa.Model.interf;

type

  ICaixaStateFactoryModel = interface
    ['{87C3D2EB-A85C-4829-9C13-1EC1ADC9A4A3}']
    function Aberto: ICaixaMetodoModel;
    function Fechado: ICaixaMetodoModel;
    function Bloqueado: ICaixaMetodoModel;
  end;

implementation

end.
