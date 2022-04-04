class Language {
	static lmap := {"en":1, "cn": 2}
	static yes := ["yes", "确定"]
	static runWithAdministrator := ["Set startup error, Please run with Administrator", "设置开机自启动错误，请右键以管理员身份运行"]
	static setBoot := ["Set startup success", "设置开机启动成功"]
	static support := ["Support Multi-line, less than 30000 characters", "支持多行，最多30000个字符"]
	static addPhrase := ["Add Phrase", "添加自定义短语"]
	static myPhrase := ["My Phrase", "我的短语"]
	static abbre := ["Abbre (support character:[a-zA-Z0-9])", "缩写（支持字符：字母、数字）"]
	static add := ["Add", "确定"]
	static folder := ["Folder:", "文件夹："]
	static description := ["Description:", "描述："]
	static update := ["Update", "更新"]
	static isUpdate := ["Are you sure to update it", "确定更新吗？"]
	static cancel := ["Cancel","取消"]
	static no := ["No","取消"]
	static shortCut := ["Shortcut:","快捷键："]
	static hasKey := ["Already has this phrase, content:","已经存在此短语，值："]
	static continue := ["Add and continue","确定并继续添加"]
	static phraseEmptyOrError := ["Phrase empty or error","缩写为空或错误, 缩写支持：字母、数字"]
	static valueEmpty := ["Value empty","短语为空"]
	static overwrite := ["Overwrite it?","是否覆盖？"]
	static sysShortcut := ["shortcut","快捷键"]
	static document := ["document","文档"]
	static quickAdd := ["add phrase quickly","快速添加短语"]
	static showAllPhrase := ["show all phrase","显示所有短语"]
	static help := ["help","帮助"]
	static nextShow := ["Press no to show this tip next start!","点击取消，下次启动继续提示！"]
	static willNotShow := ["Press yes to not show this tip next start, please get this tip from help->shortcut!","点击确定，下次启动不再提示！"]
	static helpShortcut := ["Get this tip from help->shortcut!", "请点击 帮助->快捷键 获得该提示！"]
	static usingTimes := ["Your using times: ", "您的使用次数："]
	static lessCharacter := ["Less print characters: ", "少打印字符数量："]
	static saveTime := ["This software May save ", "该软件可能节省了您 "]
	static inMinute := [" minutes for you,", " 分钟时间，"]
	static share := ["Share this software to your friend, or give advice to me, my WeChat: 13128812409", "分享给你的好友，或者给我个建议，我的微信：13128812409"]
	static statistics := ["Statistics:", "统计："]
	static startTip := ["Start Tip:", "启动提示："]
	get(var,defaultVar){
		if(var){
			return %var%
		}else{
			return %defaultVar%
		}
	}
	setLanguage(var){
		IniWrite, %var%, setting.ini, language, default
	}
}
default := 1
IniRead, default, setting.ini, language, default
global myPhraseL := Language.myPhrase[default]
global runWithAdministratorL := Language.runWithAdministrator[default]
global setBootL := Language.setBoot[default]
global yesL := Language.yes[default]
global supportL := Language.support[default]
global addPhraseL := Language.addPhrase[default]
global noL := Language.no[default]
global abbreL := Language.abbre[default]
global descriptionL := Language.description[default]
global folderL := Language.folder[default]
global shortCutL := Language.shortCut[default]
global cancelL := Language.cancel[default]
global updateL := Language.update[default]
global isUpdateL := Language.isUpdate[default]
global addL := Language.add[default]
global continueL := Language.continue[default]
global phraseEmptyOrErrorL := Language.phraseEmptyOrError[default]
global valueEmptyL := Language.valueEmpty[default]
global hasKeyL := Language.hasKey[default]
global overwriteL := Language.overwrite[default]
global documentL := Language.document[default]
global sysShortcutL := Language.sysShortcut[default]
global quickAddL := Language.quickAdd[default]
global showAllPhraseL := Language.showAllPhrase[default]
global helpL := Language.help[default]
global nextShowL := Language.nextShow[default]
global willNotShowL := Language.willNotShow[default]
global usingTimesL := Language.usingTimes[default]
global lessCharacterL := Language.lessCharacter[default]
global saveTimeL := Language.saveTime[default]
global inMinuteL := Language.inMinute[default]
global shareL := Language.share[default]
global statisticsL := Language.statistics[default]
global startTipL := Language.startTip[default]

;Language.setLanguage(Language.lmap["en"])