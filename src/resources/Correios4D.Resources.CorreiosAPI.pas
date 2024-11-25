unit Correios4D.Resources.CorreiosAPI;

interface

uses
  Correios4D.Resources.Interfaces,
  System.SysUtils,
  Correios4D.Auth.Interfaces,
  Correios4D.httpClient.Interfaces,
  Correios4D.Types,
  Correios4D.Attributes,
  Correios4D.Model.Interfaces;

type
  TCorreios = class(TInterfacedObject, iCorreios)
  private
    [weak]
    FParent: iAuthConfig;
    FHttpClient: iHttpClient;
    FApi: TApiType;
    FApiVersion: TApiVersion;
    constructor CreatePrivate(Parent: iAuthConfig);
    procedure DoBeforeExecute(ASufix: string = '');
  public
    constructor Create;
    destructor Destroy; Override;
    class function New(Parent: iAuthConfig): iCorreios;
//    function
    function Body(Value: iEntity): iCorreios;
    function Content: String;
    function Params(aKey: String; aValue: String): iCorreios;
    function Get(ASufix: string = ''): boolean;
    function Post: boolean;
    function StatusCode: integer;
  end;

implementation

uses
  Correios4D.httpClient.RestHttpClient;

{ TCorreios }

function TCorreios.Body(Value: iEntity): iCorreios;
begin
  Result := Self;
//  if not validar(TEntity(Value)) then
//    raise Exception.Create('Existem parametros inválidos:' + sLineBreak);

  FHttpClient.Body(Value.Content);
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

procedure TCorreios.DoBeforeExecute(ASufix: string = '');
var
  LUrl: string;
begin
  LUrl := string.join('/',[FParent.BaseUrl,FParent.Api.ToString, FParent.ApiVersion,FParent.EndPoint]);
  if not ASufix.IsEmpty then
    LUrl := string.join('/',[LUrl, ASufix]);
  FHttpClient.Url(LUrl);
end;

function TCorreios.Get(ASufix: string): boolean;
begin
  Result := False;
  DoBeforeExecute(ASufix);
  FHttpClient
    .HttpMethod(THttpMethod.GET)
    .Execute;
  Result := StatusCode in [200,201];
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

function TCorreios.Post: boolean;
begin
  Result := False;
  DoBeforeExecute;
  FHttpClient
    .HttpMethod(THttpMethod.POST)
    .Execute;
  Result := StatusCode in [200,201];
end;

function TCorreios.StatusCode: integer;
begin
  Result := FHttpClient.StatusCode;
end;

end.
