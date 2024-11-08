unit Correios4D.httpClient.Interfaces;

interface

uses
  Correios4D.Types;

type
  iHttpClient = interface
    function Authentication(aUserName, aPassword: string): iHttpClient; Overload;
    function Authentication(aToken: string): iHttpClient; Overload;
    function HttpMethod(AMethod: THttpMethod): iHttpClient;
    function Url(AUrl: string): iHttpClient;
    function Params(aKey: String; aValue : String) : ihttpClient;
    function Body(Value : string) : ihttpClient;
    function Content: String;
    function StatusCode: integer;
    procedure Execute;
  end;

implementation

end.
