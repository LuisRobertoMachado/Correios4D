unit Correios4D.Model.DTO.prepostagem.utils.types;

interface

type
  TFormatoObjeto = (Envelope, Caixa, Pacote, Cilindro, Rolo);

  TFormatoObjetoHelper = record helper for TFormatoObjeto
    function GetValue: string;
  end;

implementation

{ TFormatoObjetoHelper }

function TFormatoObjetoHelper.GetValue: string;
begin
  case Self of
    Envelope: Result := '1';
    Caixa: Result := '2';
    Pacote: Result := '2';
    Cilindro: Result := '3';
    Rolo: Result := '3';
  end;
end;

end.
