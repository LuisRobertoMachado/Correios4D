unit Correios4D.Model.DTO.prepostagem.Rotulo;

interface

uses
  System.SysUtils,
  Correios4D.Model.Interfaces,
  Correios4D.Model.DTO.prepostagem.utils.types, System.JSON;

type
  TPrepostagemRotuloDTO = class(TInterfacedObject, iPrepostagemRotuloDTO)
  private
    [weak]
    FParent: iEntity;
    FJSON: TJSONObject;
    constructor CreatePrivate(Parent: iEntity);
  public
    constructor Create;
    destructor Destroy; override;
    class function New(Parent: iEntity): iPrepostagemRotuloDTO;
    function CodigosObjetos(AValue: TArray<string>): iPrepostagemRotuloDTO;
    function IdCorreios(AValue: string): iPrepostagemRotuloDTO;
    function NumeroCartaoPostagem(AValue: string): iPrepostagemRotuloDTO;
    function TipoRotulo(ATipo: TTipoRotulo): iPrepostagemRotuloDTO;
    function FormatoRotulo(AFormato: TFormatoRotulo): iPrepostagemRotuloDTO;
    function ImprimeRemetente(AImprimir: boolean): iPrepostagemRotuloDTO;
    function Layout(ALayout: TLayoutRotulo): iPrepostagemRotuloDTO;
    function &End: iEntity;
  end;

implementation

{ TPrepostagemRotuloDTO }

function TPrepostagemRotuloDTO.&End: iEntity;
begin
  Result := FParent.Content(FJSON.ToString);
end;

function TPrepostagemRotuloDTO.CodigosObjetos(
  AValue: TArray<string>): iPrepostagemRotuloDTO;
var
  LJsonArray: TJSONArray;
begin
  Result := Self;
  LJsonArray := TJSONArray.Create;
  try
    for var Codigo in AValue do
      LJsonArray.Add(Codigo);

    FJSON.AddPair('codigosObjeto', LJsonArray);
  finally
//    LJsonArray.Free;
  end;
end;

constructor TPrepostagemRotuloDTO.Create;
begin
  raise Exception.Create('Para obter uma instancia, utiliza a função New');
end;

constructor TPrepostagemRotuloDTO.CreatePrivate(Parent: iEntity);
begin
  inherited Create;
  FParent := Parent;
  FJSON := TJSONObject.Create;
end;

destructor TPrepostagemRotuloDTO.Destroy;
begin
  FJSON.Free;
  inherited;
end;

function TPrepostagemRotuloDTO.FormatoRotulo(
  AFormato: TFormatoRotulo): iPrepostagemRotuloDTO;
begin
  Result := Self;
  FJSON.AddPair('formatoRotulo', AFormato.GetValue);
end;

function TPrepostagemRotuloDTO.IdCorreios(
  AValue: string): iPrepostagemRotuloDTO;
begin
  Result := Self;
  FJSON.AddPair('idCorreios', AValue);
end;

function TPrepostagemRotuloDTO.ImprimeRemetente(
  AImprimir: boolean): iPrepostagemRotuloDTO;
var
  LValue: string;
begin
  Result := Self;
  LValue := 'N';
  if AImprimir then
    LValue := 'S';
  FJSON.AddPair('imprimeRemetente',LValue);
end;

function TPrepostagemRotuloDTO.Layout(
  ALayout: TLayoutRotulo): iPrepostagemRotuloDTO;
begin
  Result := Self;
  FJSON.AddPair('layoutImpressao',ALayout.GetValue);
end;

class function TPrepostagemRotuloDTO.New(Parent: iEntity): iPrepostagemRotuloDTO;
begin
  Result := Self.CreatePrivate(Parent);
end;

function TPrepostagemRotuloDTO.NumeroCartaoPostagem(
  AValue: string): iPrepostagemRotuloDTO;
begin
  Result := Self;
  FJSON.AddPair('numeroCartaoPostagem', AValue);
end;

function TPrepostagemRotuloDTO.TipoRotulo(
  ATipo: TTipoRotulo): iPrepostagemRotuloDTO;
begin
  Result := Self;
  FJSON.AddPair('tipoRotulo', ATipo.GetValue);
end;

end.
