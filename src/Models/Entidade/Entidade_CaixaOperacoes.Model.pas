unit Entidade_CaixaOperacoes.Model;

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
  ormbr.mapping.classes,
  ormbr.mapping.register,
  ormbr.mapping.attributes;

type
  [Entity]
  [Table('CAIXAOPERACOES', '')]
  [PrimaryKey('GUIID', NotInc, NoSort, False, 'Chave primária')]
  TCAIXAOPERACOES = class
  private
    { Private declarations }
    FGUUID: String;
    FCAIXA: Nullable<String>;
    FTIPO: SmallInt;
    FVALOR: Nullable<Double>;
    FFISCAL: Nullable<String>;
    FSTATUS: SmallInt;
    FDATAALTERACAO: TDateTime;
    function GetDATAALTERACAO: TDateTime;
    function GetGUUID: String;
  public
    { Public declarations }
    [Restrictions([NotNull])]
    [Column('GUUID', ftString, 64)]
    [Dictionary('GUUID', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property GUUID: String read GetGUUID write FGUUID;

    [Column('CAIXA', ftString, 64)]
    [Dictionary('CAIXA', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CAIXA: Nullable<String> read FCAIXA write FCAIXA;

    [Column('TIPO', ftSmallint)]
    [Dictionary('TIPO', 'Mensagem de validação', '', '', '', taCenter)]
    property TIPO: SmallInt read FTIPO write FTIPO;

    [Column('VALOR', ftBCD, 18, 4)]
    [Dictionary('VALOR', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property VALOR: Nullable<Double> read FVALOR write FVALOR;

    [Column('FISCAL', ftString, 64)]
    [Dictionary('FISCAL', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property FISCAL: Nullable<String> read FFISCAL write FFISCAL;

    [Column('STATUS', ftSmallint)]
    [Dictionary('STATUS', 'Mensagem de validação', '', '', '', taCenter)]
    property STATUS: SmallInt read FSTATUS write FSTATUS;

    [Column('DATAALTERACAO', ftDateTime)]
    [Dictionary('DATAALTERACAO', 'Mensagem de validação', '', '', '', taCenter)]
    property DATAALTERACAO: TDateTime read GetDATAALTERACAO write FDATAALTERACAO;
  end;

implementation

{ TCAIXAOPERACOES }

function TCAIXAOPERACOES.GetDATAALTERACAO: TDateTime;
begin
  FDATAALTERACAO := Now;
  Result := FDATAALTERACAO;
end;

function TCAIXAOPERACOES.GetGUUID: String;
begin
  if FGUUID.IsEmpty then
    FGUUID := TGUID.NewGuid.ToString;
  Result := FGUUID;
end;

initialization
  TRegisterClass.RegisterEntity(TCAIXAOPERACOES)

end.
