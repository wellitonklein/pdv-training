unit Pagamento_Tipo_CartaoCredito.Model;

interface

uses
  Pagamento.Model.Interf;

type
  TPagamentoTipoCartaoCreditoModel = class(TInterfacedObject, IPagamentoTipoMetodoModel)
  private
    FParent: IPagamentoModel;
  public
    constructor Create(Parent: IPagamentoModel);
    destructor Destroy; override;
    class function New(Parent: IPagamentoModel): IPagamentoTipoMetodoModel;
    function Executar: IPagamentoMetodoExecutarModel;
    function Estornar: IPagamentoMetodoEstornarModel;
    function &End: IPagamentoModel;
  end;

implementation

uses
  Pagamento_Tipo_CartaoCredito_Metodo_Factory.Model;

{ TPagamentoTipoCartaoCreditoModel }

function TPagamentoTipoCartaoCreditoModel.&End: IPagamentoModel;
begin
  Result := FParent;
end;

constructor TPagamentoTipoCartaoCreditoModel.Create(Parent: IPagamentoModel);
begin
  FParent := Parent;
end;

destructor TPagamentoTipoCartaoCreditoModel.Destroy;
begin

  inherited;
end;

function TPagamentoTipoCartaoCreditoModel.Estornar: IPagamentoMetodoEstornarModel;
begin
  Result := TPagamentoTipoCartaoCreditoMetodoFactoryModel.New.Estornar(Self);
end;

function TPagamentoTipoCartaoCreditoModel.Executar: IPagamentoMetodoExecutarModel;
begin
  Result := TPagamentoTipoCartaoCreditoMetodoFactoryModel.New.Executar(Self);
end;

class function TPagamentoTipoCartaoCreditoModel.New(Parent: IPagamentoModel): IPagamentoTipoMetodoModel;
begin
  Result := Self.Create(Parent);
end;

end.
