unit Venda_Metodo_Abrir.Model;

interface

uses
  Venda.Model.Inerf;

type
  TVendaMetodoAbrirModel = class(TInterfacedObject, IVendaMetodoAbrirModel)
  private
    FParent: IVendaModel;
    procedure Gravar;
    procedure Fiscal;
  public
    constructor Create(Parent: IVendaModel);
    destructor Destroy; override;
    class function New(Parent: IVendaModel): IVendaMetodoAbrirModel;
    function &End: IVendaMetodoModel;
  end;

implementation

uses
  Venda_State_Factory.Model,
  PDVUpdates.Model,
  PDVUpdates_Type.Controller,
  System.SysUtils, System.Generics.Collections, Entidade_Venda.Model;

{ TVendaMetodoAbrirModel }

function TVendaMetodoAbrirModel.&End: IVendaMetodoModel;
begin
  Result := FParent.Metodo;

  Gravar;
  Fiscal;

  FParent.SetState(TVendaStateFactoryModel.New.Aberto);
end;

procedure TVendaMetodoAbrirModel.Fiscal;
var
  Lista: TObjectList<TVenda>;
begin
  Lista := FParent.DAO.FindWhere('GUUID = ' + QuotedStr(FParent.Entidade.GUUID));
  FParent.ModalidadeFiscal.Proxy.Identificacao.Numero(Lista[0].NUMERO);
  FParent.ModalidadeFiscal.Proxy.Identificacao.Serie(Lista[0].SERIE);
  FParent.ModalidadeFiscal.Proxy.Identificacao.Data(Now);
end;

procedure TVendaMetodoAbrirModel.Gravar;
begin
  FParent.Entidade(TPDVUpdatesModel.New.Entidade.Venda);
  FParent.Entidade.NUMERO := Random(9999);
  FParent.Entidade.SERIE := 1;
  FParent.Entidade.CAIXA := FParent.Caixa.Entidade.GUUID;
  FParent.Entidade.STATUS := Integer(tvsAberto);
  FParent.DAO.Insert(FParent.Entidade);
end;

constructor TVendaMetodoAbrirModel.Create(Parent: IVendaModel);
begin
  FParent := Parent;
end;

destructor TVendaMetodoAbrirModel.Destroy;
begin

  inherited;
end;

class function TVendaMetodoAbrirModel.New(Parent: IVendaModel): IVendaMetodoAbrirModel;
begin
  Result := Self.Create(Parent);
end;

end.
