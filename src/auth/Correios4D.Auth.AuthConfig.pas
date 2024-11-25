unit Correios4D.Auth.AuthConfig;

interface

uses
  Correios4D.Auth.Interfaces,
  Correios4D.Types,
  System.SysUtils,
  System.DateUtils,
  JSON;

type
  TAuthConfig = class(TInterfacedObject, iAuthConfig)
  private
    FApi: TapiType;
    FApiVersion: TApiVersion;
    FPrepostagemEndPoint: TApiPrepostagemEndPointBaseType;
    FBaseUrl: string;
    FUserName: string;
    FCodigoAPIs: string;
    FContrato: string;
    FCartaoPostagem: string;
    FToken: string;
    FValidadeToken: TDateTime;
    constructor CreatePrivate;
    function GetBodyAuthCartao: string;
    function GetBodyAuthContrato: string;
    procedure RenovarToken;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iAuthConfig;
    function Api(AApi: TapiType): iAuthConfig; Overload;
    function Api: TapiType; Overload;
    function ApiVersion(AVersion: TApiVersion): iAuthConfig; Overload;
    function ApiVersion: string; Overload;
    function PrepostagemEndPoint(AEndPoint: TApiPrepostagemEndPointBaseType)
      : iAuthConfig; Overload;
    function EndPoint: string; Overload;
    function BaseUrl(AValue: string): iAuthConfig; Overload;
    function BaseUrl: string; Overload;
    function UserName(AValue: string): iAuthConfig; Overload;
    function UserName: string; Overload;
    function CodigoAPIs(AValue: string): iAuthConfig; Overload;
    function CodigoAPIs: string; Overload;
    function CartaoPostagem(AValue: string): iAuthConfig; Overload;
    function Contrato(AValue: string): iAuthConfig; Overload;
    function Token: string;
  end;

implementation

uses
  Correios4D.httpClient.Interfaces,
  Correios4D.httpClient.RestHttpClient;

{ TAuthConfig }

function TAuthConfig.CartaoPostagem(AValue: string): iAuthConfig;
begin
  Result := Self;
  FCartaoPostagem := AValue;
end;

function TAuthConfig.CodigoAPIs: string;
begin
  Result := FCodigoAPIs;
end;

function TAuthConfig.CodigoAPIs(AValue: string): iAuthConfig;
begin
  Result := Self;
  FCodigoAPIs := AValue;
end;

function TAuthConfig.Contrato(AValue: string): iAuthConfig;
begin
  Result := Self;
  FContrato := AValue;
end;

constructor TAuthConfig.Create;
begin
  raise Exception.Create('Para obter uma instancia use a função New');
end;

constructor TAuthConfig.CreatePrivate;
begin

end;

destructor TAuthConfig.Destroy;
begin

  inherited;
end;

function TAuthConfig.PrepostagemEndPoint(AEndPoint
  : TApiPrepostagemEndPointBaseType): iAuthConfig;
begin
  Result := Self;
  FPrepostagemEndPoint := AEndPoint;
end;

function TAuthConfig.EndPoint: string;
begin
  case FApi of
    // TOKEN: Result := F;
    // PRECO: ;
    PREPOSTAGEM:
      Result := FPrepostagemEndPoint.GetValue;
    // PRAZO: ;
  end;
end;

function TAuthConfig.GetBodyAuthCartao: string;
var
  LJson: TJSONObject;
begin
  LJson := TJSONObject.Create;
  try
    if not FCartaoPostagem.IsEmpty then
      LJson.AddPair('numero', FCartaoPostagem);

    if not FContrato.IsEmpty then
      LJson.AddPair('contrato', FContrato);

    Result := LJson.ToString;
  finally
    LJson.Free;
  end;
end;

function TAuthConfig.GetBodyAuthContrato: string;
var
  LJson: TJSONObject;
begin
  LJson := TJSONObject.Create;
  try
    if not FContrato.IsEmpty then
      LJson.AddPair('contrato', FContrato);

    Result := LJson.ToString;
  finally
    LJson.Free;
  end;
end;

class function TAuthConfig.New: iAuthConfig;
begin
  Result := Self.CreatePrivate;
end;

procedure TAuthConfig.RenovarToken;
var
  LHttp: iHttpClient;
  JSONObject: TJSONObject;
  LBody: widestring;
  LUrl: string;
  LEndPoint: string;
begin
  LEndPoint := TApiTokenEndPointBaseType.AUTENTICA.GetValue;
  if not FCartaoPostagem.IsEmpty then
  begin
    LEndPoint := TApiTokenEndPointBaseType.AUTENTICA_CARTAO.GetValue;
    LBody := GetBodyAuthCartao;
  end
  else if not FContrato.IsEmpty then
  begin
    LEndPoint := TApiTokenEndPointBaseType.AUTENTICA_CONTRATO.GetValue;
    LBody := GetBodyAuthContrato;
  end;
  LUrl := string.Join('/', [FBaseUrl, TapiType.Token.ToString, TApiVersion.V1.ToString,
    LEndPoint]);

  LHttp :=
    THttpClient
      .New
        .Authentication(FUserName, FCodigoAPIs)
        .HttpMethod(POST)
        .Url(LUrl)
        .Body(LBody);

  LHttp.Execute;
  if LHttp.StatusCode = 201 then
  begin
    JSONObject := TJSONObject.ParseJSONValue(LHttp.Content) as TJSONObject;
    try
      FValidadeToken := ISO8601ToDate(JSONObject.GetValue<string>('expiraEm'));
      FToken := JSONObject.GetValue<string>('token');
    finally
      JSONObject.Free;
    end;
  end;
end;

function TAuthConfig.Token: string;
begin
  if FToken.IsEmpty or (FValidadeToken < now) then
    RenovarToken;

  Result := FToken;
end;

function TAuthConfig.BaseUrl(AValue: string): iAuthConfig;
begin
  Result := Self;
  FBaseUrl := AValue;
end;

function TAuthConfig.Api(AApi: TapiType): iAuthConfig;
begin
  Result := Self;
  FApi := AApi;
end;

function TAuthConfig.ApiVersion(AVersion: TApiVersion): iAuthConfig;
begin
  Result := Self;
  FApiVersion := AVersion;
end;

function TAuthConfig.Api: TapiType;
begin
  Result := FApi;
end;

function TAuthConfig.ApiVersion: string;
begin
  Result := FApiVersion.ToString;
end;

function TAuthConfig.BaseUrl: string;
begin
  Result := FBaseUrl;
end;

function TAuthConfig.UserName(AValue: string): iAuthConfig;
begin
  Result := Self;
  FUserName := AValue;
end;

function TAuthConfig.UserName: string;
begin
  Result := FUserName;
end;

end.
