unit Correios4D.Attributes;

interface

uses
  System.Rtti,
  System.TypInfo,
  System.SysUtils;

type
  NotNullAttribute = class(TCustomAttribute)
  end;

  TStringConstraintAttribute = class(TCustomAttribute)
  private
    FMinLength: Integer;
    FMaxLength: Integer;
    FAllowEmpty: Boolean;
  public
    constructor Create(AMinLength, AMaxLength: Integer; AAllowEmpty: Boolean = True);
    property MinLength: Integer read FMinLength;
    property MaxLength: Integer read FMaxLength;
    property AllowEmpty: Boolean read FAllowEmpty;
  end;

function Validar(Obj: TObject): Boolean;

implementation

function GetRttiObjFromInterface(AIntf: IInterface): TObject;
begin

  Result := AIntf as TObject;
end;

function ValidarField(Obj: TObject; Field: TRttiField): boolean;
var
  Value: TValue;
  Attr: TCustomAttribute;
  LIntfObj: TObject;
begin
  Result := True;
  Value := Field.GetValue(Obj);
  for Attr in Field.GetAttributes do
  begin
    if Attr is WeakAttribute then
      Exit;;
    if Attr is NotNullAttribute then
    begin
      if Value.IsEmpty or (Value.Kind = tkString) and (Value.AsString = '') then
      begin
        Writeln(Format('O campo %s não pode ser nulo ou vazio.', [Field.Name]));
        Result := False;
      end;
    end;
      // Validação de restrições de comprimento (TStringConstraintAttribute)
    if Attr is TStringConstraintAttribute then
    begin
      var StrConstraint := TStringConstraintAttribute(Attr);

      if Value.Kind = tkString then
      begin
        var FieldStr: string := Value.AsString;

        // Validação do comprimento ou vazio
        if (FieldStr.IsEmpty and not StrConstraint.AllowEmpty) or
           ((Length(FieldStr) < StrConstraint.MinLength) or
            (Length(FieldStr) > StrConstraint.MaxLength)) then
        begin
          Result := False;
          Writeln(Format
            ('O campo %s excede o tamanho permitido de caracteres: Min: %d / Max: %d',
            [Field.Name, StrConstraint.MinLength, StrConstraint.MaxLength]));
          Exit; // Falha na validação de comprimento
        end;
      end;
    end;
  end;
  if value.Kind = tkInterface then
  begin
    Validar(GetRttiObjFromInterface(value.AsInterface));
  end
  else if Value.Kind = tkClass then
  begin
    if Value.AsObject <> nil then
      Validar(Value.AsObject); // chamada recursiva para o objeto aninhado
  end;
end;

function Validar(Obj: TObject): Boolean;
var
  Ctx: TRttiContext;
  RttiType: TRttiType;
  Field: TRttiField;
begin
  Result := True;
  if Obj = nil then
    exit;
  RttiType := Ctx.GetType(Obj.ClassType);
  for Field in RttiType.GetFields do
  begin
    Result := ValidarField(Obj,Field);
  end;
end;

{ TStringConstraintAttribute }

constructor TStringConstraintAttribute.Create(AMinLength, AMaxLength: Integer;
  AAllowEmpty: Boolean);
begin
  FMinLength := AMinLength;
  FMaxLength := AMaxLength;
  FAllowEmpty := AAllowEmpty;
end;

end.
