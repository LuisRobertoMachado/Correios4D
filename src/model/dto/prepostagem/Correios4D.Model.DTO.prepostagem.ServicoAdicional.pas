unit Correios4D.Model.DTO.prepostagem.ServicoAdicional;

interface

uses
  System.SysUtils,
  Correios4D.Model.Interfaces,
  System.JSON;

type
  TServicoAdicionalDTO<T: IInterface> = class(TInterfacedObject,
    iServicoAdicionalDTO<T>)
  private
    [weak]
    FParent: T;
    FJson: TJsonObject;
    FJSONArray : TJSONArray;
    FJSONParent: TJsonObject;
    constructor CreatePrivate(Parent: T; JSON: TJsonObject);
  public
    constructor Create;
    destructor Destroy; override;
    function CodigoServicoAdicional(const AValue: string): iServicoAdicionalDTO<T>;
    function Next: iServicoAdicionalDTO<T>;
    function &End: T;
    class function New(Parent: T; JSON: TJsonObject): iServicoAdicionalDTO<T>;
  end;

implementation

{ TServicoAdicionalDTO<T> }

function TServicoAdicionalDTO<T>.CodigoServicoAdicional(const AValue: string)
  : iServicoAdicionalDTO<T>;
begin
  Result := Self;
  FJson.AddPair('codigoServicoAdicional', AValue);
end;

function TServicoAdicionalDTO<T>.&End: T;
begin
  result := FParent;
  FJSONArray.AddElement(FJSON);
  FJSONParent.AddPair('listaServicoAdicional', FJSONArray);
end;

constructor TServicoAdicionalDTO<T>.Create;
begin
  raise Exception.Create('Para obter uma instancia, utiliza a função New');
end;

constructor TServicoAdicionalDTO<T>.CreatePrivate(Parent: T; JSON: TJsonObject);
begin
  inherited Create;
  FParent := Parent;
  FJSONParent := JSON;
  FJSON := TJSONObject.Create;
  FJSONArray := TJSONArray.Create;
end;

destructor TServicoAdicionalDTO<T>.Destroy;
begin

  inherited;
end;

class function TServicoAdicionalDTO<T>.New(Parent: T; JSON: TJsonObject)
  : iServicoAdicionalDTO<T>;
begin
  Result := Self.CreatePrivate(Parent, JSON);
end;

function TServicoAdicionalDTO<T>.Next: iServicoAdicionalDTO<T>;
begin
  Result := Self;
  FJSONArray.AddElement(FJSON);
  FJSON := TJSONObject.Create;
end;

end.
