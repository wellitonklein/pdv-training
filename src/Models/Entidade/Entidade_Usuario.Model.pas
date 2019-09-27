unit Entidade_Usuario.Model;

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
  [Table('USUARIO', '')]
  [PrimaryKey('GUUID', NotInc, NoSort, False, 'Chave primária')]
  TUSUARIO = class
  private
    { Private declarations }
    FGUUID: String;
    FNOME: nullable<String>;
    FSENHA: nullable<String>;
    FTIPO: nullable<SmallInt>;
    FSTATUS: nullable<SmallInt>;
    FDATACADASTRO: TDateTime;
    FDATAALTERACAO: TDateTime;
    function GetGUUID: String;
    function GetDATACADASTRO: TDateTime;
    function GetDATAALTERACAO: TDateTime;
  public
    { Public declarations }
    [Restrictions([NotNull])]
    [Column('GUUID', ftString, 64)]
    [Dictionary('GUUID', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property GUUID: String read GetGUUID write FGUUID;

    [Column('NOME', ftString, 60)]
    [Dictionary('Nome', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property NOME: nullable<String> read FNOME write FNOME;

    [Column('SENHA', ftString, 20)]
    [Dictionary('Senha', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property SENHA: nullable<String> read FSENHA write FSENHA;

    [Column('TIPO', ftSmallint)]
    [Dictionary('Tipo', 'Mensagem de validação', '', '', '', taCenter)]
    property TIPO: nullable<SmallInt> read FTIPO write FTIPO;

    [Column('STATUS', ftSmallint)]
    [Dictionary('Situação', 'Mensagem de validação', '', '', '', taCenter)]
    property STATUS: nullable<SmallInt> read FSTATUS write FSTATUS;

    [Column('DATACADASTRO', ftDateTime)]
    [Dictionary('Data de cadastro', 'Mensagem de validação', '', '', '', taCenter)]
    property DATACADASTRO: TDateTime read GetDATACADASTRO write FDATACADASTRO;

    [Column('DATAALTERACAO', ftDateTime)]
    [Dictionary('Data de atualização', 'Mensagem de validação', '', '', '', taCenter)]
    property DATAALTERACAO: TDateTime read GetDATAALTERACAO write FDATAALTERACAO;
  end;

implementation

{ TUSUARIO }

function TUSUARIO.GetDATAALTERACAO: TDateTime;
begin
  FDATAALTERACAO := Now;
  Result := FDATAALTERACAO;
end;

function TUSUARIO.GetDATACADASTRO: TDateTime;
begin
  if (FDATACADASTRO = StrToDateTime('30/12/1899')) then
    FDATACADASTRO := Now;
  Result := FDATACADASTRO;
end;

function TUSUARIO.GetGUUID: String;
begin
  if FGUUID.IsEmpty then
    FGUUID := TGUID.NewGuid.ToString;
  Result := FGUUID;
end;

initialization

TRegisterClass.RegisterEntity(TUSUARIO)

end.
