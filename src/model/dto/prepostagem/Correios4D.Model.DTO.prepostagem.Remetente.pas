unit Correios4D.Model.DTO.prepostagem.Remetente;

interface

uses
  System.SysUtils,
  System.JSON,
  System.JSON.Types,
  System.Generics.Collections,
  Correios4D.Model.Interfaces;

type
  TRemetenteDTO<T: IInterface> = class(TInterfacedObject, iRemetenteDTO<T>)
  private
    constructor CreatePrivate(Parent: T; JSON: TJSONObject);
  public
    constructor Create;
    destructor Destroy; override;
    class function New(Parent: T; JSON: TJSONObject): iRemetenteDTO<T>;
    function Nome(AValue: string): iRemetenteDTO<T>;
    function DDDTelefone(AValue: string): iRemetenteDTO<T>;
    function Telefone(AValue: string): iRemetenteDTO<T>;
    function DDDCelular(AValue: string): iRemetenteDTO<T>;
    function Celular(AValue: string): iRemetenteDTO<T>;
    function Email(AValue: string): iRemetenteDTO<T>;
    function CpfCnpj(AValue: string): iRemetenteDTO<T>;
    function DocumentoEstrangeiro(AValue: string): iRemetenteDTO<T>;
    function Observacao(AValue: string): iRemetenteDTO<T>;
    function Endereco: iEnderecoDTO<iRemetenteDTO<T>>;
    function &End: T;
  end;

implementation

{ TRemetenteDTO<T> }

function TRemetenteDTO<T>.Celular(AValue: string): iRemetenteDTO<T>;
begin

end;

function TRemetenteDTO<T>.CpfCnpj(AValue: string): iRemetenteDTO<T>;
begin

end;

function TRemetenteDTO<T>.&End: T;
begin

end;

constructor TRemetenteDTO<T>.Create;
begin
  raise Exception.Create('Para obter uma instancia, utiliza a função New');
end;

constructor TRemetenteDTO<T>.CreatePrivate(Parent: T; JSON: TJSONObject);
begin
  inherited Create;
end;

function TRemetenteDTO<T>.DDDCelular(AValue: string): iRemetenteDTO<T>;
begin

end;

function TRemetenteDTO<T>.DDDTelefone(AValue: string): iRemetenteDTO<T>;
begin

end;

destructor TRemetenteDTO<T>.Destroy;
begin

  inherited;
end;

function TRemetenteDTO<T>.DocumentoEstrangeiro(
  AValue: string): iRemetenteDTO<T>;
begin

end;

function TRemetenteDTO<T>.Email(AValue: string): iRemetenteDTO<T>;
begin

end;

function TRemetenteDTO<T>.Endereco: iEnderecoDTO<iRemetenteDTO<T>>;
begin

end;

class function TRemetenteDTO<T>.New(Parent: T; JSON: TJSONObject)
  : iRemetenteDTO<T>;
begin
  result := Self.CreatePrivate(Parent, JSON);
end;

function TRemetenteDTO<T>.Nome(AValue: string): iRemetenteDTO<T>;
begin

end;

function TRemetenteDTO<T>.Observacao(AValue: string): iRemetenteDTO<T>;
begin

end;

function TRemetenteDTO<T>.Telefone(AValue: string): iRemetenteDTO<T>;
begin

end;

end.
