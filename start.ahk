#SingleInstance Force
#NoEnv
#Include language.ahk
#Include phrase.ahk

I_Icon = S_48px.ico
IfExist, %I_Icon%
{
	Menu, Tray, Icon, %I_Icon%
}


Gui, Add, TreeView, vMyTreeView gMyTreeView x0 y0 w240 h590
Gui Add, Edit, x240 y0 w580 h590 vMyEdit
Gui Add, Button, gaddPhraseHandle x620 y592 w80 h25 vconfirm, %updateL%
Gui Add, Button, x710 y592 w80 h25 gcancel vcancel, %cancelL%

Menu, MyContextMenu, Add, add, addPhraseGUI
Menu, MyContextMenu, Add, delete, deletePhraseHandle

Menu, MyDeleteContextMenu, Add, delete, deletePhraseHandle

global fatherTVMap := {}
;sonTVMap := {}
;phrase := {}
;import("phrase.ahk",fatherTVMap,sonTVMap,phrase)

for key, element in fatherMap{
    if(!fatherTVMap.HasKey(element)){
        p1 := TV_Add(element)
        fatherTVMap[element] := p1
    }
    TV_Add(key,fatherTVMap[element])
}


TV_Modify(0, "Sort")

Gui, Show, w820 h620, %myPhraseL%
return

MainEscape:
MainClose:
    Gui hide

GuiContextMenu:
    if (A_GuiControl != "MyTreeView")
        return

    id := TV_GetSelection()
    if(contains(fatherTvMap,id) || contains(sonTvMap,id)){
        Menu, MyContextMenu, Show, %A_GuiX%, %A_GuiY%
        return
    }else{
        Menu, MyDeleteContextMenu, Show, %A_GuiX%, %A_GuiY%
        return
    }        
return


addPhraseGUI(){
    Run addPhrase.ahk
}

deletePhraseHandle:
    id := TV_GetSelection()
    TV_GetText(abbre, id)
	if(contains(fatherTvMap,id)){
        sonId := TV_GetChild(id)
        if(sonId == 0){
            MsgBox,260,, 确定删除？
            IfMsgBox No
                return
            fatherTvMap.Delete(%key%)
            TV_Delete(id)
        }else{
            MsgBox 集合非空，不允许删除
        }
        return
    }
	
;	if(fatherMap[abbre]=="default"){
;		MsgBox "不能删除默认短语"
;		return
;	}
	MsgBox,260,, 确定删除？
    IfMsgBox No
        return
	
    delete(abbre)
    reload
return

MyTreeView:
    id := TV_GetSelection()
    if(contains(fatherTvMap,id) || contains(sonTvMap,id)){
        GuiControl,, MyEdit,
        GuiControl, Disable, MyEdit
        GuiControl, Disable, confirm
        GuiControl, Disable, cancel
        return
    }
    TV_GetText(phkey, id)
    phValue := phrase[phkey]
    GuiControl,, MyEdit, %phValue%
    GuiControl, Enable, MyEdit
    GuiControl, Enable, confirm
    GuiControl, Enable, cancel
return

addPhraseHandle(){
    id := TV_GetSelection()
    TV_GetText(abbre, id)
    GuiControlGet MyEdit
	MyEdit := Trim(MyEdit)
	if(MyEdit==“”){
		MsgBox % valueEmptyL
        return 1
	}
	
	MsgBox,260,, % isUpdateL
    IfMsgBox No
        return
	
    change(abbre,MyEdit,fatherMap[abbre],description[abbre])
    reload
}
cancel(){
}

contains(map,id){
    for index, element in map
    {
        if(element==id){
            return true
        }
    }
    return false
}

;删除file中key，TV id为id的值
deletePhrase(file,key, id, fatherTVMap,sonTVMap,phrase){
    if(contains(fatherTvMap,id)){
        sonId := TV_GetChild(id)
        if(sonId == 0){
            MsgBox,260,, 确定删除？
            IfMsgBox No
                return
            fatherTvMap.Delete(%key%)
            TV_Delete(id)
        }else{
            MsgBox 集合非空，不允许删除
        }
        return
    }
	
    MsgBox,260,, 确定删除？
    IfMsgBox No
        return
    
    FileRead, var, %file%
    TV_GetText(phkey, id)
    reg := "smU);" phkey ";.+return"
    var := RegExReplace(var, reg)
    MsgBox % var
    var := RegExReplace(var, "m)^[[:blank:]]*(.*)", "$1")
    MsgBox % var
    
    
    FileDelete,%file%
    FileAppend,%var%,%file%
    if(contains(fatherTvMap,id)){
        fatherTvMap.Delete(%key%)
    }
    if(contains(sonTVMap,id)){
        sonTVMap.Delete(%key%)
    }
    TV_Delete(id)
    phrase.Delete(%phkey%)
    Reload
}
#Include send.ahk

#SingleInstance Force
#NoEnv
Menu Tray, Icon, shell32.dll, 321
;#z::  ; Win+Z 热键
;Run addPhrase.ahk
;return

#n::  ; Win+Shift 热键
Reload
return

#Include addPhrase.ahk