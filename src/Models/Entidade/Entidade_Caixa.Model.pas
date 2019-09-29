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
  ormbr.mapping.attributes;

type

  [Entity]
  [Table('CAIXA', '')]
  [PrimaryKey('GUUID', NotInc, NoSort, False, 'Chave primária')]
  TCAIXA = class
  private
    { Private declarations }
    FGUUID: String;
    FDATAABERTURA: TDateTime;
    FDATAFECHAMENTO: nullable<TDateTime>;
    FSTATUS: nullable<SmallInt>;
    FVALORABERTURA: nullable<Double>;
    FVALORFECHAMENTO: nullable<Double>;
    FUSUARIO: nullable<String>;
    FOPERADOR: nullable<String>;
    FDATAALTERACAO: TDateTime;
    function GetGUUID: String;
    function GetDATAABERTURA: TDateTime;
    function GetDATAALTERACAO: TDateTime;
  public
    { Public declarations }
    [Restrictions([NotNull])]
    [Column('GUUID', ftString, 64)]
    [Dictionary('GUUID', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property GUUID: String read GetGUUID write FGUUID;

    [Column('DATAABERTURA', ftDateTime)]
    [Dictionary('DATAABERTURA', 'Mensagem de validação', '', '', '', taCenter)]
    property DATAABERTURA: TDateTime read GetDATAABERTURA write FDATAABERTURA;

    [Column('DATAFECHAMENTO', ftDateTime)]
    [Dictionary('DATAFECHAMENTO', 'Mensagem de validação', '', '', '',
      taCenter)]
    property DATAFECHAMENTO: nullable<TDateTime> read FDATAFECHAMENTO
      write FDATAFECHAMENTO;

    [Column('STATUS', ftSmallint)]
    [Dictionary('STATUS', 'Mensagem de validação', '', '', '', taCenter)]
    property STATUS: nullable<SmallInt> read FSTATUS write FSTATUS;

    [Column('VALORABERTURA', ftBCD, 18, 4)]
    [Dictionary('VALORABERTURA', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property VALORABERTURA: nullable<Double> read FVALORABERTURA
      write FVALORABERTURA;

    [Column('VALORFECHAMENTO', ftBCD, 18, 4)]
    [Dictionary('VALORFECHAMENTO', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property VALORFECHAMENTO: nullable<Double> read FVALORFECHAMENTO
      write FVALORFECHAMENTO;

    [Column('USUARIO', ftString, 64)]
    [Dictionary('USUARIO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property USUARIO: nullable<String> read FUSUARIO write FUSUARIO;

    [Column('OPERADOR', ftString, 64)]
    [Dictionary('OPERADOR', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property OPERADOR: nullable<String> read FOPERADOR write FOPERADOR;

    [Column('DATAALTERACAO', ftDateTime)]
    [Dictionary('DATAALTERACAO', 'Mensagem de validação', '', '', '', taCenter)]
    property DATAALTERACAO: TDateTime read GetDATAALTERACAO write FDATAALTERACAO;
  end;

implementation

{ TCAIXA }

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
