unit Correios4D.Model.DTO.prepostagem;

interface

uses
  System.SysUtils,
  Correios4D.Model.Interfaces,
  Correios4D.Model.DTO.prepostagem.utils.types,
  System.JSON;

type
  TPrepostagemDTO = class(TInterfacedObject, iPrepostagemDTO)
  private
    [weak]
    FParent: iEntity;
    FJSON: TJSONObject;
    constructor CreatePrivate(Parent: iEntity);
  public
    constructor Create;
    destructor Destroy; override;
    class function New(Parent: iEntity): iPrepostagemDTO;
    function IdCorreios(AValue: string): iPrepostagemDTO;
    function CodigoServico(AValue: string): iPrepostagemDTO;
    function PrecoServico(AValue: string): iPrepostagemDTO;
    function PrecoPostagem(AValue: string): iPrepostagemDTO;
    function NumeroNotaFiscal(AValue: string): iPrepostagemDTO;
    function NumeroCartaoPostagem(AValue: string): iPrepostagemDTO;
    function ChaveNFe(AValue: string): iPrepostagemDTO;
    function PesoInformado(AValue: string): iPrepostagemDTO;
    function FormatoObjeto(AValue: TFormatoObjeto): iPrepostagemDTO;
    function AlturaInformada(AValue: string): iPrepostagemDTO;
    function LarguraInformada(AValue: string): iPrepostagemDTO;
    function ComprimentoInformado(AValue: string): iPrepostagemDTO;
    function DiametroInformado(AValue: string): iPrepostagemDTO;
    function NcmObjeto(AValue: string): iPrepostagemDTO;
    function RFIDObjeto(AValue: string): iPrepostagemDTO;
    function CienteObjetoNaoProibido(AValue: string): iPrepostagemDTO;
    function IdAtendimento(AValue: string): iPrepostagemDTO;
    function SolicitarColeta(AValue: string): iPrepostagemDTO;
    function CodigoObjeto(AValue: string): iPrepostagemDTO;
    function DataPrevistaPostagem(AValue: string): iPrepostagemDTO;
    function Observacao(AValue: string): iPrepostagemDTO;
    function ModalidadePagamento(AValue: string): iPrepostagemDTO;
    function LogisticaReversa(AValue: string): iPrepostagemDTO;
    function DataValidadeLogReversa(AValue: string): iPrepostagemDTO;
    // function DeclaracaoConteudo: iDeclaracaoConteudo<iPrepostagemDTO>;
    function ServicoAdicional: iServicoAdicionalDTO<iPrepostagemDTO>;
    function Remetente: iRemetenteDTO<iPrepostagemDTO>;
    function Destinatario: iDestinatarioDTO<iPrepostagemDTO>;
    function &End: iEntity;
  end;

implementation

uses
  Correios4D.Model.DTO.prepostagem.Remetente,
  Correios4D.Model.DTO.prepostagem.Destinatario,
  Correios4D.Model.DTO.prepostagem.ServicoAdicional;

{ TPrepostagemDTO }

function TPrepostagemDTO.AlturaInformada(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('alturaInformada',AValue );
end;

function TPrepostagemDTO.ChaveNFe(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('chaveNFe',AValue);
end;

function TPrepostagemDTO.CienteObjetoNaoProibido(AValue: string)
  : iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('cienteObjetoNaoProibido', AValue);
end;

function TPrepostagemDTO.CodigoObjeto(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('codigoObjeto', AValue);
end;

function TPrepostagemDTO.CodigoServico(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('codigoServico', AValue);
end;

function TPrepostagemDTO.ComprimentoInformado(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('comprimentoInformado', AValue);
end;

function TPrepostagemDTO.&End: iEntity;
begin
  Result := FParent.Content(FJSON.ToString);
end;

constructor TPrepostagemDTO.Create;
begin
  raise Exception.Create('Para obter uma instancia, utiliza a função New');
end;

constructor TPrepostagemDTO.CreatePrivate(Parent: iEntity);
begin
  inherited Create;
  FParent := Parent;
  FJSON := TJSONObject.Create;
end;

function TPrepostagemDTO.DataPrevistaPostagem(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('dataPrevistaPostagem',AValue);
end;

function TPrepostagemDTO.DataValidadeLogReversa(AValue: string)
  : iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('dataValidadeLogReversa',AValue);
end;

function TPrepostagemDTO.Destinatario: iDestinatarioDTO<iPrepostagemDTO>;
begin
  Result := TDestinatarioDTO<iPrepostagemDTO>.New(Self, FJSON);
end;

destructor TPrepostagemDTO.Destroy;
begin
  FJSON.Free;
  inherited;
end;

function TPrepostagemDTO.DiametroInformado(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('diametroInformado', AValue);
end;

function TPrepostagemDTO.FormatoObjeto(AValue: TFormatoObjeto): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('codigoFormatoObjetoInformado',avalue.GetValue);
end;

function TPrepostagemDTO.IdAtendimento(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('idAtendimento', AValue);
end;

function TPrepostagemDTO.IdCorreios(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('idCorreios', AValue);
end;

function TPrepostagemDTO.LarguraInformada(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('larguraInformada', AValue);
end;

function TPrepostagemDTO.LogisticaReversa(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('logisticaReversa', AValue);
end;

function TPrepostagemDTO.ModalidadePagamento(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('modalidadePagamento',AValue );
end;

function TPrepostagemDTO.NcmObjeto(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('ncmObjeto', AValue);
end;

class function TPrepostagemDTO.New(Parent: iEntity): iPrepostagemDTO;
begin
  Result := Self.CreatePrivate(Parent);
end;

function TPrepostagemDTO.NumeroCartaoPostagem(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('numeroCartaoPostagem', AValue);
end;

function TPrepostagemDTO.NumeroNotaFiscal(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('numeroNotaFiscal', AValue);
end;

function TPrepostagemDTO.Observacao(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('observacao', AValue);
end;

function TPrepostagemDTO.PesoInformado(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('pesoInformado', AValue);
end;

function TPrepostagemDTO.PrecoPostagem(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('precoPrePostagem', AValue);
end;

function TPrepostagemDTO.PrecoServico(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('precoServico', AValue);
end;

function TPrepostagemDTO.Remetente: iRemetenteDTO<iPrepostagemDTO>;
begin
  Result := TRemetenteDTO<iPrepostagemDTO>.New(Self, FJSON);
end;

function TPrepostagemDTO.RFIDObjeto(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('rfidObjeto', AValue);
end;

function TPrepostagemDTO.ServicoAdicional: iServicoAdicionalDTO<iPrepostagemDTO>;
begin
  Result := TServicoAdicionalDTO<iPrepostagemDTO>.New(Self,FJSON);
end;

function TPrepostagemDTO.SolicitarColeta(AValue: string): iPrepostagemDTO;
begin
  Result := Self;
  FJSON.AddPair('solicitarColeta', AValue);
end;

end. .
