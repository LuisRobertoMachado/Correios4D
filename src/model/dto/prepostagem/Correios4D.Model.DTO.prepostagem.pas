unit Correios4D.Model.DTO.prepostagem;

interface

uses
  System.SysUtils,
  REST.Json.Types,
  Correios4D.Attributes,
  Correios4D.Model.DTO.prepostagem.utils.types,
  Correios4D.Model.DTO.prepostagem.Remetente;

type
  TPrepostagemDTO<T: class> = class
  private
    [weak]
    [JSONMarshalled(False)]
    FParent: T;
    FIdCorreios: string;
    [NotNull]
    FCodigoServico: string;
    FPrecoServico: string;
    FPrecoPostagem: string;
    FNumeroNotaFiscal: string;
    FNumeroCartaoPostagem: string;
    FChaveNFe: string;
    [NotNull]
    FPesoInformado: string;
    [NotNull]
    FFormatoObjeto: TFormatoObjeto;
    FAlturaInformada: string;
    FLarguraInformada: string;
    FComprimentoInformado: string;
    FDiametroInformado: string;
    FNcmObjeto: string;
    FRFIDObjeto: string;
    [NotNull]
    FCienteObjetoNaoProibido: string;
    FIdAtendimento: string;
    FSolicitarColeta: string;
    FCodigoObjeto: string;
    FDataPrevistaPostagem: string;
    FObservacao: string;
    FModalidadePagamento: string;
    FLogisticaReversa: string;
    FDataValidadeLogReversa: string;
    // FDeclaracaoConteudo: iDeclaracaoConteudo<TPrepostagemDTO<T>>;
    // FServicoAdicional: iServicoAdicional<TPrepostagemDTO<T>>;
    [TInterfacedObjectReflectAttribute]
    FRemetente: TRemetenteDTO<TPrepostagemDTO<T>>;
    // [JsonReflect(ctTypeObject, rtObject, TObjectInterceptor)]
    // FDestinatario: TDestinatarioDTO<TPrepostagemDTO<T>>;
  public
    constructor Create(Parent: T);
    destructor Destroy; Override;
    function IdCorreios(AValue: string): TPrepostagemDTO<T>;
    function CodigoServico(AValue: string): TPrepostagemDTO<T>;
    function PrecoServico(AValue: string): TPrepostagemDTO<T>;
    function PrecoPostagem(AValue: string): TPrepostagemDTO<T>;
    function NumeroNotaFiscal(AValue: string): TPrepostagemDTO<T>;
    function NumeroCartaoPostagem(AValue: string): TPrepostagemDTO<T>;
    function ChaveNFe(AValue: string): TPrepostagemDTO<T>;
    function PesoInformado(AValue: string): TPrepostagemDTO<T>;
    function FormatoObjeto(AValue: TFormatoObjeto): TPrepostagemDTO<T>;
    function AlturaInformada(AValue: string): TPrepostagemDTO<T>;
    function LarguraInformada(AValue: string): TPrepostagemDTO<T>;
    function ComprimentoInformado(AValue: string): TPrepostagemDTO<T>;
    function DiametroInformado(AValue: string): TPrepostagemDTO<T>;
    function NcmObjeto(AValue: string): TPrepostagemDTO<T>;
    function RFIDObjeto(AValue: string): TPrepostagemDTO<T>;
    function CienteObjetoNaoProibido(AValue: string): TPrepostagemDTO<T>;
    function IdAtendimento(AValue: string): TPrepostagemDTO<T>;
    function SolicitarColeta(AValue: string): TPrepostagemDTO<T>;
    function CodigoObjeto(AValue: string): TPrepostagemDTO<T>;
    function DataPrevistaPostagem(AValue: string): TPrepostagemDTO<T>;
    function Observacao(AValue: string): TPrepostagemDTO<T>;
    function ModalidadePagamento(AValue: string): TPrepostagemDTO<T>;
    function LogisticaReversa(AValue: string): TPrepostagemDTO<T>;
    function DataValidadeLogReversa(AValue: string): TPrepostagemDTO<T>;
    // function DeclaracaoConteudo: iDeclaracaoConteudo<TPrepostagemDTO<T>>;
    // function ServicoAdicional: iServicoAdicional<TPrepostagemDTO<T>>;
    function Remetente: TRemetenteDTO<TPrepostagemDTO<T>>;
    // function Destinatario: iDestinatarioDTO<TPrepostagemDTO<T>>;
    function &End: T;
  end;

implementation

{ TPrepostagemDTO<T> }

function TPrepostagemDTO<T>.&End: T;
begin
  Result := FParent;
end;

function TPrepostagemDTO<T>.AlturaInformada(AValue: string): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.ChaveNFe(AValue: string): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.CienteObjetoNaoProibido(AValue: string)
  : TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.CodigoObjeto(AValue: string): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.CodigoServico(AValue: string): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.ComprimentoInformado(AValue: string): TPrepostagemDTO<T>;
begin

end;

constructor TPrepostagemDTO<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

function TPrepostagemDTO<T>.DataPrevistaPostagem(AValue: string): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.DataValidadeLogReversa(AValue: string)
  : TPrepostagemDTO<T>;
begin

end;

// function TPrepostagemDTO<T>.Destinatario: iDestinatarioDTO<TPrepostagemDTO<T>>;
// begin
//
// end;

destructor TPrepostagemDTO<T>.Destroy;
begin
  FRemetente.Free;
  inherited;
end;

function TPrepostagemDTO<T>.DiametroInformado(AValue: string): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.FormatoObjeto(AValue: TFormatoObjeto): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.IdAtendimento(AValue: string): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.IdCorreios(AValue: string): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.LarguraInformada(AValue: string): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.LogisticaReversa(AValue: string): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.ModalidadePagamento(AValue: string): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.NcmObjeto(AValue: string): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.NumeroCartaoPostagem(AValue: string): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.NumeroNotaFiscal(AValue: string): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.Observacao(AValue: string): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.PesoInformado(AValue: string): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.PrecoPostagem(AValue: string): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.PrecoServico(AValue: string): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.Remetente: TRemetenteDTO<TPrepostagemDTO<T>>;
begin
  if not assigned(FRemetente) then
    FRemetente := TRemetenteDTO<TPrepostagemDTO<T>>.Create(Self);
  Result := FRemetente;
end;

function TPrepostagemDTO<T>.RFIDObjeto(AValue: string): TPrepostagemDTO<T>;
begin

end;

function TPrepostagemDTO<T>.SolicitarColeta(AValue: string): TPrepostagemDTO<T>;
begin

end;

end.
