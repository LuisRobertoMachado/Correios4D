unit Correios4D.Model.DTO.prepostagem.Destinatario;

interface

uses
  System.SysUtils,
  System.JSON,
  System.JSON.Types,
  System.Generics.Collections,
  Correios4D.Model.Interfaces;

type
  TDestinatarioDTO<T: IInterface> = class(TInterfacedObject, iDestinatarioDTO<T>)
  private
    [weak]
    FParent: T;
    FJSON: TJSONObject;
    FJSONParent: TJSONObject;
    constructor CreatePrivate(Parent: T; JSON: TJSONObject);
  public
    constructor Create;
    destructor Destroy; override;
    class function New(Parent: T; JSON: TJSONObject): iDestinatarioDTO<T>;
    function Nome(AValue: string): iDestinatarioDTO<T>;
    function DDDTelefone(AValue: string): iDestinatarioDTO<T>;
    function DDITelefone(AValue: string): iDestinatarioDTO<T>;
    function Telefone(AValue: string): iDestinatarioDTO<T>;
    function DDDCelular(AValue: string): iDestinatarioDTO<T>;
    function DDICelular(AValue: string): iDestinatarioDTO<T>;
    function Celular(AValue: string): iDestinatarioDTO<T>;
    function Email(AValue: string): iDestinatarioDTO<T>;
    function CpfCnpj(AValue: string): iDestinatarioDTO<T>;
    function DocumentoEstrangeiro(AValue: string): iDestinatarioDTO<T>;
    function Observacao(AValue: string): iDestinatarioDTO<T>;
    function Endereco: iEnderecoDTO<iDestinatarioDTO<T>>;
    function &End: T;
  end;

implementation

uses
  Correios4D.Model.DTO.prepostagem.Endereco;

{ TDestinatarioDTO<T> }

function TDestinatarioDTO<T>.Celular(AValue: string): iDestinatarioDTO<T>;
begin
  Result := Self;
  FJson.AddPair('celular', AValue);
end;

function TDestinatarioDTO<T>.CpfCnpj(AValue: string): iDestinatarioDTO<T>;
begin
  Result := Self;
  FJson.AddPair('cpfCnpj',AValue);
end;

function TDestinatarioDTO<T>.&End: T;
begin
  Result := FParent;
  FJSONParent.AddPair('destinatario', FJSON);
end;

constructor TDestinatarioDTO<T>.Create;
begin
  raise Exception.Create('Para obter uma instancia, utiliza a função New');
end;

constructor TDestinatarioDTO<T>.CreatePrivate(Parent: T; JSON: TJSONObject);
begin
  inherited Create;
  FParent := Parent;
  FJSONParent := JSON;
  FJSON := TJSONObject.Create;
end;

function TDestinatarioDTO<T>.DDDCelular(AValue: string): iDestinatarioDTO<T>;
begin
  Result := Self;
  FJson.AddPair('dddCelular', AValue);
end;

function TDestinatarioDTO<T>.DDDTelefone(AValue: string): iDestinatarioDTO<T>;
begin
  Result := Self;
  FJson.AddPair('dddTelefone', AValue);
end;

function TDestinatarioDTO<T>.DDICelular(AValue: string): iDestinatarioDTO<T>;
begin
  Result := Self;
  FJson.AddPair('ddiCelular', AValue);
end;

function TDestinatarioDTO<T>.DDITelefone(AValue: string): iDestinatarioDTO<T>;
begin
  Result := Self;
  FJson.AddPair('ddiTelefone', AValue);
end;

destructor TDestinatarioDTO<T>.Destroy;
begin

  inherited;
end;

function TDestinatarioDTO<T>.DocumentoEstrangeiro(
  AValue: string): iDestinatarioDTO<T>;
begin
  Result := Self;
  FJson.AddPair('documentoEstrangeiro', AValue);
end;

function TDestinatarioDTO<T>.Email(AValue: string): iDestinatarioDTO<T>;
begin
  Result := Self;
  FJson.AddPair('email', AValue);
end;

function TDestinatarioDTO<T>.Endereco: iEnderecoDTO<iDestinatarioDTO<T>>;
begin
  Result := TEnderecoDTO<iDestinatarioDTO<T>>.New(Self, FJSON);
end;

class function TDestinatarioDTO<T>.New(Parent: T; JSON: TJSONObject)
  : iDestinatarioDTO<T>;
begin
  result := Self.CreatePrivate(Parent, JSON);
end;

function TDestinatarioDTO<T>.Nome(AValue: string): iDestinatarioDTO<T>;
begin
  Result := Self;
  FJson.AddPair('nome', Avalue);
end;

function TDestinatarioDTO<T>.Observacao(AValue: string): iDestinatarioDTO<T>;
begin
  Result := Self;
  FJson.AddPair('obs', AValue);
end;

function TDestinatarioDTO<T>.Telefone(AValue: string): iDestinatarioDTO<T>;
begin
  Result := Self;
  FJson.AddPair('telefone', AValue);
end;

end.
