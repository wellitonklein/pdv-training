unit Entidade_VendaItens.Model;

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
  [Table('VENDAITENS', '')]
  [PrimaryKey('GUUID', NotInc, NoSort, False, 'Chave primária')]
  TVENDAITENS = class
  private
    { Private declarations }
    FGUUID: String;
    FVENDA: Nullable<String>;
    FPRODUTO: Nullable<String>;
    FQUANTIDADE: Nullable<Double>;
    FPRECO: Nullable<Double>;
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

    [Column('PRODUTO', ftString, 64)]
    [Dictionary('PRODUTO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property PRODUTO: Nullable<String> read FPRODUTO write FPRODUTO;

    [Column('QUANTIDADE', ftBCD, 18, 4)]
    [Dictionary('QUANTIDADE', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property QUANTIDADE: Nullable<Double> read FQUANTIDADE write FQUANTIDADE;

    [Column('PRECO', ftBCD, 18, 4)]
    [Dictionary('PRECO', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property PRECO: Nullable<Double> read FPRECO write FPRECO;

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

{ TVENDAITENS }

function TVENDAITENS.GetDATAALTERACAO: TDateTime;
begin
  FDATAALTERACAO := Now;
  Result := FDATAALTERACAO;
end;

function TVENDAITENS.GetDATACADASTRO: TDateTime;
begin
  if (FDATACADASTRO = StrToDateTime('30/12/1899')) then
    FDATACADASTRO := Now;
  Result := FDATACADASTRO;
end;

function TVENDAITENS.GetGUUID: String;
begin
  if FGUUID.IsEmpty then
    FGUUID := TGUID.NewGuid.ToString;
  Result := FGUUID;
end;

initialization
  TRegisterClass.RegisterEntity(TVENDAITENS)

end.
