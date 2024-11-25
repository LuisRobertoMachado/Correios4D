unit Correios4D.Model.DTO.prepostagem.utils.types;

interface

type
  TFormatoObjeto = (Envelope, Caixa, Pacote, Cilindro, Rolo);

  TFormatoRotulo = (RotEtiqueta, RotEnvelope);

  TTipoRotulo = (tpRotPadrao, tpRotReduzido);

  TLayoutRotulo = (LayoutPadrao, LayoutLinear10_15, LayoutLinear10_8,
    LayoutLinearA4, LayoutLinearA);

  TLayoutRotuloHelper = record helper for TLayoutRotulo
    function GetValue: string;
  end;

  TTipoRotuloHelper = record helper for TTipoRotulo
    function GetValue: string;
  end;

  TFormatoRotuloHelper = record helper for TFormatoRotulo
    function GetValue: string;
  end;

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

{ TFormatoRotuloHelper }

function TFormatoRotuloHelper.GetValue: string;
begin
  case self of
    RotEtiqueta: Result := 'ET';
    RotEnvelope: Result := 'EV';
  end;
end;

{ TTipoRotuloHelper }

function TTipoRotuloHelper.GetValue: string;
begin
 case self  of
   tpRotPadrao: Result := 'P';
   tpRotReduzido: Result := 'R';
 end;
end;

{ TLayoutRotuloHelper }

function TLayoutRotuloHelper.GetValue: string;
begin
  case self of
    LayoutPadrao: result := 'PADRAO';
    LayoutLinear10_15: result := 'LINEAR_100_150';
    LayoutLinear10_8: result := 'LINEAR_100_80';
    LayoutLinearA4: result := 'LINEAR_A4';
    LayoutLinearA: result := 'LINEAR_A';
  end;
end;

end.
