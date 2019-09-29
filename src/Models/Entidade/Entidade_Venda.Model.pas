unit Entidade_Venda.Model;

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
  [Table('VENDA', '')]
  [PrimaryKey('GUUID', NotInc, NoSort, False, 'Chave primária')]
  TVENDA = class
  private
    { Private declarations }
    FGUUID: String;
    FCAIXA: Nullable<String>;
    FCLIENTE: Nullable<String>;
    FDATAABERTURA: TDateTime;
    FDATAFECHAMENTO: Nullable<TDateTime>;
    FSTATUS: SmallInt;
    function GetGUUID: String;
    function GetDATAABERTURA: TDateTime;
  public
    { Public declarations }
    [Restrictions([NotNull])]
    [Column('GUUID', ftString, 64)]
    [Dictionary('GUUID', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property GUUID: String read GetGUUID write FGUUID;

    [Column('CAIXA', ftString, 64)]
    [Dictionary('CAIXA', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CAIXA: Nullable<String> read FCAIXA write FCAIXA;

    [Column('CLIENTE', ftString, 64)]
    [Dictionary('CLIENTE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CLIENTE: Nullable<String> read FCLIENTE write FCLIENTE;

    [Column('DATAABERTURA', ftDateTime)]
    [Dictionary('DATAABERTURA', 'Mensagem de validação', '', '', '', taCenter)]
    property DATAABERTURA: TDateTime read GetDATAABERTURA write FDATAABERTURA;

    [Column('DATAFECHAMENTO', ftDateTime)]
    [Dictionary('DATAFECHAMENTO', 'Mensagem de validação', '', '', '', taCenter)]
    property DATAFECHAMENTO: Nullable<TDateTime> read FDATAFECHAMENTO write FDATAFECHAMENTO;

    [Column('STATUS', ftSmallint)]
    [Dictionary('STATUS', 'Mensagem de validação', '', '', '', taCenter)]
    property STATUS: SmallInt read FSTATUS write FSTATUS;
  end;

implementation

{ TVENDA }

function TVENDA.GetDATAABERTURA: TDateTime;
begin
  if (FDATAABERTURA = StrToDateTime('30/12/1899')) then
    FDATAABERTURA := Now;
  Result := FDATAABERTURA;
end;

function TVENDA.GetGUUID: String;
begin
  if FGUUID.IsEmpty then
    FGUUID := TGUID.NewGuid.ToString;
  Result := FGUUID;
end;

initialization
  TRegisterClass.RegisterEntity(TVENDA)

end.
