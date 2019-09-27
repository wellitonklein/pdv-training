unit Pagamento_Tipo_CartaoCredito_Metodo_Factory.Model;

interface

uses
  Pagamento_Tipo_CartaoCredito_Metodo_Factory.Model.Interf,
  Pagamento.Model.Interf;

type
  TPagamentoTipoCartaoCreditoMetodoFactoryModel = class(TInterfacedObject, IPagamentoTipoCartaoCreditoMetodoModel)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IPagamentoTipoCartaoCreditoMetodoModel;
    function Executar(Parent: IPagamentoTipoMetodoModel): IPagamentoMetodoExecutarModel;
    function Estornar(Parent: IPagamentoTipoMetodoModel): IPagamentoMetodoEstornarModel;
  end;

implementation

uses
  Pagamento_Tipo_CartaoCredito_Metodo_Estornar.Model,
  Pagamento_Tipo_CartaoCredito_Metodo_Executar.Model;

{ TPagamentoTipoCartaoCreditoMetodoFactoryModel }

constructor TPagamentoTipoCartaoCreditoMetodoFactoryModel.Create;
begin

end;

destructor TPagamentoTipoCartaoCreditoMetodoFactoryModel.Destroy;
begin

  inherited;
end;

function TPagamentoTipoCartaoCreditoMetodoFactoryModel.Estornar(
  Parent: IPagamentoTipoMetodoModel): IPagamentoMetodoEstornarModel;
begin
  Result := TPagamentoTipoCartaoCreditoMetodoEstornarModel.New(Parent);
end;

function TPagamentoTipoCartaoCreditoMetodoFactoryModel.Executar(
  Parent: IPagamentoTipoMetodoModel): IPagamentoMetodoExecutarModel;
begin
  Result := TPagamentoTipoCartaoCreditoMetodoExecutarModel.New(Parent);
end;

class function TPagamentoTipoCartaoCreditoMetodoFactoryModel.New: IPagamentoTipoCartaoCreditoMetodoModel;
begin
  Result := Self.Create;
end;

end.
