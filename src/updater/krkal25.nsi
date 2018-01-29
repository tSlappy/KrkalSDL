; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Krkal"
!define PRODUCT_VERSION "2.5"
!define PRODUCT_PUBLISHER "Krkal Team"
!define PRODUCT_WEB_SITE "http://www.krkal.org"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\Krkal2"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

SetCompressor lzma
;Properly display all languages (Installer will not work on Windows 95, 98 or ME!)
Unicode true

; MUI 1.67 compatible ------
!include "MUI2.nsh"
!include "LogicLib.nsh"
!include "nsDialogs.nsh"
!include "ReplaceInFile.nsh"

Var InstDir2
Var Dir1Title
Var Dir1SubTitle
Var Dir1Dest
Var Dir2Title
Var Dir2SubTitle
Var Dir2Dest




; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "..\res\krkal.ico"
!define MUI_UNICON "uninstall.ico"


;Show all languages, despite user's codepage
!define MUI_LANGDLL_ALLLANGUAGES
!define MUI_LANGDLL_ALWAYSSHOW
!define MUI_LANGDLL_WINDOWTITLE "${PRODUCT_NAME} ${PRODUCT_VERSION}"
!define MUI_LANGDLL_INFO "Please select a language.$\r$\nPros�m zvolte jazyk."

; License page
!insertmacro MUI_PAGE_LICENSE "$(MUILicense)"
Page custom OptionsPage OptionsPageLeave
; Directory page
!define MUI_PAGE_CUSTOMFUNCTION_PRE SecondDirPre
!define MUI_DIRECTORYPAGE_VARIABLE $InstDir2
!define MUI_DIRECTORYPAGE_TEXT_DESTINATION "$Dir2Dest"
!define MUI_PAGE_HEADER_TEXT "$Dir2Title"
!define MUI_PAGE_HEADER_SUBTEXT "$Dir2SubTitle"
!insertmacro MUI_PAGE_DIRECTORY
; Directory page
!define MUI_DIRECTORYPAGE_TEXT_DESTINATION "$Dir1Dest"
!define MUI_PAGE_HEADER_TEXT "$Dir1Title"
!define MUI_PAGE_HEADER_SUBTEXT "$Dir1SubTitle"
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_COMPONENTS
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "Czech"
!insertmacro MUI_LANGUAGE "English"

; License Language
LicenseLangString MUILicense ${LANG_ENGLISH} "licence.en.rtf"
LicenseLangString MUILicense ${LANG_CZECH} "licence.rtf"

!include "texty.nsh"

; Reserve files
!insertmacro MUI_RESERVEFILE_LANGDLL

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Krkal25.exe"
ShowInstDetails show
ShowUnInstDetails show

Var Dialog
Var StyleRB1
Var StyleRB2
Var StyleRB3
Var StyleRB1_State
Var StyleRB2_State
Var StyleRB3_State
Var IconChb
Var IconChb_State
Var Label1
Var Label2
Var Label3


Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
  StrCpy $StyleRB1_State ${BST_CHECKED}
  StrCpy $StyleRB2_State ${BST_UNCHECKED}
  StrCpy $StyleRB3_State ${BST_UNCHECKED}
  StrCpy $IconChb_State ${BST_CHECKED}
FunctionEnd

Function OptionsPage

        !insertmacro MUI_HEADER_TEXT "Moznosti" "Prosim zvolte styl instalace."
        
	nsDialogs::Create 1018
	Pop $Dialog

	${If} $Dialog == error
		Abort
	${EndIf}

	${NSD_CreateRadioButton} 0 0u 100% 12u "&Recomended 2 folder installation"
	Pop $StyleRB1
	${NSD_CreateLabel} 20u 12u 280u 24u "Rozdeli krkala na 2 casti. Spustitelne soubory umisti do Program Files a uzivatelska data do verejne pristupne slozky."
	Pop $Label1

	${NSD_CreateRadioButton} 0 40u 100% 12u "&Custom 1 folder installation"
	Pop $StyleRB2
	${NSD_CreateLabel} 20u 52u 280u 24u "Necha Krkala pohromade, ale pak je treba zvolit nejake nestandardni cilove umisteni. Program Files to byt nemohou."
	Pop $Label2

	${NSD_CreateRadioButton} 0 80u 100% 12u "&Just unpack"
	Pop $StyleRB3
	${NSD_CreateLabel} 20u 92u 280u 24u "Rozbali krkala do cilove slozky, nenecha zadbne stopy v registrech ani ve Start Menu. Nevytvori odinstalacni program."
	Pop $Label3

	${NSD_CreateCheckbox} 0 120u 100% 10u "Create a &Desctop Icon."
	Pop $IconChb




	${NSD_SetState} $StyleRB1 $StyleRB1_State
	${NSD_SetState} $StyleRB2 $StyleRB2_State
	${NSD_SetState} $StyleRB3 $StyleRB3_State
	${NSD_SetState} $IconChb $IconChb_State

	nsDialogs::Show

