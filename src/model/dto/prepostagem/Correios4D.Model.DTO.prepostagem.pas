unit Correios4D.Model.DTO.prepostagem;

interface

uses
  System.SysUtils,
  Correios4D.Model.Interfaces,
  Correios4D.Model.DTO.prepostagem.utils.types;

type
  TPrepostagemDTO = class(TInterfacedObject, iPrepostagemDTO)
  private
    constructor CreatePrivate;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iPrepostagemDTO;
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
//    function DeclaracaoConteudo: iDeclaracaoConteudo<iPrepostagemDTO>;
//    function ServicoAdicional: iServicoAdicional<iPrepostagemDTO>;
    function Remetente: iRemetenteDTO<iPrepostagemDTO>;
//    function Destinatario: iDestinatarioDTO<iPrepostagemDTO>;
    function &End: iEntity;
  end;

implementation

{ TPrepostagemDTO }

function TPrepostagemDTO.AlturaInformada(AValue: string): iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.ChaveNFe(AValue: string): iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.CienteObjetoNaoProibido(AValue: string)
  : iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.CodigoObjeto(AValue: string): iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.CodigoServico(AValue: string): iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.ComprimentoInformado(AValue: string)
  : iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.&End: iEntity;
begin

end;

constructor TPrepostagemDTO.Create;
begin
  raise Exception.Create('Para obter uma instancia, utiliza a função New');
end;

constructor TPrepostagemDTO.CreatePrivate;
begin
  inherited Create;
end;

function TPrepostagemDTO.DataPrevistaPostagem(AValue: string)
  : iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.DataValidadeLogReversa(AValue: string)
  : iPrepostagemDTO;
begin

end;

destructor TPrepostagemDTO.Destroy;
begin

  inherited;
end;

function TPrepostagemDTO.DiametroInformado(AValue: string): iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.FormatoObjeto(AValue: TFormatoObjeto)
  : iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.IdAtendimento(AValue: string): iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.IdCorreios(AValue: string): iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.LarguraInformada(AValue: string): iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.LogisticaReversa(AValue: string): iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.ModalidadePagamento(AValue: string)
  : iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.NcmObjeto(AValue: string): iPrepostagemDTO;
begin

end;

class function TPrepostagemDTO.New: iPrepostagemDTO;
begin
  result := Self.CreatePrivate;
end;

function TPrepostagemDTO.NumeroCartaoPostagem(AValue: string)
  : iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.NumeroNotaFiscal(AValue: string): iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.Observacao(AValue: string): iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.PesoInformado(AValue: string): iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.PrecoPostagem(AValue: string): iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.PrecoServico(AValue: string): iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.Remetente: iRemetenteDTO<iPrepostagemDTO>;
begin

end;

function TPrepostagemDTO.RFIDObjeto(AValue: string): iPrepostagemDTO;
begin

end;

function TPrepostagemDTO.SolicitarColeta(AValue: string): iPrepostagemDTO;
begin

end;

end. .
