unit Correios4D.Interfaces;

interface

uses
  Correios4D.Resources.Interfaces,
  Correios4D.Auth.Interfaces,
  Correios4D.Model.Entitys,
  Correios4D.Model.Interfaces;

type
  iCorreios4D = interface
    function AuthConfig: iAuthConfig;
    function Resources: iCorreios;
    function Entity: iEntity;
  end;

implementation

end.
