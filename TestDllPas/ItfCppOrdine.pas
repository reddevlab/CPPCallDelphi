unit ItfCppOrdine;

interface

type
    { *---------------------------------------------------------------
      Interfaccia per reperire i dati di riga
      Conversione dall'interfaccia originale in Cpp

      @Author: Roberto Carrer
      @Date: 28/04/2019
      ----------------------------------------------------------------* }
    ICppRiga = interface
        function GetCodice(): PWideChar; stdcall;
        function GetDescrizione(): PWideChar; stdcall;
        function GetQta(): Integer; stdcall;
    end;


    { *---------------------------------------------------------------
      Interfaccia per reperire le righe dell'ordine

      @Author: Roberto Carrer
      @Date: 28/04/2019
      ----------------------------------------------------------------* }

    ICppOrdine = interface
        function GetNumeroOrdine(): integer; stdcall;
        function ContaRighe(): integer; stdcall;
        function GetRiga(const index: integer): { ICppRiga } Pointer; stdcall;
    end;


implementation

end.