FunctionEnd

Function OptionsPageLeave

	${NSD_GetState} $StyleRB1 $StyleRB1_State
	${NSD_GetState} $StyleRB2 $StyleRB2_State
	${NSD_GetState} $StyleRB3 $StyleRB3_State
	${NSD_GetState} $IconChb $IconChb_State
	
	${If} $StyleRB1_State == ${BST_CHECKED}
              StrCpy $InstDir2 "$PROGRAMFILES\Krkal2"
              ReadEnvStr $0 PUBLIC
              StrCpy $INSTDIR "$0\Krkal2"
              StrCpy $Dir2Title "Choose Executables Install Location"
              StrCpy $Dir2SubTitle "Choose the folder in which to install Krkal 2.5 binarieas."
              StrCpy $Dir2Dest "Program Destination Folder"
              StrCpy $Dir1Title "Choose Data Install Location"
              StrCpy $Dir1SubTitle "Choose the folder in which to install Krkal 2.5 user data like levels, scripts, documentation and configuration."
              StrCpy $Dir1Dest "Data Destination Folder"
	${ElseIf} $StyleRB2_State == ${BST_CHECKED}
              StrCpy $INSTDIR "C:\Krkal2"
              StrCpy $Dir1Title "Choose Install Location"
              StrCpy $Dir1SubTitle "Choose the folder in which to install Krkal 2.5.$\r$\nWarning: Installing whole Krkal to Program Files is not possible."
              StrCpy $Dir1Dest "Destination Folder"
	${Else}
              StrCpy $INSTDIR "C:\Krkal2"
              StrCpy $Dir1Title "Choose Unpack Location"
              StrCpy $Dir1SubTitle "Choose the folder in which to unpack Krkal 2.5."
              StrCpy $Dir1Dest "Destination Folder"
        ${EndIf}
FunctionEnd



Function SecondDirPre
        ${If} $StyleRB1_State == ${BST_UNCHECKED}
		Abort
	${EndIf}
FunctionEnd


Section "MainSection" SEC01
  SetOutPath "$INSTDIR\!3dsmax!"
  File /r "..\..\bin\!3dsmax!\*.*"
  SetOutPath "$INSTDIR\!music!"
  File /r "..\..\bin\!music!\*.*"
  SetOutPath "$INSTDIR\Data"
  File /r /x "RunTimeErrors.log" /x "gui_error.log" /x "files" "..\..\bin\Data\*.*"
  SetOutPath "$INSTDIR\Documentation.EN"
  File /r "..\..\bin\Documentation.EN\*.*"
  SetOutPath "$INSTDIR\Dokumentace.CS"
  File /r "..\..\bin\Dokumentace.CS\*.*"
  SetOutPath "$INSTDIR\Games"
  File /r "..\..\bin\Games\*.*"
  SetOutPath "$INSTDIR\maxPlugin"
  File /r "..\..\bin\maxPlugin\*.*"
  SetOutPath "$INSTDIR\Profiles"
  File "..\..\bin\Profiles\dirInfo.txt"
  SetOutPath "$INSTDIR\scripts"
  File /r "..\..\bin\scripts\*.*"
  SetOutPath "$INSTDIR"
  File "..\..\bin\version"
  File "..\..\bin\krkal.cfg"
  File "..\..\bin\ReadMe.cs.txt"
  File "..\..\bin\ReadMe.en.txt"
  
  ${If} $StyleRB1_State == ${BST_CHECKED}
        SetOutPath "$InstDir2"
        File "..\..\bin\version"
        File "..\..\bin\ReadMe.cs.txt"
        File "..\..\bin\ReadMe.en.txt"
  ${Else}
        StrCpy $InstDir2 $INSTDIR
  ${EndIf}
  
  File "..\..\bin\KRKAL.exe"
  File "..\..\bin\KRKALfs.cfg"
  File "..\..\bin\zlib.dll"
  File "..\..\bin\audiere.dll"

SectionEnd

Section -Replacements
  ${If} $StyleRB1_State == ${BST_CHECKED}
     !insertmacro _ReplaceInFile "$InstDir2\KRKALfs.cfg" "$\"$$cfg$$$\"" "$\"$INSTDIR$\""
  ${EndIf}
