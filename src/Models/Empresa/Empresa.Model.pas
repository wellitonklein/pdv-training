unit Empresa.Model;

interface

uses
  Empresa.Model.Interf,
  Entidade_Empresa.Model,
  ormbr.container.objectset.interfaces,
  Conexao.Model.Interf;

type
  TEmpresaModel = class(TInterfacedObject, IEmpresaModel)
  private
    FConn: IConexaoModel;
    FState: IEmpresaMetodoModel;
    FEntidade: TEMPRESA;
    FDAO: IContainerObjectSet<TEMPRESA>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IEmpresaModel;
    function Metodo: IEmpresaMetodoModel;
    function SetState(Value: IEmpresaMetodoModel): IEmpresaModel;
    function Entidade: TEMPRESA; overload;
    function Entidade(Value: TEMPRESA): IEmpresaModel; overload;
    function DAO: IContainerObjectSet<TEMPRESA>;
  end;

implementation

uses
  PDVUpdates.Model,
  ormbr.container.objectset;

{ TEmpresaModel }

constructor TEmpresaModel.Create;
begin
  FConn     := TPDVUpdatesModel.New.Conexao;
//  FEntidade := TPDVUpdatesModel.New.Entidade.Empresa;
  FDAO      := TContainerObjectSet<TEMPRESA>.Create(FConn.Connection, 15);
//  FState    := TClienteStateFactoryModel.New.Ativo(Self);
end;

function TEmpresaModel.DAO: IContainerObjectSet<TEMPRESA>;
begin
  Result := FDAO;
end;

destructor TEmpresaModel.Destroy;
begin

  inherited;
end;

function TEmpresaModel.Entidade: TEMPRESA;
begin
  if not Assigned(FEntidade) then
  begin
    try
      FEntidade := FDAO.Find.Items[0];
    except
    end;
  end;
  Result := FEntidade;
end;

function TEmpresaModel.Entidade(Value: TEMPRESA): IEmpresaModel;
begin
  Result := Self;
  FEntidade := Value;
end;

function TEmpresaModel.Metodo: IEmpresaMetodoModel;
begin
  //
end;

class function TEmpresaModel.New: IEmpresaModel;
begin
  Result := Self.Create;
end;

function TEmpresaModel.SetState(Value: IEmpresaMetodoModel): IEmpresaModel;
begin
  Result := Self;
  FState := Value;
end;

end.
