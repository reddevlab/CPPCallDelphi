//---------------------------------------------------------------------------

#ifndef UnitFormMainCppH
#define UnitFormMainCppH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>

#include "ItfCppOrdine.h"

//---------------------------------------------------------------------------
class TFormMain : public TForm
{
__published:	// IDE-managed Components
    TPanel *Panel1;
    TButton *BtCaricaDll;
    TButton *Button1;
    TMemo *MmInfo;
    void __fastcall BtCaricaDllClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
    ICppOrdine* m_cppOrd;


    __fastcall TFormMain(TComponent* Owner);

};
//---------------------------------------------------------------------------
extern PACKAGE TFormMain *FormMain;
//---------------------------------------------------------------------------
#endif
