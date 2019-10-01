unit Fiscal_Proxy_Identificacao.Model;

interface

uses
  Fiscal.Model.Interf;

type
  TFiscalProxyIdentificacaoModel = class(TInterfacedObject, IFiscalProxyIdentificacaoModel)
  private
    FParent: IFiscalProxyModel;
    FSerie: SmallInt;
    FNumero: SmallInt;
    FData: TDateTime;
  public
    constructor Create(Parent: IFiscalProxyModel);
    destructor Destroy; override;
    class function New(Parent: IFiscalProxyModel): IFiscalProxyIdentificacaoModel;
    function Numero(Value: SmallInt): IFiscalProxyIdentificacaoModel; overload;
    function Data(Value: TDateTime): IFiscalProxyIdentificacaoModel; overload;
    function Serie(Value: SmallInt): IFiscalProxyIdentificacaoModel; overload;
    function Serie: SmallInt; overload;
    function Numero: SmallInt; overload;
    function Data: TDateTime; overload;
    function &End: IFiscalProxyModel;
  end;

implementation

{ TFiscalProxyIdentificacaoModel }

function TFiscalProxyIdentificacaoModel.&End: IFiscalProxyModel;
begin
  Result := FParent;
end;

constructor TFiscalProxyIdentificacaoModel.Create(Parent: IFiscalProxyModel);
begin
  FParent := Parent;
end;

function TFiscalProxyIdentificacaoModel.Data(
  Value: TDateTime): IFiscalProxyIdentificacaoModel;
begin
  Result := Self;
  FData := Value;
end;

function TFiscalProxyIdentificacaoModel.Data: TDateTime;
begin
  Result := FData;
end;

destructor TFiscalProxyIdentificacaoModel.Destroy;
begin

  inherited;
end;

class function TFiscalProxyIdentificacaoModel.New(Parent: IFiscalProxyModel): IFiscalProxyIdentificacaoModel;
begin
  Result := Self.Create(Parent);
end;

function TFiscalProxyIdentificacaoModel.Numero: SmallInt;
begin
  Result := FNumero;
end;

function TFiscalProxyIdentificacaoModel.Serie(
  Value: SmallInt): IFiscalProxyIdentificacaoModel;
begin
  Result := Self;
  FSerie := Value;
end;

function TFiscalProxyIdentificacaoModel.Serie: SmallInt;
begin
  Result := FSerie;
end;

function TFiscalProxyIdentificacaoModel.Numero(
  Value: SmallInt): IFiscalProxyIdentificacaoModel;
begin
  Result := Self;
  FNumero := Value;
end;

end.
