unit Correios4D.Model.DTO.prepostagem.Remetente;

interface

uses
  System.SysUtils,
  System.JSON.Types,
  Correios4D.Attributes,
  Correios4D.Model.DTO.prepostagem.Endereco;

type
  TRemetenteDTO<T: class> = class
  private
    [weak]
    [JSONMarshalled(False)]
    FParent: T;
    // [MaxLength(100)]
    [NotNull]
    [JSONName('nome')]
    FNome: string;
    [JSONName('dddTelefone')]
    FDDDTelefone: string;
    [JSONName('telefone')]
    FTelefone: string;
    [JSONName('dddCelular')]
    FDDDCelular: string;
    [JSONName('celular')]
    FCelular: string;
    [JSONName('email')]
    FEmail: string;
    [JSONName('cpfCnpj')]
    FCpfCnpj: string;
    [JSONName('documentoEstrangeiro')]
    FDocumentoEstrangeiro: string;
    [JSONName('obs')]
    FObservacao: string;
    [JSONName('endereco')]
    FEndereco: TEnderecoDTO<TRemetenteDTO<T>>;
  public
    constructor Create(Parent: T);
    destructor Destroy; override;
    function Nome(AValue: string): TRemetenteDTO<T>;
    function DDDTelefone(AValue: string): TRemetenteDTO<T>;
    function Telefone(AValue: string): TRemetenteDTO<T>;
    function DDDCelular(AValue: string): TRemetenteDTO<T>;
    function Celular(AValue: string): TRemetenteDTO<T>;
    function Email(AValue: string): TRemetenteDTO<T>;
    function CpfCnpj(AValue: string): TRemetenteDTO<T>;
    function DocumentoEstrangeiro(AValue: string): TRemetenteDTO<T>;
    function Observacao(AValue: string): TRemetenteDTO<T>;
    function Endereco: TEnderecoDTO<TRemetenteDTO<T>>;
    function &End: T;
  end;

implementation

{ TRemetenteDTO<T> }

function TRemetenteDTO<T>.Celular(AValue: string): TRemetenteDTO<T>;
begin
  Result := Self;
end;

function TRemetenteDTO<T>.CpfCnpj(AValue: string): TRemetenteDTO<T>;
begin
  Result := Self;
end;

function TRemetenteDTO<T>.&End: T;
begin
  Result := FParent;
end;

constructor TRemetenteDTO<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

function TRemetenteDTO<T>.DDDCelular(AValue: string): TRemetenteDTO<T>;
begin
  Result := Self;
end;

function TRemetenteDTO<T>.DDDTelefone(AValue: string): TRemetenteDTO<T>;
begin
  Result := Self;
end;

destructor TRemetenteDTO<T>.Destroy;
begin
  FEndereco.Free;
  inherited;
end;

function TRemetenteDTO<T>.DocumentoEstrangeiro(AValue: string)
  : TRemetenteDTO<T>;
begin
  Result := Self;
end;

function TRemetenteDTO<T>.Email(AValue: string): TRemetenteDTO<T>;
begin
  Result := Self;
end;

function TRemetenteDTO<T>.Endereco: TEnderecoDTO<TRemetenteDTO<T>>;
begin
  if not assigned(FEndereco) then
    FEndereco := TEnderecoDTO<TRemetenteDTO<T>>.Create(Self);
  Result := FEndereco;
end;

function TRemetenteDTO<T>.Nome(AValue: string): TRemetenteDTO<T>;
begin
  Result := Self;
  FNome := AValue;
end;

function TRemetenteDTO<T>.Observacao(AValue: string): TRemetenteDTO<T>;
begin
  Result := Self;
end;

function TRemetenteDTO<T>.Telefone(AValue: string): TRemetenteDTO<T>;
begin
  Result := Self;
end;

end.
