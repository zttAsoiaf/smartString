#Include language.ahk
if FileExist("startSmartString.ahk.lnk"){
    FileCopy, startSmartString.ahk.lnk, %A_Desktop%\, Overwrite
	FileDelete, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\startSmartString.ahk.lnk
    FileCopy, startSmartString.ahk.lnk, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp,Overwrite
	if !FileExist("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\startSmartString.ahk.lnk"){
		Msgbox % runWithAdministratorL
	}else{
		
		Msgbox % setBootL
	}
}