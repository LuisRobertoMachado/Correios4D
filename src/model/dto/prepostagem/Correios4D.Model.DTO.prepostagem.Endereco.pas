unit Correios4D.Model.DTO.prepostagem.Endereco;

interface

uses
  System.SysUtils;

type
  TEnderecoDTO<T: class> = class
  private
    [weak]
    [JSONMarshalled(False)]
    FParent: T;
    [NotNull]
    FCEP: string;
    [NotNull]
    FLogradouro: string;
    [NotNull]
    FNumeroResidencia: string;
    FComplemento: string;
    [NotNull]
    FBairro: string;
    [NotNull]
    FCidade: string;
    [NotNull]
    [TStringConstraint(2, 2, False)]  // Exatamente 2 caracteres
    FUF: string;
    [NotNull]
    FRegiao: string;
    [TStringConstraint(2, 2)]  // Exatamente 2 caracteres ou vazio
    FPais: string;
  public
    constructor Create(Parent: T);
    destructor Destroy; override;
    function CEP(AValue: string): TEnderecoDTO<T>;
    function Logradouro(AValue: string): TEnderecoDTO<T>;
    function NumeroResidencia(AValue: string): TEnderecoDTO<T>;
    function Complemento(AValue: string): TEnderecoDTO<T>;
    function Bairro(AValue: string): TEnderecoDTO<T>;
    function Cidade(AValue: string): TEnderecoDTO<T>;
    function UF(AValue: string): TEnderecoDTO<T>;
    function Regiao(AValue: string): TEnderecoDTO<T>;
    function Pais(AValue: string): TEnderecoDTO<T>;
    function &End: T;
  end;

implementation

{ TEnderecoDTO<T> }

function TEnderecoDTO<T>.Bairro(AValue: string): TEnderecoDTO<T>;
begin
  Result := Self;
  FBairro := AValue;
end;

function TEnderecoDTO<T>.CEP(AValue: string): TEnderecoDTO<T>;
begin
  Result := Self;
  FCEP := AValue;
end;

function TEnderecoDTO<T>.Cidade(AValue: string): TEnderecoDTO<T>;
begin
  Result := Self;
  FCidade := AValue;
end;

function TEnderecoDTO<T>.Complemento(AValue: string): TEnderecoDTO<T>;
begin
  Result := Self;
  FComplemento := AValue;
end;

function TEnderecoDTO<T>.&End: T;
begin
  Result := FParent;
end;

constructor TEnderecoDTO<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

destructor TEnderecoDTO<T>.Destroy;
begin

  inherited;
end;

function TEnderecoDTO<T>.Logradouro(AValue: string): TEnderecoDTO<T>;
begin
  Result := Self;
  FLogradouro := AValue;
end;

function TEnderecoDTO<T>.NumeroResidencia(AValue: string): TEnderecoDTO<T>;
begin
  Result := Self;
  FNumeroResidencia := AValue;
end;

function TEnderecoDTO<T>.Pais(AValue: string): TEnderecoDTO<T>;
begin
  Result := Self;
  if AValue = 'BR' then
    Exit;
  FPais := AValue;
end;

function TEnderecoDTO<T>.Regiao(AValue: string): TEnderecoDTO<T>;
begin
  Result := Self;
  FRegiao := AValue;
end;

function TEnderecoDTO<T>.UF(AValue: string): TEnderecoDTO<T>;
begin
  Result := Self;
  FUF := AValue;
end;

end.
