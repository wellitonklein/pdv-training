unit Entidade_VendaPagamentos.Model;

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
  [Table('VENDAPAGAMENTOS', '')]
  [PrimaryKey('GUUID', NotInc, NoSort, False, 'Chave primária')]
  TVENDAPAGAMENTOS = class
  private
    { Private declarations }
    FGUUID: String;
    FVENDA: Nullable<String>;
    FTIPO: SmallInt;
    FVALOR: Double;
    FPARCELAS: SmallInt;
    FBANDEIRA: SmallInt;
    FSTATUS: SmallInt;
    FDATACADASTRO: TDateTime;
    FDATAALTERACAO: TDateTime;
    function GetDATAALTERACAO: TDateTime;
    function GetDATACADASTRO: TDateTime;
    function GetGUUID: String;
  public
    { Public declarations }
    [Restrictions([NotNull])]
    [Column('GUUID', ftString, 64)]
    [Dictionary('GUUID', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property GUUID: String read GetGUUID write FGUUID;

    [Column('VENDA', ftString, 64)]
    [Dictionary('VENDA', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property VENDA: Nullable<String> read FVENDA write FVENDA;

    [Column('TIPO', ftSmallint)]
    [Dictionary('TIPO', 'Mensagem de validação', '', '', '', taCenter)]
    property TIPO: SmallInt read FTIPO write FTIPO;

    [Column('VALOR', ftBCD, 18, 4)]
    [Dictionary('VALOR', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property VALOR: Double read FVALOR write FVALOR;

    [Column('PARCELAS', ftSmallint)]
    [Dictionary('PARCELAS', 'Mensagem de validação', '', '', '', taCenter)]
    property PARCELAS: SmallInt read FPARCELAS write FPARCELAS;

    [Column('BANDEIRA', ftSmallint)]
    [Dictionary('BANDEIRA', 'Mensagem de validação', '', '', '', taCenter)]
    property BANDEIRA: SmallInt read FBANDEIRA write FBANDEIRA;

    [Column('STATUS', ftSmallint)]
    [Dictionary('STATUS', 'Mensagem de validação', '', '', '', taCenter)]
    property STATUS: SmallInt read FSTATUS write FSTATUS;

    [Column('DATACADASTRO', ftDateTime)]
    [Dictionary('DATACADASTRO', 'Mensagem de validação', '', '', '', taCenter)]
    property DATACADASTRO: TDateTime read GetDATACADASTRO write FDATACADASTRO;

    [Column('DATAALTERACAO', ftDateTime)]
    [Dictionary('DATAALTERACAO', 'Mensagem de validação', '', '', '', taCenter)]
    property DATAALTERACAO: TDateTime read GetDATAALTERACAO write FDATAALTERACAO;
  end;

implementation

{ TVENDAPAGAMENTOS }

function TVENDAPAGAMENTOS.GetDATAALTERACAO: TDateTime;
begin
  FDATAALTERACAO := Now;
  Result := FDATAALTERACAO;
end;

function TVENDAPAGAMENTOS.GetDATACADASTRO: TDateTime;
begin
  if (FDATACADASTRO = StrToDateTime('30/12/1899')) then
    FDATACADASTRO := Now;
  Result := FDATACADASTRO;
end;

function TVENDAPAGAMENTOS.GetGUUID: String;
begin
  if FGUUID.IsEmpty then
    FGUUID := TGUID.NewGuid.ToString;
  Result := FGUUID;
end;

initialization
  TRegisterClass.RegisterEntity(TVENDAPAGAMENTOS)

end.
