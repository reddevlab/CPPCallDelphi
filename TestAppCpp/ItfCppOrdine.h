/* ---------------------------------------------------------------
 Interfaccia per reperire i dati di riga

 @Author: Roberto Carrer
 @Date: 28/04/2019
 ---------------------------------------------------------------- */
struct ICppRiga : IUnknown
{
    virtual UnicodeString __stdcall GetCodice() = 0;
    virtual UnicodeString __stdcall GetDescrizione() = 0;
};

/* ---------------------------------------------------------------
 Interfaccia per reperire le righe dell'ordine

 @Author: Roberto Carrer
 @Date: 28/04/2019
 ---------------------------------------------------------------- */

struct ICppOrdine : IUnknown
{
    virtual int __stdcall GetNumeroOrdine() = 0;
    virtual int __stdcall ContaRighe() = 0;
    virtual ICppRiga* __stdcall GetRiga(int index) = 0;
};

/* ---------------------------------------------------------------
 Funzione per caricare l'interfaccia della dll
 ---------------------------------------------------------------- */

typedef HRESULT(__stdcall* t_giCppOrdine)(const char* name, void** I);