SectionEnd

Section -AdditionalIcons
${If} $StyleRB3_State == ${BST_UNCHECKED}
  SetShellVarContext all
  SetOutPath $InstDir2
  WriteIniStr "$InstDir2\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateDirectory "$SMPROGRAMS\Krkal 2"
  CreateShortCut "$SMPROGRAMS\KRKAL 2\KRKAL.lnk" "$InstDir2\KRKAL.exe"
  CreateShortCut "$SMPROGRAMS\KRKAL 2\$(txtDokumentace).lnk" "$INSTDIR\$(txtDocFolder)\"
  CreateShortCut "$SMPROGRAMS\Krkal 2\Website.lnk" "$InstDir2\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\Krkal 2\Uninstall.lnk" "$InstDir2\uninst.exe"
  CreateShortCut "$SMPROGRAMS\KRKAL 2\ReadMe.lnk" "$INSTDIR\$(txtReadmeFile)"
  CreateShortCut "$SMPROGRAMS\KRKAL 2\$(txtKonfigurace).lnk" "notepad" "$INSTDIR\krkal.cfg"
${EndIf}
SectionEnd

Section -Post
${If} $StyleRB3_State == ${BST_UNCHECKED}
  WriteUninstaller "$InstDir2\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$InstDir2\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Krkal:DataPath" "$INSTDIR"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Krkal:Language" "$LANGUAGE"
${EndIf}
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(txtRemoved)"
FunctionEnd


Function un.onInit
  !define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
  !define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
  !define MUI_LANGDLL_REGISTRY_VALUENAME "Krkal:Language"
  !insertmacro MUI_UNGETLANGUAGE

  StrCpy $InstDir2 $INSTDIR
  ReadRegStr $0 ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Krkal:DataPath"
  StrLen $1 $0
  ${If} $1 > 0
    StrCpy $INSTDIR $0
  ${EndIf}
FunctionEnd



Section "un.Program" un.ProgramUninstall
  RMDir /r "$INSTDIR\!3dsmax!"
  RMDir /r "$INSTDIR\!music!"
  RMDir /r "$INSTDIR\Data"
  RMDir /r "$INSTDIR\Documentation.EN"
  RMDir /r "$INSTDIR\Dokumentace.CS"
  RMDir /r "$INSTDIR\maxPlugin"
  RMDir /r "$INSTDIR\scripts"
  Delete "$INSTDIR\Games\Krkal_4F88_78B7_A01C_48AB\music2_27EC_DA65_6E25_9B8F.pkg"
  Delete "$INSTDIR\Games\Krkal_4F88_78B7_A01C_48AB\music_65B6_399E_4613_0839.pkg"
  Delete "$INSTDIR\Games\Krkal_4F88_78B7_A01C_48AB\sound_8A76_670D_A9E4_1A65.pkg"
  Delete "$INSTDIR\Games\Krkal_4F88_78B7_A01C_48AB\sound2_8C3C_E0CD_855A_1BCC.pkg"
  ${If} $INSTDIR != $InstDir2
    Delete "$InstDir2\version"
    Delete "$InstDir2\ReadMe.cs.txt"
    Delete "$InstDir2\ReadMe.en.txt"
  ${EndIf}
  Delete "$InstDir2\KRKAL.exe"
  Delete "$InstDir2\KRKALfs.cfg"
  Delete "$InstDir2\zlib.dll"
  Delete "$InstDir2\audiere.dll"
  Delete "$InstDir2\Krkal.url"
  Delete "$InstDir2\uninst.exe"
  RMDir "$InstDir2"

  SetShellVarContext all
  RMDir /r "$SMPROGRAMS\Krkal 2"
  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"

  SetAutoClose true
SectionEnd


Section /o "un.Data Uzivatelu" un.DataUninstall
  RMDir /r "$INSTDIR\Games"
  RMDir /r "$INSTDIR\Profiles"
  Delete "$INSTDIR\version"
  Delete "$INSTDIR\krkal.cfg"
  Delete "$INSTDIR\ReadMe.cs.txt"
  Delete "$INSTDIR\ReadMe.en.txt"
  RMDir "$INSTDIR"
  SetAutoClose true
SectionEnd


!insertmacro MUI_UNFUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${un.ProgramUninstall} "Odinstaluje program z '$InstDir2', neuzivatelska data z '$INSTDIR', startmenu a registry"
  !insertmacro MUI_DESCRIPTION_TEXT ${un.DataUninstall} "Odstrani levely, skripty a uzivatelske profily z '$INSTDIR'"
!insertmacro MUI_UNFUNCTION_DESCRIPTION_END
