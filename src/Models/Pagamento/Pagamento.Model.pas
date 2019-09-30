unit Pagamento.Model;

interface

uses
  Pagamento.Model.Interf,
  Entidade_VendaPagamentos.Model,
  ormbr.container.objectset.interfaces,
  Conexao.Model.Interf;

type
  TPagamentoModel = class(TInterfacedObject, IPagamentoModel, IPagamentoTipoModel)
  private
    FConn: IConexaoModel;
    FIterator: IPagamentoIteratorModel;
    FEntidade: TVENDAPAGAMENTOS;
    FDAO: IContainerObjectSet<TVENDAPAGAMENTOS>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IPagamentoModel;

    // IPagamentoModel
    function Tipo: IPagamentoTipoModel;
    function Iterator: IPagamentoIteratorModel;
    function Entidade: TVENDAPAGAMENTOS; overload;
    function Entidade(Value: TVENDAPAGAMENTOS): IPagamentoModel; overload;
    function DAO: IContainerObjectSet<TVENDAPAGAMENTOS>;

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
  Result := TPagamentoTipoFactoryModel.New.CartaoCredito(Self);
end;

constructor TPagamentoModel.Create;
begin
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
  Result := TPagamentoTipoFactoryModel.New.Dinheiro(Self);
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

class function TPagamentoModel.New: IPagamentoModel;
begin
  Result := Self.Create;
end;

function TPagamentoModel.Tipo: IPagamentoTipoModel;
begin
  Result := Self;
end;

end.
