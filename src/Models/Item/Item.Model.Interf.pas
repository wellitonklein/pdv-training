unit Item.Model.Interf;

interface

uses Entidade_VendaItens.Model, ormbr.container.objectset.interfaces;

type
  IItemModel = interface;
  IItemIteratorModel = interface;
  IItemMetodoModel = interface;
  IItemMetodoVenderModel = interface;
  IItemMetodoCancelarModel = interface;
  IItemMetodoDescontoModel = interface;
  IItemMetodoAcrescimoModel = interface;
  IItemMetodoRepetirModel = interface;

  IItemModel = interface
    ['{896469D5-9B9F-4BD5-A169-263C4E8CA911}']
    function Metodo: IItemMetodoModel;
    function SetState(Value: IItemMetodoModel): IItemModel;
    function Iterator: IItemIteratorModel;
    function Entidade: TVENDAITENS; overload;
    function Entidade(Value: TVENDAITENS): IItemModel; overload;
    function DAO: IContainerObjectSet<TVENDAITENS>;
  end;

  IItemIteratorModel = interface
    ['{74CA8AD4-E813-4EDC-8002-EC06A81F3000}']
    function hasNext: Boolean;
    function Next: IItemModel;
    function Add(Value: IItemModel): IItemIteratorModel;
    function &End: IItemModel;
  end;

  IItemMetodoModel = interface
    ['{ACF7C4D2-0C56-484C-ACD4-9DB588EE3994}']
    function Vender: IItemMetodoVenderModel;
    function Cancelar: IItemMetodoCancelarModel;
    function Desconto: IItemMetodoDescontoModel;
    function Acrescimo: IItemMetodoAcrescimoModel;
    function Repetir: IItemMetodoRepetirModel;
    function &End: IItemModel;
  end;

  IItemMetodoVenderModel = interface
    ['{AD69C371-9992-437D-B435-6B5EF60EDC7C}']
    function SetItem(Value: SmallInt): IItemMetodoVenderModel;
    function &End: IItemMetodoModel;
  end;

  IItemMetodoCancelarModel = interface
    ['{CBE8CD7E-F379-425A-A3F6-BFE76F07340F}']
    function SetItem(Value: SmallInt): IItemMetodoCancelarModel;
    function &End: IItemMetodoModel;
  end;

  IItemMetodoDescontoModel = interface
    ['{1EF4417C-5F15-4CBA-B19D-E1A8A62FE1FC}']
    function SetItem(Value: SmallInt): IItemMetodoDescontoModel;
    function SetValor(Value: Currency): IItemMetodoDescontoModel;
    function SetPercentual(Value: Currency): IItemMetodoDescontoModel;
    function &End: IItemMetodoModel;
  end;

  IItemMetodoAcrescimoModel = interface
    ['{65614664-980B-43F8-830B-AD78FCF02AF3}']
    function SetItem(Value: SmallInt): IItemMetodoAcrescimoModel;
    function SetValor(Value: Currency): IItemMetodoAcrescimoModel;
    function SetPercentual(Value: Currency): IItemMetodoAcrescimoModel;
    function &End: IItemMetodoModel;
  end;

  IItemMetodoRepetirModel = interface
    ['{3B27E98A-8EB6-4AA7-A0E0-4EA2E7C1F4FF}']
    function SetItem(Value: SmallInt): IItemMetodoRepetirModel;
    function &End: IItemMetodoModel;
  end;

implementation

end.
