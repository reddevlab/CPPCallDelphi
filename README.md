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


