unit Correios4D.Resources.Interfaces;

interface

uses
  Correios4D.Types,
  Correios4D.Model.Interfaces;

type
  iCorreios = interface
    function Body(Value: iEntity): iCorreios;
    function Content: String;
    function Params(aKey: String; aValue: String): iCorreios;
    function Get(ASufix: string = ''): boolean;
    function Post: boolean;
    function StatusCode: integer;
  end;

implementation

end.
