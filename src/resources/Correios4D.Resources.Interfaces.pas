unit Correios4D.Resources.Interfaces;

interface

uses
  Correios4D.Types,
  Correios4D.Model.Interfaces;

type
  iCorreios = interface
    function Params(aKey: String; aValue: String): iCorreios;
    function Body(Value: iEntity): iCorreios;
    function Content: String;
    function StatusCode: integer;
  end;

implementation

end.
