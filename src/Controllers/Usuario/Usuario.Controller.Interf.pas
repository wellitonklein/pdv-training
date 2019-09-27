unit Usuario.Controller.Interf;

interface

uses
  Usuario.Model.Interf;

type

  IUsuarioController = interface
    ['{F3DB8B3F-4D7B-473D-A37F-41D3C44A20AA}']
    function Model: IUsuarioModel;
    function Caixa: IUsuarioMetodoModel;
    function Fiscal: IUsuarioMetodoModel;
    function Gerente: IUsuarioMetodoModel;
  end;

implementation

end.
