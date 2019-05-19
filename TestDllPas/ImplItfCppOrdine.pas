unit ImplItfCppOrdine;

{ *---------------------------------------------------------------
  Unit con le implementazioni delle interfaccie

  @Author: Roberto Carrer
  @Date: 28/04/2019
  ----------------------------------------------------------------* }


interface

uses ItfCppOrdine, classes;

type

    { *---------------------------------------------------------------
      Implementazione interfaccia per la riga ordine

      @Author: Roberto Carrer
      @Date: 28/04/2019
      ----------------------------------------------------------------* }

    TImplCppRiga = class(TObject, ICppRiga)
    public
        function GetCodice: PWideChar; stdcall;
        function GetDescrizione: PWideChar; stdcall;
        function GetQta(): Integer; stdcall;
    protected
        // Property per i test
        m_cod: AnsiString;
        m_des: AnsiString;
        m_qta: Integer;

        m_refCount: Integer;
        constructor Create(const codice: AnsiString; const descrizione: AnsiString);
        function generaQta(): Integer;
        function QueryInterface(const IID: TGUID; out Obj): HRESULT; stdcall;
        function _AddRef: Integer; stdcall;
        function _Release: Integer; stdcall;

    end;


    { *---------------------------------------------------------------
      Implementazione interfaccia con i dati di testata ordine e relative righe

      @Author: Roberto Carrer
      @Date: 28/04/2019
      ----------------------------------------------------------------* }

    TImplCppOrdine = class(TObject, ICppOrdine)
    public
        m_cppRiga: TImplCppRiga;

        function GetNumeroOrdine: Integer; stdcall;
        function GetRiga(const index: Integer): { ICppRiga } Pointer; stdcall;
        function ContaRighe(): Integer; stdcall;

        constructor Create();
        destructor Destroy(); override;
    protected
        // Property private di mockup per i test
        m_numeroOrdine: Integer;
        m_lstRighe: TList;

        m_refCount: Integer;
        procedure creaDatiMockup();

        function QueryInterface(const IID: TGUID; out Obj): HRESULT; stdcall;
        function _AddRef: Integer; stdcall;
        function _Release: Integer; stdcall;

    end;

implementation

{ TImplCppOrdine }

function TImplCppOrdine.ContaRighe: Integer;
begin
    result := m_lstRighe.Count;
end;

procedure TImplCppOrdine.creaDatiMockup;
var
    rg: TImplCppRiga;
begin
    // Preparo un numero ordine finto
    m_numeroOrdine := 20190428;

    // Creo delle righe fittizzie
    rg := TImplCppRiga.Create('Art01', 'Articolo riga 1');
    m_lstRighe.Add(rg);
    rg := TImplCppRiga.Create('Art02', 'Articolo riga21');
    m_lstRighe.Add(rg);
    rg := TImplCppRiga.Create('Art03', 'Articolo riga 3');
    m_lstRighe.Add(rg);
end;

constructor TImplCppOrdine.Create();
begin
    inherited;
    m_cppRiga := nil;
    m_lstRighe := TList.Create();

    // Solo per i test
    creaDatiMockup();
end;

destructor TImplCppOrdine.Destroy;
var
    kk: Integer;
begin
    for kk := 0 to m_lstRighe.Count - 1 do
    begin
        TImplCppRiga(m_lstRighe.Items[kk]).free;
    end;
    m_lstRighe.Clear;
end;

function TImplCppOrdine.GetNumeroOrdine: Integer;
begin
    result := m_numeroOrdine;
end;

function TImplCppOrdine.GetRiga(const index: Integer): { ICppRiga } Pointer;
var
    rg: TImplCppRiga;
begin
    result := nil;
    if index <= m_lstRighe.Count then
    begin
        // ritorno la struttura cercata
        rg := m_lstRighe.Items[index];
        result := Pointer(ICppRiga(rg));
    end;
end;

function TImplCppOrdine.QueryInterface(const IID: TGUID; out Obj): HRESULT;
begin
    Pointer(Obj) := self;
    result := S_OK;
end;

function TImplCppOrdine._AddRef: Integer;
begin
    inc(m_refCount);
    result := m_refCount;
end;

function TImplCppOrdine._Release: Integer;
begin
    dec(m_refCount);
    if (m_refCount = 0) then
    begin
        free;
        result := 0;
    end
    else
        result := m_refCount;
end;

{ TImplCppRiga }

constructor TImplCppRiga.Create(const codice, descrizione: AnsiString);
begin
    m_cod := codice;
    m_des := descrizione;
    m_qta := generaQta();
end;

function TImplCppRiga.generaQta: Integer;
begin
    result := Random(5);
    if result = 0 then
        result := 1;
end;

function TImplCppRiga.GetCodice: PWideChar;
var
    buff: array [0 .. 32] of WideChar;
begin
    StringToWideChar(string(m_cod), buff, sizeof(buff));
    result := buff;
end;

function TImplCppRiga.GetDescrizione: PWideChar;
var
    buff: array [0 .. 512] of WideChar;
begin
    StringToWideChar(string(m_des), buff, sizeof(buff));
    result := buff;
end;

function TImplCppRiga.GetQta: Integer;
begin
    result := m_qta;
end;

function TImplCppRiga.QueryInterface(const IID: TGUID; out Obj): HRESULT;
begin
    Pointer(Obj) := self;
    result := S_OK;
end;

function TImplCppRiga._AddRef: Integer;
begin
    inc(m_refCount);
    result := m_refCount;
end;

function TImplCppRiga._Release: Integer;
begin
    dec(m_refCount);
    if (m_refCount = 0) then
    begin
        free;
        result := 0;
    end
    else
        result := m_refCount;
end;

end.
