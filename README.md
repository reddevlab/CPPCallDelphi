# CPPCallDelphi
Load Delphi XE6 dll from C++ XE10.2 Application

Progetto di esempio per testare il caricamento e l'utilizzo di una dll sviluppata con Embarcadero Delphi XE6 da un applicativo sviluppato con Embarcadero C++ 10.3

## Progetti
Il progetto si compone di 2 sotto progetti suddivisi nelle rispettive cartelle

### TestDllPas
Progetto con i sorgenti della dll.
La dll espone la funzione 'get_instanceByName' per permettere il caricamento delle interfacce necessarie.

### TestAppCpp
Progetto con i sorgenti dell'applicativo che dovrà caricare ed utilizzare le funzioni esposte dalla dll in Delphi.

## Interfaccia 

L'interfaccia comune tra i due progetti si compone di due parti.

### ICppOrdine

Classe principale per la gestione dell'ordine

``` c++
struct ICppOrdine : IUnknown
{
    virtual int __stdcall GetNumeroOrdine() = 0;
    virtual int __stdcall ContaRighe() = 0;
    virtual ICppRiga* __stdcall GetRiga(int index) = 0;
};

```



### ICppRiga

Classe che rappresenta una riga ordine.

``` c++
struct ICppRiga : IUnknown
{
    virtual wchar_t* __stdcall GetCodice() = 0;
    virtual wchar_t* __stdcall GetDescrizione() = 0;
    virtual int __stdcall GetQta() = 0;
};
```



## Caricamento della dll

Per poter caricare la dll e utilizzare le sue interfacce la dll in Delphi deve esporre la seguente funzione.

``` c++

typedef HRESULT(__stdcall* t_giCppOrdine)(const char* name, void** I);

```

Che verrà così implementata in Delphi

``` pascal
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
```

