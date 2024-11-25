unit uPrincipal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Correios4D, Correios4D.Interfaces;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCorreios: iCorreios4D;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Correios4D.Model.Entitys,
  Correios4D.Types,
  Correios4D.Model.Interfaces,
  Correios4D.Model.DTO.prepostagem.utils.Types;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  LEntity: iEntity;
begin
  FCorreios
    .AuthConfig
      .Api(PREPOSTAGEM)
      .ApiVersion(V1)
      .PrepostagemEndPoint(PREPOSTAGENS);

  LEntity :=
    FCorreios
      .Entity
        .PrePostagem
          .CodigoServico('03298')
          .FormatoObjeto(Caixa)
          .Remetente
            .Nome('LUIS')
            .Endereco
              .CEP('94065170')
              .Logradouro('Rua São João Batista')
              .Numero('315')
              .Bairro('Parque Olinda')
              .Cidade('Gravataí')
              .Estado('RS')
              .Pais('BR')
              .&End
            .&end
            .Destinatario
              .Nome('RUSSIMAR')
              .Endereco
                .Logradouro('FLORES DA CUNHA')
                .Numero('3742')
                .Bairro('VILA BOM PRINCIPIO')
                .Cidade('CACHOEIRINHA')
                .Estado('RS')
                .Cep('950001001')
                .&End
              .&end
          .&end;

  with FCorreios.Resources do
  begin
    Body(LEntity);
    Post;
    Memo1.Text := Content;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  FCorreios := TCorreios4D.new;
  FCorreios
    .AuthConfig
      .BaseUrl('https://apihom.correios.com.br')
      .UserName('09597126000160')
      .CodigoAPIs('euKFODbOQiHqbgXHCcf9yLKDA7PJap0XI8JluVWa')
      .CartaoPostagem('0078790859');
end;

end.
