unit Correios4D.Model.DTO.prepostagem.Conteudo;

interface

uses
  Correios4D.Model.Interfaces,
  System.JSON,
  System.SysUtils;

type
  TConteudoDTO<T: IInterface> = class(TInterfacedObject, iConteudoDTO<T>)
  private
    [weak]
    FParent: T;
    FJson: TJsonObject;
    FJSONArray: TJSONArray;
    FJSONParent: TJsonObject;
    constructor CreatePrivate(Parent: T; JSON: TJsonObject);
  public
    constructor Create;
    destructor Destroy; override;
    function Conteudo(const Value: string): iConteudoDTO<T>;
    function Quantidade(const Value: string): iConteudoDTO<T>;
    function Valor(const Value: string): iConteudoDTO<T>;
    function Peso(const Value: string): iConteudoDTO<T>;
    function Next: iConteudoDTO<T>;
    Function &End: T;
    class function New(Parent: T; JSON: TJsonObject): iConteudoDTO<T>;
  end;

implementation

{ TConteudoDTO<T: IInterface> }

function TConteudoDTO<T>.Conteudo(const Value: string): iConteudoDTO<T>;
begin
  Result := Self;
  FJson.AddPair('conteudo', Value);
end;

function TConteudoDTO<T>.&End: T;
begin
  result := FParent;
  FJSONArray.AddElement(FJSON);
  FJSONParent.AddPair('itensDeclaracaoConteudo', FJSONArray);
end;

constructor TConteudoDTO<T>.Create;
begin
  raise Exception.Create('Para obter uma instancia, utiliza a função New');
end;

constructor TConteudoDTO<T>.CreatePrivate(Parent: T; JSON: TJsonObject);
begin
  inherited Create;
  FParent := Parent;
  FJSONParent := JSON;
  FJson := TJsonObject.Create;
  FJSONArray := TJSONArray.Create;
end;

destructor TConteudoDTO<T>.Destroy;
begin

  inherited;
end;

class function TConteudoDTO<T>.New(Parent: T; JSON: TJsonObject)
  : iConteudoDTO<T>;
begin
  result := Self.CreatePrivate(Parent, JSON);
end;

function TConteudoDTO<T>.Next: iConteudoDTO<T>;
begin
  Result := Self;
  FJSONArray.AddElement(FJSON);
  FJSON := TJSONObject.Create;
end;

function TConteudoDTO<T>.Peso(const Value: string): iConteudoDTO<T>;
begin
  Result := Self;
  FJson.AddPair('peso', Value);
end;

function TConteudoDTO<T>.Quantidade(const Value: string): iConteudoDTO<T>;
begin
  Result := Self;
  FJson.AddPair('quantidade', Value);
end;

function TConteudoDTO<T>.Valor(const Value: string): iConteudoDTO<T>;
begin
  Result := Self;
  FJson.AddPair('valor', Value);
end;

end.
