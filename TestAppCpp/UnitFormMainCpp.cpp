// ---------------------------------------------------------------------------

#include "StdAfx.h"
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
    HINSTANCE hdllgest = LoadLibrary(L"TestDllPas.dll");
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
void __fastcall TFormMain::BtChiamaItfClick(TObject *Sender)
{
    if (m_cppOrd)
    {
        int numOrdine = m_cppOrd->GetNumeroOrdine();

        MmInfo->Lines->Add(Format("Ordine in gestione: %d ", ARRAYOFCONST((numOrdine))));

        // int tot = m_cppOrd.ContaRighe();
        int totRighe = m_cppOrd->ContaRighe();

        // Controllo quante righe sono presenti
        MmInfo->Lines->Add(Format("Righe nell'ordine: %d ", ARRAYOFCONST((totRighe))));

        ICppRiga *rg;
        for (int kk = 0; kk < totRighe; kk++)
        {
            rg = m_cppOrd->GetRiga(kk);
            if (rg)
            {
                int qta = rg->GetQta();
                wchar_t cod[32], des[255];
                wcscpy(cod, rg->GetCodice());
                wcscpy(des, rg->GetCodice());

                UnicodeString msg = Format("Riga ordine: Codice: %s | Quantità: %d | Descrizione: %s", ARRAYOFCONST(( cod, qta, des )) );
                MmInfo->Lines->Add("Riga ordine: " + msg);
            }
        }
        MmInfo->Lines->Add("Funzione richiamata con successo!");
    }

}
// ---------------------------------------------------------------------------
