unit Pagamento_Tipo_Dinheiro_Metodo_Factory.Model;

interface

uses
  Pagamento_Tipo_Dinheiro_Metodo_Factory.Model.Interf, Pagamento.Model.Interf;

type
  TPagamentoTipoDinheiroMetodoFactoryModel = class(TInterfacedObject, IPagamentoTipoDinheirometodoModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IPagamentoTipoDinheirometodoModel;
    function Executar(Parent: IPagamentoTipoMetodoModel): IPagamentoMetodoExecutarModel;
    function Estornar(Parent: IPagamentoTipoMetodoModel): IPagamentoMetodoEstornarModel;
  end;

implementation

uses
  Pagamento_Tipo_Dinheiro_Metodo_Executar.Model,
  Pagamento_Tipo_Dinheiro_Metodo_Estornar.Model;

{ TPagamentoTipoDinheiroMetodoFactoryModel }

constructor TPagamentoTipoDinheiroMetodoFactoryModel.Create;
begin

end;

destructor TPagamentoTipoDinheiroMetodoFactoryModel.Destroy;
begin

  inherited;
end;

function TPagamentoTipoDinheiroMetodoFactoryModel.Estornar(
  Parent: IPagamentoTipoMetodoModel): IPagamentoMetodoEstornarModel;
begin
  Result := TPagamentoTipoDinheiroMetodoEstornarModel.New(Parent);
end;

function TPagamentoTipoDinheiroMetodoFactoryModel.Executar(
  Parent: IPagamentoTipoMetodoModel): IPagamentoMetodoExecutarModel;
begin
  Result := TPagamentoTipoDinheiroMetodoExecutarModel.New(Parent);
end;

class function TPagamentoTipoDinheiroMetodoFactoryModel.New: IPagamentoTipoDinheirometodoModel;
begin
  Result := Self.Create;
end;

end.
