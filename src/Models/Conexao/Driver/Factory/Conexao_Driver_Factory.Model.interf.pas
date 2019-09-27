unit Conexao_Driver_Factory.Model.interf;

interface

uses
  Conexao.Model.Interf;

type

  IConexaoDriverFactoryModel = interface
    ['{877F7BCD-4D54-4E58-9205-6C55A319435C}']
    function Firedac(Parent: IConexaoModel): IConexaoDriverModel;
  end;

implementation

end.
