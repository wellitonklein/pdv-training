unit Entidade_Cliente.Model;

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
  [Table('CLIENTE', '')]
  [PrimaryKey('GUUID', NotInc, NoSort, False, 'Chave primária')]
  TCLIENTE = class
  private
    { Private declarations }
    FGUUID: String;
    FNOME: Nullable<String>;
    FCPF: Nullable<String>;
    FLIMITE: Nullable<Double>;
    FSTATUS: SmallInt;
    FDATACADASTRO: TDateTime;
    FDATAALTERACAO: Nullable<TDateTime>;
    function GetGUUID: String;
    function GetDATACADASTRO: TDateTime;
    function GetDATAALTERACAO: Nullable<TDateTime>;
  public
    { Public declarations }
    [Restrictions([NotNull])]
    [Column('GUUID', ftString, 64)]
    [Dictionary('GUUID', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property GUUID: String read GetGUUID write FGUUID;

    [Column('NOME', ftString, 128)]
    [Dictionary('NOME', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property NOME: Nullable<String> read FNOME write FNOME;

    [Column('CPF', ftString, 20)]
    [Dictionary('CPF', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CPF: Nullable<String> read FCPF write FCPF;

    [Column('LIMITE', ftBCD, 18, 4)]
    [Dictionary('LIMITE', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property LIMITE: Nullable<Double> read FLIMITE write FLIMITE;

    [Column('STATUS', ftInteger)]
    [Dictionary('STATUS', 'Mensagem de validação', '', '', '', taCenter)]
    property STATUS: SmallInt read FSTATUS write FSTATUS;

    [Column('DATACADASTRO', ftDateTime)]
    [Dictionary('DATACADASTRO', 'Mensagem de validação', '', '', '', taCenter)]
    property DATACADASTRO: TDateTime read GetDATACADASTRO write FDATACADASTRO;

    [Column('DATAALTERACAO', ftDateTime)]
    [Dictionary('DATAALTERACAO', 'Mensagem de validação', '', '', '', taCenter)]
    property DATAALTERACAO: Nullable<TDateTime> read GetDATAALTERACAO write FDATAALTERACAO;
  end;

implementation

{ TCLIENTE }

function TCLIENTE.GetDATAALTERACAO: Nullable<TDateTime>;
begin
  FDATAALTERACAO := Now;
  Result := FDATAALTERACAO;
end;

function TCLIENTE.GetDATACADASTRO: TDateTime;
begin
  if (FDATACADASTRO = StrToDateTime('30/12/1899')) then
    FDATACADASTRO := Now;
  Result := FDATACADASTRO;
end;

function TCLIENTE.GetGUUID: String;
begin
  if FGUUID.IsEmpty then
    FGUUID := TGUID.NewGuid.ToString;
  Result := FGUUID;
end;

initialization
  TRegisterClass.RegisterEntity(TCLIENTE)

end.
