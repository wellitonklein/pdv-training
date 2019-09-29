unit Entidade_Caixa.Model;

interface

uses
  DB,
  Classes,
  SysUtils,
  Generics.Collections,

  /// orm
  ormbr.types.blob,
  ormbr.types.lazy,
  ormbr.types.mapping,
  ormbr.types.nullable,
  ormbr.mapping.Classes,
  ormbr.mapping.register,
  ormbr.mapping.attributes, Entidade_CaixaOperacoes.Model;

type
  [Entity]
  [Table('CAIXA', '')]
  [PrimaryKey('GUUID', NotInc, NoSort, False, 'Chave primária')]
  TCAIXA = class
  private
    { Private declarations }
    FGUUID: String;
    FDATAABERTURA: TDateTime;
    FDATAFECHAMENTO: Nullable<TDateTime>;
    FSTATUS: SmallInt;
    FVALORABERTURA: Nullable<Double>;
    FVALORFECHAMENTO: Nullable<Double>;
    FFISCAL_ABERTURA: Nullable<String>;
    FFISCAL_FECHAMENTO: Nullable<String>;
    FOPERADOR: Nullable<String>;
    FDATAALTERACAO: TDateTime;
    FOPERACOES: TObjectList<TCAIXAOPERACOES>;
    function GetDATAABERTURA: TDateTime;
    function GetDATAALTERACAO: TDateTime;
    function GetGUUID: String;
  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;

    [Restrictions([NotNull])]
    [Column('GUUID', ftString, 64)]
    [Dictionary('GUUID', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property GUUID: String read GetGUUID write FGUUID;

    [Column('DATAABERTURA', ftDateTime)]
    [Dictionary('DATAABERTURA', 'Mensagem de validação', '', '', '', taCenter)]
    property DATAABERTURA: TDateTime read GetDATAABERTURA write FDATAABERTURA;

    [Column('DATAFECHAMENTO', ftDateTime)]
    [Dictionary('DATAFECHAMENTO', 'Mensagem de validação', '', '', '', taCenter)]
    property DATAFECHAMENTO: Nullable<TDateTime> read FDATAFECHAMENTO write FDATAFECHAMENTO;

    [Column('STATUS', ftSmallint)]
    [Dictionary('STATUS', 'Mensagem de validação', '', '', '', taCenter)]
    property STATUS: SmallInt read FSTATUS write FSTATUS;

    [Column('VALORABERTURA', ftBCD, 18, 4)]
    [Dictionary('VALORABERTURA', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property VALORABERTURA: Nullable<Double> read FVALORABERTURA write FVALORABERTURA;

    [Column('VALORFECHAMENTO', ftBCD, 18, 4)]
    [Dictionary('VALORFECHAMENTO', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property VALORFECHAMENTO: Nullable<Double> read FVALORFECHAMENTO write FVALORFECHAMENTO;

    [Column('FISCAL_ABERTURA', ftString, 64)]
    [Dictionary('FISCAL_ABERTURA', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property FISCAL_ABERTURA: Nullable<String> read FFISCAL_ABERTURA write FFISCAL_ABERTURA;

    [Column('FISCAL_FECHAMENTO', ftString, 64)]
    [Dictionary('FISCAL_FECHAMENTO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property FISCAL_FECHAMENTO: Nullable<String> read FFISCAL_FECHAMENTO write FFISCAL_FECHAMENTO;

    [Column('OPERADOR', ftString, 64)]
    [Dictionary('OPERADOR', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property OPERADOR: Nullable<String> read FOPERADOR write FOPERADOR;

    [Column('DATAALTERACAO', ftDateTime)]
    [Dictionary('DATAALTERACAO', 'Mensagem de validação', '', '', '', taCenter)]
    property DATAALTERACAO: TDateTime read GetDATAALTERACAO write FDATAALTERACAO;

    [Association(OneToMany, 'GUUID', 'CAIXAOPERACOES', 'CAIXA')]
    [CascadeActions([CascadeInsert, CascadeUpdate, CascadeDelete])]
    property OPERACOES: TObjectList<TCAIXAOPERACOES> read FOPERACOES write FOPERACOES;
  end;

implementation

{ TCAIXA }

constructor TCAIXA.Create;
begin
  FOPERACOES := TObjectList<TCAIXAOPERACOES>.Create;
end;

destructor TCAIXA.Destroy;
begin
  FreeAndNil(FOPERACOES);
  inherited;
end;

function TCAIXA.GetDATAABERTURA: TDateTime;
begin
  if (FDATAABERTURA = StrToDateTime('30/12/1899')) then
    FDATAABERTURA := Now;
  Result := FDATAABERTURA;
end;

function TCAIXA.GetDATAALTERACAO: TDateTime;
begin
  FDATAALTERACAO := Now;
  Result := FDATAALTERACAO;
end;

function TCAIXA.GetGUUID: String;
begin
  if FGUUID.IsEmpty then
    FGUUID := TGUID.NewGuid.ToString;
  Result := FGUUID;
end;

initialization

TRegisterClass.RegisterEntity(TCAIXA)

end.
