unit Correios4D.Model.Entitys;

interface

uses
  System.SysUtils,
  Correios4D.Model.DTO.prepostagem, Correios4D.Types;

type
  TEntity = class
  private
    FPrepostagem: TPrepostagemDTO<TEntity>;
  public
    constructor Create;
    destructor Destroy; override;
    function Prepostagem: TPrepostagemDTO<TEntity>;
    function Content(Api: TApiType): String;
  end;

implementation

uses
  System.JSON,
  REST.JSON;

{ TEntity }

function TEntity.Content(Api: TApiType): String;
begin
  case ord(Api) of
//    TOKEN: ;
//    PRECO: ;
    2:   Result := TJSON.ObjectToJsonString(Fprepostagem);
//    PRAZO: ;
  end;
end;

constructor TEntity.Create;
begin

end;

destructor TEntity.Destroy;
begin
  FPrepostagem.Free;
  inherited;
end;

function TEntity.Prepostagem: TPrepostagemDTO<TEntity>;
begin
  if not Assigned(FPrepostagem) then
    FPrepostagem := TPrepostagemDTO<TEntity>.Create(Self);
  Result := FPrepostagem;
end;

end.
