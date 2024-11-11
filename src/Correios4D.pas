unit Correios4D;

interface

uses
  Correios4D.Interfaces,
  Correios4D.Auth.Interfaces,
  Correios4D.Resources.Interfaces,
  Correios4D.Model.Entitys, Correios4D.Model.Interfaces;

type
  TCorreios4D = class(TInterfacedObject, iCorreios4D)
  private
    FConfig: iAuthConfig;
  public
    constructor Create;
    destructor Destroy; Override;
    class function New: iCorreios4D;
    function AuthConfig: iAuthConfig;
    function Resources: iCorreios;
    function Entity: iEntity;
  published
    { published declarations }
  end;

implementation

uses
  Correios4D.Resources.CorreiosAPI,
  Correios4D.Auth.AuthConfig;

{ TCorreios4D }

function TCorreios4D.AuthConfig: iAuthConfig;
begin
  if not assigned(FConfig) then
    FConfig := TAuthConfig.New;
  Result := FConfig;
end;

constructor TCorreios4D.Create;
begin

end;

destructor TCorreios4D.Destroy;
begin

  Inherited;
end;

function TCorreios4D.Entity: iEntity;
begin
  Result := TEntity.New;
end;

class function TCorreios4D.New: iCorreios4D;
begin
  Result := Self.Create;
end;

function TCorreios4D.Resources: iCorreios;
begin
  Result := TCorreios.New(FConfig);
end;

end.
