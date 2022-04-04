#Include language.ahk
#Include phrase.ahk
import(file,fatherTVMap,sonTVMap,phrase){
    lastLine := ""
    begin := false
    value := ""
    key := ""
    Loop, Read, %file%
    {
        RegExMatch(A_LoopReadLine, ":\*:[a-zA-Z0-9]+\]::", Match)
        
        if(Match != ""){
            if(InStr(lastLine,";")){
                word_array := StrSplit(lastLine,";")
                
                ;父TV
                if(word_array[4] != "" && !fatherTVMap.HasKey(word_array[4])){
                    p4 := TV_Add(word_array[4])
                    fatherTVMap[word_array[4]] := p4
                    
                    ;子TV
                    if(word_array[5] != "" && !sonTVMap.HasKey(word_array[5])){
                        p5 := TV_Add(word_array[5],p4)
                        sonTVMap[word_array[5]] := p5           
                    }
                }
                
                if(word_array[2] != ""){
                    key := word_array[2]
                    if(word_array[5]==""){
                        TV_Add(word_array[2],fatherTVMap[word_array[4]],Sort)
                    }else{
                        if(word_array[4] != ""){
                            TV_Add(word_array[2],sonTVMap[word_array[5]],Sort)
                        }else{
                            TV_Add(word_array[2])
                        }
                    }
                }
            }
        }
        if(begin){
            value=%value%`n%A_LoopReadLine%
        }
        if(A_LoopReadLine=="`("){
            begin := true
        }
        if(A_LoopReadLine=="`)"){
            begin := false
            value := SubStr(value,4,StrLen(value)-7)
            phrase[key] := value
            key := ""
            value := ""
        }
        lastLine := A_LoopReadLine
    }
}

import("phrase.ahk",fatherTVMap,sonTVMap,phrase)

importSogo(){
	value := ""
	firstLine := false
	inputNum := 0
	Loop, Read, sogouphrase.ahk
	{
		s := Trim(A_LoopReadLine)
		if(SubStr(s,1,1) == ";"){
			continue
		}else{
			line := StrReplace(A_LoopReadLine,"::","``::",,Limit:=-1)
			line := StrReplace(line,"(","``(",,Limit:=-1)
			line := StrReplace(line,")","``)",,Limit:=-1)
			RegExMatch(line, "[a-zA-Z0-9]+,[0-9]=", Match)
			if(Match != ""){
				FoundPos := RegExMatch(line, "[a-zA-Z0-9]+", Match)
				key = %Match%
				RegExMatch(line, "=.+", Match)
				
				if(Match != ""){
					Match := SubStr(Match,2)
					FileAppend, `n;%key%;sogou;sogou;%son%`n:*:%key%]::`nsendText`n`(`n`(`"%Match%`"`)`n)`nreturn`n, sogou.ahk
					inputNum = %inputNum% + 1
					value := RTrim(value,"`n")
					if(value != ""){
						FileAppend, %value%`"`)`n`)`nreturn, sogou.ahk
						inputNum = %inputNum% + 1
					}
					value := ""
				}else{
					value = `;%key%;sogou;sogou;%son%`n:*:%key%]::`nsendText`n`(`n`("
					firstLine := true
				}
			}else{
				if(firstLine == true){
					value = %value%%A_LoopReadLine%
					firstLine := false
				}else{
					value = %value%`n%A_LoopReadLine%
				}
			}
		}
	}
    
    if(inputNum == 0){
        MsgBox please be sure copy the sogou custom phrase into the sogou.txt file same of this folder
    }else{
    	MsgBox input sogou number: %inputNum%
    }
}

sendText(var_string)
{
    ClipboardOld = %ClipboardAll%
    Clipboard =%var_string%
    sleep 100
    send ^v
    sleep 100
    Clipboard = %ClipboardOld%  ; Restore previous contents of clipboard.
    statisticsAdd(var_string)
}

;成功返回0，失败返回1
addPhrase(abbre, value, description,father,son){
    abbre := Trim(abbre)
    valueTemp := Trim(value)


    RegExMatch(abbre, "[a-zA-Z0-9]+", Match)
    if(abbre == "" || Match != abbre){
        MsgBox % phraseEmptyOrErrorL
        return 1
    }

    if(valueTemp == ""){
        MsgBox % valueEmptyL
        return 1
    }
	value := StrReplace(value,"::","``::",,Limit:=-1)
	value := StrReplace(value,"(","``(",,Limit:=-1)
	value := StrReplace(value,")","``)",,Limit:=-1)
	
	if(phrase.HasKey(abbre)){
		MsgBox % haskeyL "`n" phrase["f"]
		return 1
	}
	

	FileAppend, `n;%abbre%;%description%;%father%;%son%`n:*:%abbre%]::`nSend`n`(`n`(`"%value%`"`)`n)`nreturn`n, phrase.ahk
	phrase[abbre] := value
	return 0
}

;增
add(abbre, value, fatherMapValue, description){
;	if(fatherMapValue == "default"){
;		MsgBox 集合不能是“default”
;        return 1
;	}

	

	abbre := Trim(abbre)
    valueTemp := Trim(value)
	fatherMapValue := Trim(fatherMapValue)
	if(fatherMapValue == ""){
		fatherMapValue := myPhraseL
	}
	

;    RegExMatch(abbre, "[a-zA-Z0-9!@#$%^&*()\[\]\-{}|\\',.<>?/]+", Match)
	RegExMatch(abbre, "[a-zA-Z0-9]+", Match)
    if(abbre == "" || Match != abbre){
        MsgBox % phraseEmptyOrErrorL
        return 1
    }

    if(valueTemp == ""){
        MsgBox % valueEmptyL
        return 1
    }
	
	if(phrase.HasKey(abbre)){
		MsgBox ,260,,% haskeyL "`n" phrase[abbre] "`n" overwriteL
		IfMsgBox Yes
		{
			delete(abbre)
			add(abbre, value, fatherMapValue, description)
		}
		return 0
	}
	phrase[%abbre%] := value
	fatherMap["a"] := %fatherMapValue%
	
	value := StrReplace(value,"::","``::",,Limit:=-1)
	value := StrReplace(value,"(","``(",,Limit:=-1)
	value := StrReplace(value,")","``)",,Limit:=-1)
	value := StrReplace(value,"""","""""",,Limit:=-1)
	FileAppend, `n;%abbre%;`nfatherMap["%abbre%"] := "%fatherMapValue%"`ndescription["%abbre%"] := "%description%"`nphrase["%abbre%"] := `n(`n"%value%"`n)`n;;;;;;;;;;,phrase.ahk
	FileAppend, `n;%abbre%;`n:*:%abbre%]::`nsendText(phrase["%abbre%"])`nreturn`n;;;;;;;;;;, send.ahk
	return 0
}

;删
delete(abbre){
	phrase.Delete(abbre)
	fatherMap.Delete(abbre)
	
	FileRead, var, phrase.ahk
    reg := "smU);" abbre ";.+;;;;;;;;;;"
    var := RegExReplace(var, reg)
	; 移除变量中所有空行:
	Loop
	{
		var := StrReplace(var, "`r`n`r`n", "`r`n", Count)
		if (Count = 0)  ; 不再需要更多的替代.
			break
	}
	var := RegExReplace(var, reg)
	FileDelete,phrase.ahk
    FileAppend,%var%,phrase.ahk
	
	FileRead, var, send.ahk
    reg := "smU);" abbre ";.+;;;;;;;;;;"
    var := RegExReplace(var, reg)
	; 移除变量中所有空行:
	Loop
	{
		var := StrReplace(var, "`r`n`r`n", "`r`n", Count)
		if (Count = 0)  ; 不再需要更多的替代.
			break
	}
	FileDelete,send.ahk
    FileAppend,%var%,send.ahk
}
;改
change(abbre, value, father, description){
	delete(abbre)
	add(abbre, value,father, description)
}

;查
query(abbre){
	MsgBox % phrase[abbre]
}

; 脚本之间互相控制
sendcmd(cmd,scriptname)
{
	DetectHiddenWindows, on
	SetTitleMatchMode,2
	cmd_no:={重启:65303,编辑:65304,挂起:65305,暂停:65306,退出:65307}
	PostMessage, 0x111,cmd_no[cmd],,,%scriptname%
	return %cmd%
}

runDocument(){
    Run https://gitee.com/smartString/smartString
}

runSysShortcut(){
    Msgbox,,%shortcutL%,Win + z: %quickAddL%`nWin + n: %showAllPhraseL%
}

firstRun(){
    IniRead, startTime, setting.ini, start, time
    if (startTime < 3) {
        Msgbox,1,%startTipL%,%helpShortcutL%`nWin + z: %quickAddL%`nWin + n: %showAllPhraseL%`n`n%nextShowL%`n%willNotShowL%
        IfMsgBox Yes
            Msgbox % startTime
            var := startTime + 1
            IniWrite, %var%, setting.ini, start, time
        return
    }
}

showSaveTime(){
    IniRead, useTime, setting.ini, statistics, useTime
    IniRead, lessCharacter, setting.ini, statistics, lessCharacter
    IniRead, printSpeed, setting.ini, statistics, printSpeed
    saveTime := Floor(lessCharacter/printSpeed)
    Msgbox,,%statisticsL%,%usingTimesL%%useTime%`n%lessCharacterL%%lessCharacter%`n%saveTimeL%%saveTime%%inMinuteL%`n%shareL%
}

statisticsAdd(var_string){
    IniRead, useTime, setting.ini, statistics, useTime
    var := useTime + 1
    IniWrite, %var%, setting.ini, statistics, useTime

    IniRead, lessCharacter, setting.ini, statistics, lessCharacter
    lessCharacter := lessCharacter + StrLen(var_string)
    IniWrite, %lessCharacter%, setting.ini, statistics, lessCharacter
}
