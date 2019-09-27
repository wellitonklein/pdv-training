unit Conexao.Model.Interf;

interface

uses
  ormbr.factory.interfaces,
  Data.DB;

type
  IConexaoModel = interface;
  IConexaoDriverModel = interface;
  IConexaoDriverConfiguracaoModel = interface;

  IConexaoModel = interface
    ['{930CBB98-06C9-4E69-849F-28712B9AC314}']
    function Connection: IDBConnection;
    function Driver: IConexaoDriverModel;
  end;

  IConexaoDriverModel = interface
    ['{50753612-5A6F-4DF2-BC0F-7A81F3013596}']
    function Component: TCustomConnection;
    function Configuracao: IConexaoDriverConfiguracaoModel;
    function &End: IConexaoModel;
  end;

  IConexaoDriverConfiguracaoModel = interface
    ['{E067891B-D026-46E4-86F4-3EB9D2FE527C}']
    function DriverID(const Value: String = 'FB'): IConexaoDriverConfiguracaoModel;
    function Database(const Value: String): IConexaoDriverConfiguracaoModel;
    function UserName(const Value: String): IConexaoDriverConfiguracaoModel;
    function Password(const Value: String): IConexaoDriverConfiguracaoModel;
    function Port(const Value: Integer = 3050): IConexaoDriverConfiguracaoModel;
    function &EndMetodo: IConexaoDriverModel;
  end;

implementation

end.
