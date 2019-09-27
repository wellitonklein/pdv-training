unit Conexao_Factory.Model.Interf;

interface

uses
  Conexao.Model.Interf;

type

  IConexaoFactoryModel = interface
    ['{F15C6863-B385-4099-A431-E6524011E355}']
    function Conexao: IConexaoModel;
  end;

implementation

end.
