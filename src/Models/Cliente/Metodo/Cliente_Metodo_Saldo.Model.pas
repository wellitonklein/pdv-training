unit Cliente_Metodo_Saldo.Model;

interface

uses
  Cliente.Model.Interf;

type
  TClienteMetodoSaldoModel = class(TInterfacedObject, IClienteMetodoSaldoModel)
  private
    FParent: IClienteModel;
    FSaldo: Currency;
  public
    constructor Create(Parent: IClienteModel);
    destructor Destroy; override;
    class function New(Parent: IClienteModel): IClienteMetodoSaldoModel;
    function GetSaldo(var Value: Currency): IClienteMetodoSaldoModel;
    function SetSaldo(Value: Currency): IClienteMetodoSaldoModel;
    function &End: IClienteMetodoModel;
  end;

implementation

{ TClienteMetodoSaldoModel }

function TClienteMetodoSaldoModel.&End: IClienteMetodoModel;
begin
  Result := FParent.Metodo;
end;

constructor TClienteMetodoSaldoModel.Create(Parent: IClienteModel);
begin
  FParent := Parent;
end;

destructor TClienteMetodoSaldoModel.Destroy;
begin

  inherited;
end;

function TClienteMetodoSaldoModel.GetSaldo(
  var Value: Currency): IClienteMetodoSaldoModel;
begin
  Result := Self;
  Value := FSaldo;
end;

class function TClienteMetodoSaldoModel.New(Parent: IClienteModel): IClienteMetodoSaldoModel;
begin
  Result := Self.Create(Parent);
end;

function TClienteMetodoSaldoModel.SetSaldo(
  Value: Currency): IClienteMetodoSaldoModel;
begin
  Result := Self;
  FSaldo := Value;
end;

end.
