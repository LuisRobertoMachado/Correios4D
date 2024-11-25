unit Correios4D.Auth.Interfaces;

interface

uses
  Correios4D.Types;

type
  iAuthConfig = interface
    function Api(AApi: TApitype): iAuthConfig; Overload;
    function Api: TApitype; Overload;
    function ApiVersion(AVersion: TApiVersion): iAuthConfig; Overload;
    function ApiVersion: string; Overload;
    function PrepostagemEndPoint(AEndPoint: TApiPrepostagemEndPointBaseType): iAuthConfig; Overload;
    function EndPoint: string; Overload;
    function BaseUrl(AValue: string): iAuthConfig; Overload;
    function BaseUrl: string; Overload;
    function UserName(AValue: string): iAuthConfig; Overload;
    function UserName: string;  Overload;
    function CodigoAPIs(AValue: string): iAuthConfig; Overload;
    function CodigoAPIs: string;  Overload;
    function CartaoPostagem(AValue: string): iAuthConfig; Overload;
    function Contrato(AValue: string): iAuthConfig; Overload;
    function Token: string;
  end;

implementation

end.
