# Microsoft Developer Studio Project File - Name="renelem" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=renelem - Win32 Release
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "renelem.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "renelem.mak" CFG="renelem - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "renelem - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "renelem - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "renelem - Win32 Hybrid" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""$/devel/3dswin/src/maxsdk/Samples/Render/RenderElements", SODFAAAA"
# PROP Scc_LocalPath "."
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "renelem - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Release"
# PROP BASE Intermediate_Dir ".\Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\Release"
# PROP Intermediate_Dir ".\Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
renelem=midl.exe
# ADD BASE renelem /nologo /D "NDEBUG" /win32
# ADD renelem /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /G6 /MD /W3 /O2 /I "..\..\..\include" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /Yu"renelemPch.h" /Fd"renelem.pdb" /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 comctl32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /base:"0x084E0000" /subsystem:windows /dll /machine:I386 /out:"..\..\..\..\maxsdk\plugin\renelem.dln" /release

!ELSEIF  "$(CFG)" == "renelem - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Debug"
# PROP BASE Intermediate_Dir ".\Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\Debug"
# PROP Intermediate_Dir ".\Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
renelem=midl.exe
# ADD BASE renelem /nologo /D "_DEBUG" /win32
# ADD renelem /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /Fd"renelem.pdb" /c
# ADD CPP /nologo /G6 /MDd /W3 /Gm /ZI /Od /I "..\..\..\include" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /Yu"renelemPch.h" /Fd"renelem.pdb" /FD /c
# SUBTRACT CPP /Fr
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /dll /debug /machine:I386
# ADD LINK32 comctl32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /base:"0x084E0000" /subsystem:windows /dll /debug /machine:I386 /out:"..\..\..\..\maxsdk\plugin\renelem.dln"

!ELSEIF  "$(CFG)" == "renelem - Win32 Hybrid"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Hybrid"
# PROP BASE Intermediate_Dir ".\Hybrid"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\Hybrid"
# PROP Intermediate_Dir ".\Hybrid"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
renelem=midl.exe
# ADD BASE renelem /nologo /D "_DEBUG" /win32
# ADD renelem /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE CPP /nologo /G5 /MD /W3 /Gm /GX /Zi /Od /I "..\include" /I "..\MaxSDK\Include" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /Yu"renelemPch.h" /Fd"renelem.pdb" /c
# ADD CPP /nologo /G6 /MD /W3 /Gm /ZI /Od /I "..\..\..\include" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /Yu"renelemPch.h" /Fd"renelem.pdb" /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 comctl32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /dll /debug /machine:I386 /out:"..\..\..\maxsdk\plugin\renelem.dln"
# ADD LINK32 comctl32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /base:"0x084E0000" /subsystem:windows /dll /debug /machine:I386 /out:"..\..\..\..\maxsdk\plugin\renelem.dln"

!ENDIF 

# Begin Target

# Name "renelem - Win32 Release"
# Name "renelem - Win32 Debug"
# Name "renelem - Win32 Hybrid"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\renElem.def
# End Source File
# Begin Source File

SOURCE=.\renElemMain.cpp
# End Source File
# Begin Source File

SOURCE=.\renElemPch.cpp
# ADD CPP /Yc"renelemPch.h"
# End Source File
# Begin Source File

SOURCE=.\sampRenElem.cpp
# End Source File
# Begin Source File

SOURCE=.\stdRenElem.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=..\..\Include\imtl.h
# End Source File
# Begin Source File

SOURCE=..\..\Include\renderElements.h
# End Source File
# Begin Source File

SOURCE=.\renElemPch.h
# End Source File
# Begin Source File

SOURCE=..\..\Include\shaders.h
# End Source File
# Begin Source File

SOURCE=.\stdRenElems.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\renElem.rc
# End Source File
# Begin Source File

SOURCE=.\renElemRes.h
# End Source File
# End Group
# Begin Source File

SOURCE=..\..\..\lib\core.lib
# End Source File
# Begin Source File

SOURCE=..\..\..\lib\maxutil.lib
# End Source File
# Begin Source File

SOURCE=..\..\..\lib\Paramblk2.lib
# End Source File
# End Target
# End Project
