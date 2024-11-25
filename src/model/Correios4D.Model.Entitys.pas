unit Correios4D.Model.Entitys;

interface

uses
  System.SysUtils, Correios4D.Model.Interfaces;

type
  TEntity = class(TInterfacedObject, iEntity)
  private
    FContent: String;
    constructor CreatePrivate;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iEntity;
    function Prepostagem: iPrepostagemDTO;
    function PrepostagemRotulo: iPrepostagemRotuloDTO;
    function Content(Value: String): iEntity; overload;
    function Content: String; overload;
  end;

implementation

uses
  Correios4D.Model.DTO.prepostagem, Correios4D.Model.DTO.prepostagem.Rotulo;

{ TEntity }

function TEntity.Content(Value: String): iEntity;
begin
  Result := Self;
  FContent := Value;
end;

function TEntity.Content: String;
begin
  Result := FContent;
end;

constructor TEntity.Create;
begin
  raise Exception.Create('Para obter uma instancia, utiliza a função New');
end;

constructor TEntity.CreatePrivate;
begin
  inherited Create;
end;

destructor TEntity.Destroy;
begin

  inherited;
end;

class function TEntity.New: iEntity;
begin
  result := Self.CreatePrivate;
end;

function TEntity.Prepostagem: iPrepostagemDTO;
begin
  Result := TPrepostagemDTO.new(Self);
end;

function TEntity.PrepostagemRotulo: iPrepostagemRotuloDTO;
begin
  Result := TPrepostagemRotuloDTO.new(Self);
end;

end.
