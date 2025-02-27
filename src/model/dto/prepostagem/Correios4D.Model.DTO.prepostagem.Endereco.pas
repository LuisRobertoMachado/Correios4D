unit Correios4D.Model.DTO.prepostagem.Endereco;

interface

uses
  System.SysUtils,
  Correios4D.Model.Interfaces,
  System.JSON;

type
  TEnderecoDTO<T: IInterface> = class(TInterfacedObject, iEnderecoDTO<T>)
  private
    [weak]
    FParent: T;
    FJson : TJsonObject;
    FJSONParent: TJSONObject;
    constructor CreatePrivate(Parent: T; JSON: TJSONObject);
  public
    constructor Create;
    destructor Destroy; override;
    class function New(Parent: T; JSON: TJSONObject): iEnderecoDTO<T>;
    function Logradouro(const Value: string): iEnderecoDTO<T>;
    function Numero(const Value: string): iEnderecoDTO<T>;
    function Bairro(const Value: string): iEnderecoDTO<T>;
    function Complemento(const Value: string): iEnderecoDTO<T>;
    function Cidade(const Value: string): iEnderecoDTO<T>;
    function Estado(const Value: string): iEnderecoDTO<T>;
    function Pais(const Value: string): iEnderecoDTO<T>;
    function Cep(const Value: string): iEnderecoDTO<T>;    
    function &End: T;    
  end;

implementation

{ TEnderecoDTO<T> }

function TEnderecoDTO<T>.&End: T;
begin
  result := FParent;
  FJSONParent.AddPair('endereco', FJSON);
end;

function TEnderecoDTO<T>.Bairro(const Value: string): iEnderecoDTO<T>;
begin
  Result := Self;
  FJson.AddPair('bairro', Value);
end;

function TEnderecoDTO<T>.Cep(const Value: string): iEnderecoDTO<T>;
begin
  Result := Self;
  FJson.AddPair('cep', Value);
end;

function TEnderecoDTO<T>.Cidade(const Value: string): iEnderecoDTO<T>;
begin
  Result := Self;
  FJson.AddPair('cidade', Value);
end;

function TEnderecoDTO<T>.Complemento(const Value: string): iEnderecoDTO<T>;
begin
  Result := Self;
  FJson.AddPair('complemento', Value);
end;

constructor TEnderecoDTO<T>.Create;
begin
  raise Exception.Create('Para obter uma instancia, utiliza a função New');
end;

constructor TEnderecoDTO<T>.CreatePrivate(Parent: T; JSON: TJSONObject);
begin
  inherited Create;
  FParent := Parent;
  FJSONParent := JSON;
  FJSON := TJSONObject.Create;
end;

destructor TEnderecoDTO<T>.Destroy;
begin

  inherited;
end;

function TEnderecoDTO<T>.Estado(const Value: string): iEnderecoDTO<T>;
begin
  Result := Self;
  FJson.AddPair('uf', Value);
end;

function TEnderecoDTO<T>.Logradouro(const Value: string): iEnderecoDTO<T>;
begin
  Result := Self;
  FJson.AddPair('logradouro', Value);
end;

class function TEnderecoDTO<T>.New(Parent: T;
  JSON: TJSONObject): iEnderecoDTO<T>;
begin
  Result := Self.CreatePrivate(Parent,JSON);
end;

function TEnderecoDTO<T>.Numero(const Value: string): iEnderecoDTO<T>;
begin
  Result := Self;
  FJson.AddPair('numero', Value);
end;

function TEnderecoDTO<T>.Pais(const Value: string): iEnderecoDTO<T>;
begin
  Result := Self;
  if not (Value = 'BR') then
    FJson.AddPair('pais', Value);
end;

end.
