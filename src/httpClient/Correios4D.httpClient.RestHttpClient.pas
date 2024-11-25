unit Correios4D.httpClient.RestHttpClient;

interface

uses
  Correios4D.httpClient.Interfaces,
  Correios4D.Types,
  System.SysUtils,
  System.Generics.Collections,
  REST.Client;

type
  THttpClient = class(TInterfacedObject, iHttpClient)
  private
    FRestClient: TRESTClient;
    FRestRequest: TRESTRequest;
    FRestResponse: TRESTResponse;
    FAuthenticator: TCustomAuthenticator;
    FAuthType: TAuthType;
    FHttpMethod: THttpMethod;
    FBody: string;
    FUrl: string;
    FListaParams: TDictionary<String, string>;
    constructor CreatePrivate;
    function SetRestClient: boolean;
    function SetRestRequest: boolean;
    function SetRestResponse: boolean;
    procedure DoBeforeExecute;
    procedure DoAfterExecute;
  public
    constructor Create;
    destructor Destroy; Override;
    class function New: iHttpClient;
    function Authentication(aUserName, aPassword: string): iHttpClient; Overload;
    function Authentication(aToken: string): iHttpClient; Overload;
    function HttpMethod(AMethod: THttpMethod): iHttpClient;
    function Url(AUrl: string): iHttpClient;
    function Params(aKey: String; aValue: String): iHttpClient;
    function Body(Value: string): iHttpClient;
    function Content: String;
    function StatusCode: integer;
    procedure Execute;
  end;

implementation

uses
  REST.Authenticator.Basic,
  REST.Authenticator.OAuth,
  REST.Types;

{ THttpClient }

function THttpClient.Authentication(aUserName, aPassword: string): iHttpClient;
begin
  Result := Self;
  FAuthenticator := THTTPBasicAuthenticator.Create(aUserName, aPassword);
end;

function THttpClient.Authentication(aToken: string): iHttpClient;
begin
  FAuthenticator := TOAuth2Authenticator.Create(nil);
  TOAuth2Authenticator(FAuthenticator).AccessToken := aToken;
  TOAuth2Authenticator(FAuthenticator).AccessTokenParamName := 'access_token';
  TOAuth2Authenticator(FAuthenticator).TokenType := TOAuth2TokenType.ttBEARER;
  TOAuth2Authenticator(FAuthenticator).ResponseType :=
    TOAuth2ResponseType.rtTOKEN;
end;

function THttpClient.Body(Value: string): iHttpClient;
begin
  Result := Self;
  FBody := Value;
end;

function THttpClient.Content: String;
begin
  Result := FRestResponse.Content;
end;

constructor THttpClient.Create;
begin
  raise Exception.Create('Para obter uma instancia, use a função new');
end;

constructor THttpClient.CreatePrivate;
begin
  inherited Create;
  FListaParams := TDictionary<string,string>.Create;
end;

destructor THttpClient.Destroy;
begin
  FListaParams.Free;
  FRestClient.Free;
  FAuthenticator.Free;
  inherited;
end;

procedure THttpClient.DoAfterExecute;
begin
//
end;

procedure THttpClient.DoBeforeExecute;
begin
  if not(SetRestClient and SetRestResponse and SetRestRequest) then
    raise Exception.Create('Erro ao instanciar conexão com API.');
end;

procedure THttpClient.Execute;
begin
  DoBeforeExecute;
  case FHttpMethod of
    POST, PUT:
      begin
        FRestRequest.Params.Add;
        with FRestRequest.Params[Pred(FRestRequest.Params.Count)] do
        begin
          ContentType := ctAPPLICATION_JSON;
          Kind := pkREQUESTBODY;
//          Name := 'body';
          Value := FBody;
//          Options := [poDoNotEncode]
        end;
      end;
  end;
  FRestRequest.Method := TRESTRequestMethod(Ord(FHttpMethod));
  FRestRequest.Execute;
  DoAfterExecute;
end;

function THttpClient.HttpMethod(AMethod: THttpMethod): iHttpClient;
begin
  Result := Self;
  FHttpMethod := AMethod;
end;

class function THttpClient.New: iHttpClient;
begin
  Result := Self.CreatePrivate;
end;

function THttpClient.Params(aKey, aValue: String): iHttpClient;
begin
  Result := Self;
  FListaParams.Add(aKey, aValue);
end;

function THttpClient.SetRestClient: boolean;
begin
  Result := False;
  FRestClient := TRESTClient.Create(FUrl);
  FRestClient.Accept := '*/*';
//  FRestClient.AcceptCharset := 'UTF-8';//, *;q=0.8';
  FRestClient.AcceptEncoding := 'gzip, deflate, br';
  FRestClient.AutoCreateParams := true;
  FRestClient.Authenticator := FAuthenticator;
  FRestClient.AllowCookies := true;
  FRestClient.ContentType := 'application/json';
//  FRestClient.FallbackCharsetEncoding := 'utf-8';
  FRestClient.HandleRedirects := true;
  Result := true;
end;

function THttpClient.SetRestRequest: boolean;
var
  key: string;
begin
  Result := False;
  FRestRequest := TRESTRequest.Create(FRestClient);
//  FRestRequest.Accept :=
//    'application/json, text/plain; q=0.9, text/html;q=0.8,';
//  FRestRequest.AcceptCharset := 'UTF-8, *;q=0.8';
//  FRestRequest.AcceptEncoding := '';
//  FRestRequest.AutoCreateParams := true;
  FRestRequest.Client := FRestClient;
//  FRestRequest.SynchronizedEvents := False;
  FRestRequest.Response := FRestResponse;
  for key in FListaParams.Keys do
    FRestRequest.Params.AddItem(key, FListaParams.Items[key]);
  Result := true;
end;

function THttpClient.SetRestResponse: boolean;
begin
  Result := False;
  FRestResponse := TRESTResponse.Create(FRestClient);
  FRestResponse.ContentType := 'application/json';
  Result := true;
end;

function THttpClient.StatusCode: integer;
begin
  Result := FRestResponse.StatusCode;
end;

function THttpClient.Url(AUrl: string): iHttpClient;
begin
  Result := Self;
  FUrl := AUrl;
end;

end.
