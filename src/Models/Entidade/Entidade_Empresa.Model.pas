unit Entidade_Empresa.Model;

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
  [Table('EMPRESA', '')]
  [PrimaryKey('GUUID', NotInc, NoSort, False, 'Chave primária')]
  TEMPRESA = class
  private
    { Private declarations }
    FGUUID: String;
    FNOME: Nullable<String>;
    FFANTASIA: Nullable<String>;
    FCPFCNPJ: Nullable<String>;
    FIE: Nullable<String>;
    FTELEFONE: Nullable<String>;
    FLOGRADOURO: Nullable<String>;
    FNUMERO: Nullable<Integer>;
    FBAIRRO: Nullable<String>;
    FCIDADE: Nullable<String>;
    FUF: Nullable<String>;
    FCEP: Nullable<String>;
    FCMUNICIPIO: Nullable<String>;
    FCOMPLEMENTO: Nullable<String>;
    function GetGUUID: String;
  public
    { Public declarations }
    [Restrictions([NotNull])]
    [Column('GUUID', ftString, 64)]
    [Dictionary('GUUID', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property GUUID: String read GetGUUID write FGUUID;

    [Column('NOME', ftString, 255)]
    [Dictionary('NOME', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property NOME: Nullable<String> read FNOME write FNOME;

    [Column('FANTASIA', ftString, 255)]
    [Dictionary('FANTASIA', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property FANTASIA: Nullable<String> read FFANTASIA write FFANTASIA;

    [Column('CPFCNPJ', ftString, 20)]
    [Dictionary('CPFCNPJ', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CPFCNPJ: Nullable<String> read FCPFCNPJ write FCPFCNPJ;

    [Column('IE', ftString, 20)]
    [Dictionary('IE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property IE: Nullable<String> read FIE write FIE;

    [Column('TELEFONE', ftString, 15)]
    [Dictionary('TELEFONE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property TELEFONE: Nullable<String> read FTELEFONE write FTELEFONE;

    [Column('LOGRADOURO', ftString, 255)]
    [Dictionary('LOGRADOURO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property LOGRADOURO: Nullable<String> read FLOGRADOURO write FLOGRADOURO;

    [Column('NUMERO', ftInteger)]
    [Dictionary('NUMERO', 'Mensagem de validação', '', '', '', taCenter)]
    property NUMERO: Nullable<Integer> read FNUMERO write FNUMERO;

    [Column('BAIRRO', ftString, 255)]
    [Dictionary('BAIRRO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property BAIRRO: Nullable<String> read FBAIRRO write FBAIRRO;

    [Column('CIDADE', ftString, 255)]
    [Dictionary('CIDADE', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CIDADE: Nullable<String> read FCIDADE write FCIDADE;

    [Column('UF', ftString, 2)]
    [Dictionary('UF', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property UF: Nullable<String> read FUF write FUF;

    [Column('CEP', ftString, 15)]
    [Dictionary('CEP', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CEP: Nullable<String> read FCEP write FCEP;

    [Column('CMUNICIPIO', ftString, 10)]
    [Dictionary('CMUNICIPIO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CMUNICIPIO: Nullable<String> read FCMUNICIPIO write FCMUNICIPIO;

    [Column('COMPLEMENTO', ftString, 255)]
    [Dictionary('COMPLEMENTO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property COMPLEMENTO: Nullable<String> read FCOMPLEMENTO write FCOMPLEMENTO;
  end;

implementation

{ TEMPRESA }

{ TEMPRESA }

function TEMPRESA.GetGUUID: String;
begin
  if FGUUID.IsEmpty then
    FGUUID := TGUID.NewGuid.ToString;
  Result := FGUUID;
end;

initialization
  TRegisterClass.RegisterEntity(TEMPRESA)

end.
