unit UnitMainDll;

interface

uses ImplItfCppOrdine;

var
    g_TImplCppOrdine: TImplCppOrdine;

function GetItfCppOrdine(): TImplCppOrdine;

implementation

function GetItfCppOrdine(): TImplCppOrdine;
begin
    if g_TImplCppOrdine = nil then
    begin
        g_TImplCppOrdine := TImplCppOrdine.Create();
    end;

    result := g_TImplCppOrdine;
end;


initialization

begin
    g_TImplCppOrdine := nil;
end;


finalization

begin

    g_TImplCppOrdine.Free;
end;

end.

