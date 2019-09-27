unit Cliente.Model.Interf;

interface

type
  IClienteModel = interface;
  IClienteMetodoModel = interface;
  IClienteMetodoSaldoModel = interface;
  IClienteMetodoBuscarModel = interface;

  IClienteModel = interface
    ['{E0DA49D3-2B59-4929-84A8-62F8F2B9E9CC}']
    function Metodo: IClienteMetodoModel;
    function SetState(Value: IClienteMetodoModel): IClienteModel;
  end;

  IClienteMetodoModel = interface
    ['{8E72E331-7DFE-45B4-8896-1CD9F647C4BB}']
    function Saldo: IClienteMetodoSaldoModel;
    function Buscar: IClienteMetodoBuscarModel;
    function &End: IClienteModel;
  end;

  IClienteMetodoSaldoModel = interface
    ['{3AB4DDB8-52F1-4F35-8A39-54485F09D80C}']
    function GetSaldo(var Value: Currency): IClienteMetodoSaldoModel;
    function SetSaldo(Value: Currency): IClienteMetodoSaldoModel;
    function &End: IClienteMetodoModel;
  end;

  IClienteMetodoBuscarModel = interface
    ['{6DF278CB-0BF2-4E90-A830-8F6196A5088B}']
    function PorCPF(Value: String): IClienteMetodoBuscarModel;
    function &End: IClienteMetodoModel;
  end;

implementation

end.
