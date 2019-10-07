unit Pagamento.Model;

interface

uses
  Pagamento.Model.Interf,
  Entidade_VendaPagamentos.Model,
  ormbr.container.objectset.interfaces,
  Conexao.Model.Interf, Venda.Model.Inerf;

type
  TPagamentoModel = class(TInterfacedObject, IPagamentoModel, IPagamentoTipoModel)
  private
    FConn: IConexaoModel;
    FIterator: IPagamentoIteratorModel;
    FEntidade: TVENDAPAGAMENTOS;
    FDAO: IContainerObjectSet<TVENDAPAGAMENTOS>;
    FVenda: IVendaModel;
  public
    constructor Create(Venda: IVendaModel);
    destructor Destroy; override;
    class function New(Venda: IVendaModel): IPagamentoModel;

    // IPagamentoModel
    function Tipo: IPagamentoTipoModel;
    function Iterator: IPagamentoIteratorModel;
    function Entidade: TVENDAPAGAMENTOS; overload;
    function Entidade(Value: TVENDAPAGAMENTOS): IPagamentoModel; overload;
    function DAO: IContainerObjectSet<TVENDAPAGAMENTOS>;
    function ValorTotal: Currency;

    // IPagamentoTipoModel
    function Dinheiro: IPagamentoTipoMetodoModel;
    function CartaoCredito: IPagamentoTipoMetodoModel;
  end;

implementation

uses
  Pagamento_Tipo_Factory.Model,
  Pagamento_Factory.Model,
  PDVUpdates.Model,
  ormbr.container.objectset, System.SysUtils;

{ TPagamentoModel }

function TPagamentoModel.CartaoCredito: IPagamentoTipoMetodoModel;
begin
  Result := TPagamentoTipoFactoryModel.New.CartaoCredito(Self, FVenda);
end;

constructor TPagamentoModel.Create(Venda: IVendaModel);
begin
  FVenda    := Venda;
  FConn     := TPDVUpdatesModel.New.Conexao;
  FEntidade := TPDVUpdatesModel.New.Entidade.VendaPagamentos;
  FDAO      := TContainerObjectSet<TVENDAPAGAMENTOS>.Create(FConn.Connection, 15);
  FIterator := TPagamentoFactoryModel.New.Iterator(Self);
end;

function TPagamentoModel.DAO: IContainerObjectSet<TVENDAPAGAMENTOS>;
begin
  Result := FDAO;
end;

destructor TPagamentoModel.Destroy;
begin
  FreeAndNil(FEntidade);
  inherited;
end;

function TPagamentoModel.Dinheiro: IPagamentoTipoMetodoModel;
begin
  Result := TPagamentoTipoFactoryModel.New.Dinheiro(Self, FVenda);
end;

function TPagamentoModel.Entidade: TVENDAPAGAMENTOS;
begin
  Result := FEntidade;
end;

function TPagamentoModel.Entidade(Value: TVENDAPAGAMENTOS): IPagamentoModel;
begin
  Result := Self;
  FEntidade := Value;
end;

function TPagamentoModel.Iterator: IPagamentoIteratorModel;
begin
  Result := FIterator;
end;

class function TPagamentoModel.New(Venda: IVendaModel): IPagamentoModel;
begin
  Result := Self.Create(Venda);
end;

function TPagamentoModel.Tipo: IPagamentoTipoModel;
begin
  Result := Self;
end;

function TPagamentoModel.ValorTotal: Currency;
begin
  Result := 0;
  while FIterator.hasNext do
    Result := (Result + FIterator.Next.Entidade.VALOR);
end;

end.
