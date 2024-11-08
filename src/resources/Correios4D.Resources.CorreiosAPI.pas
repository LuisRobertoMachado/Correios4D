unit Correios4D.Resources.CorreiosAPI;

interface

uses
  Correios4D.Resources.Interfaces,
  System.SysUtils,
  Correios4D.Auth.Interfaces,
  Correios4D.httpClient.Interfaces,
  Correios4D.Types,
  Correios4D.Attributes,
  Correios4D.Model.Entitys;

type
  TCorreios = class(TInterfacedObject, iCorreios)
  private
    [weak]
    FParent: iAuthConfig;
    FHttpClient: iHttpClient;
    FApi: TApiType;
    FApiVersion: TApiVersion;
    constructor CreatePrivate(Parent: iAuthConfig);
  public
    constructor Create;
    destructor Destroy; Override;
    class function New(Parent: iAuthConfig): iCorreios;
    function Params(aKey: String; aValue: String): iCorreios;
    function Body(Value: TEntity): iCorreios;
    function Content: String;
    function StatusCode: integer;
  end;

implementation

uses
  Correios4D.httpClient.RestHttpClient;

{ TCorreios }

function TCorreios.Body(Value: TEntity): iCorreios;
var
  LJson: string;
begin
  Result := Self;
  if not validar(TEntity(Value)) then
    raise Exception.Create('Existem parametros inválidos:' + sLineBreak);

  LJson := Value.Content(FParent.Api);
  FHttpClient.Body(LJson);
  Writeln(LJson);
end;

function TCorreios.Content: String;
begin
  Result := FHttpClient.Content;
end;

constructor TCorreios.Create;
begin
  raise Exception.Create('Para obter uma instancia use a função New');
end;

constructor TCorreios.CreatePrivate(Parent: iAuthConfig);
begin
  inherited Create;
  FParent := Parent;
  FHttpClient := THttpClient.New;
  FHttpClient.Authentication(FParent.Token);
end;

destructor TCorreios.Destroy;
begin

  inherited;
end;

class function TCorreios.New(Parent: iAuthConfig): iCorreios;
begin
  Result := Self.CreatePrivate(Parent);
end;

function TCorreios.Params(aKey, aValue: String): iCorreios;
begin
  Result := Self;
  FHttpClient.Params(aKey, aValue);
end;

function TCorreios.StatusCode: integer;
begin
  Result := FHttpClient.StatusCode;
end;

end.
