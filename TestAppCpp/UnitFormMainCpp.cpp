// ---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UnitFormMainCpp.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormMain *FormMain;

// ---------------------------------------------------------------------------
__fastcall TFormMain::TFormMain(TComponent* Owner) : TForm(Owner)
{
    m_cppOrd = NULL;
    MmInfo->Lines->Clear();
}
// ---------------------------------------------------------------------------

void __fastcall TFormMain::BtCaricaDllClick(TObject *Sender)
{
    HINSTANCE hdllgest = LoadLibrary(L"TestDllInterface.dll");
    if (!hdllgest)
    {
        MmInfo->Lines->Add("Impossibile caricare la dll");
        return;
    }
    else
    {
        MmInfo->Lines->Add("Dll caricata con successo");
    }

    t_giCppOrdine fgi = (t_giCppOrdine)GetProcAddress(hdllgest, "get_InstanceByName");
    if (!fgi)
    {
        MmInfo->Lines->Add("Impossibile trovare get_InstanceByName");
        return;
    }
    else
    {
        MmInfo->Lines->Add("Get_InstanceByName trovata");
    }

    fgi("ICppOrdine", (void**)&m_cppOrd);
    if (!m_cppOrd)
    {
        MmInfo->Lines->Add("Impossibile caricare l'interfaccia ICppOrdine");
        return;
    }
    else
    {
        MmInfo->Lines->Add("Interfaccia caricata correttamente");
    }

}
// ---------------------------------------------------------------------------
