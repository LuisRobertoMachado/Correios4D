unit Correios4D.Types;

interface

uses
  TypInfo,
  SysUtils;

type
  THttpMethod = (POST, PUT, GET, DELETE, PATCH);

  TApiVersion = (V1,V2,V3);

  TApiType = (TOKEN, PRECO, PREPOSTAGEM, PRAZO);

  TApiTokenEndPointBaseType = (AUTENTICA, AUTENTICA_CARTAO, AUTENTICA_CONTRATO);

  TApiPrepostagemEndPointBaseType = (PREPOSTAGENS);

  TAuthType = (BASIC_AUTH, OAUTH_2);

  TApiTokenEndPointBaseTypeHelper = record helper for TApiTokenEndPointBaseType
    function GetValue: string;
  end;

  TApiTypeHelper = record helper for TApiType
    function ToString : String;
  end;

  TApiVersionHelper = record helper for TApiVersion
    function ToString : String;
  end;

  THttpMethodHelper = record helper for THttpMethod
    function GetValue : String;
  end;


implementation

{ TApiVersionTypeHelper }

function TApiVersionHelper.ToString: String;
begin
  Result := lowerCase(GetEnumName(TypeInfo(TApiVersion), Integer(Self)));
end;

{ THttpMethodHelper }

function THttpMethodHelper.GetValue: String;
begin
  Result := GetEnumName(TypeInfo(THttpMethod), Integer(Self));
end;

{ TApiNameHelper }

function TApiTypeHelper.ToString: String;
begin
  Result := lowerCase(GetEnumName(TypeInfo(TApiType), Integer(Self)));
end;

{ TApiTokenEndPointBaseTypeHelper }

function TApiTokenEndPointBaseTypeHelper.GetValue: string;
begin
  case Self of
    AUTENTICA: result := 'autentica';
    AUTENTICA_CARTAO: result := 'autentica/cartaopostagem';
    AUTENTICA_CONTRATO: result := 'autentica/contrato';
  end;
end;

end.
