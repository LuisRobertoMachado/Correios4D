unit Correios4D.Model.Interfaces;

interface

uses
  Correios4D.Model.DTO.prepostagem.utils.types;

type
  iEntity = interface;

  iEnderecoDTO<T: IInterface> = interface
    ['{A7F6D3B5-2F6A-4E0C-9E6F-D3B7E4C4ABCD}']
    function Logradouro(const Value: string): iEnderecoDTO<T>;
    function Numero(const Value: string): iEnderecoDTO<T>;
    function Bairro(const Value: string): iEnderecoDTO<T>;
    function Cidade(const Value: string): iEnderecoDTO<T>;
    function Estado(const Value: string): iEnderecoDTO<T>;
    function Pais(const Value: string): iEnderecoDTO<T>;
    function Cep(const Value: string): iEnderecoDTO<T>;
    function &End: T;
  end;

  iDestinatarioDTO<T: IInterface> = interface
    ['{B6C4A2A9-7E6B-4D8B-8F5C-C3A9D1E4BCFA}']
    function Nome(AValue: string): iDestinatarioDTO<T>;
    function DDDTelefone(AValue: string): iDestinatarioDTO<T>;
    function DDITelefone(AValue: string): iDestinatarioDTO<T>;
    function Telefone(AValue: string): iDestinatarioDTO<T>;
    function DDDCelular(AValue: string): iDestinatarioDTO<T>;
    function DDICelular(AValue: string): iDestinatarioDTO<T>;
    function Celular(AValue: string): iDestinatarioDTO<T>;
    function Email(AValue: string): iDestinatarioDTO<T>;
    function CpfCnpj(AValue: string): iDestinatarioDTO<T>;
    function DocumentoEstrangeiro(AValue: string): iDestinatarioDTO<T>;
    function Observacao(AValue: string): iDestinatarioDTO<T>;
    function Endereco: iEnderecoDTO<iDestinatarioDTO<T>>;
    function &End: T;
  end;

  iRemetenteDTO<T: IInterface> = interface
    ['{B6C4A2A9-7E6B-4D8B-8F5C-C3A9D1E4BCFA}']
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

  iPrepostagemDTO = interface
    ['{E7A2C2D5-5C48-4A5A-B9A4-1A9F3C7BBF6E}']
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
    // function ServicoAdicional: iServicoAdicional<iPrepostagemDTO>;
    function Remetente: iRemetenteDTO<iPrepostagemDTO>;
    function Destinatario: iDestinatarioDTO<iPrepostagemDTO>;
    function &End: iEntity;
  end;

  iPrepostagemRotuloDTO = interface
  ['{514F2B43-CA78-4BB4-A511-37B876C1A91F}']
    function CodigosObjetos(AValue: TArray<string>): iPrepostagemRotuloDTO;
    function IdCorreios(AValue: string): iPrepostagemRotuloDTO;
    function NumeroCartaoPostagem(AValue: string): iPrepostagemRotuloDTO;
    function TipoRotulo(ATipo: TTipoRotulo): iPrepostagemRotuloDTO;
    function FormatoRotulo(AFormato: TFormatoRotulo): iPrepostagemRotuloDTO;
    function ImprimeRemetente(AImprimir: boolean): iPrepostagemRotuloDTO;
    function Layout(ALayout: TLayoutRotulo): iPrepostagemRotuloDTO;
    function &End: iEntity;
  end;

  iEntity = interface
  ['{3D49DB25-DFEB-4C0D-AB9B-1D7F0610DC6A}']
    function PrepostagemRotulo: iPrepostagemRotuloDTO;
    function Prepostagem: iPrepostagemDTO;
    function Content(Value : String) : iEntity; overload;
    function Content : String; overload;
  end;

implementation

end.
