unit UnitExp;

interface

function get_InstanceByName( { [in] } const name: PAnsiChar; { [out] } var I: Pointer): HRESULT; stdcall;

implementation

uses
    UnitMainDll, ItfCppOrdine, Windows;

function get_InstanceByName( { [in] } const name: PAnsiChar; { [out] } var I: Pointer): HRESULT; stdcall;
begin
    I := NIL;
    if String(name) = 'ICppOrdine' then
        I := Pointer(ICppOrdine(GetItfCppOrdine()));
    if (I = NIL) then
        Result := E_FAIL
    else
        Result := S_OK;
end;

end.
