/// <reference path="jquery-1.10.2.js" />
/// <reference path="common.js" />
/// <reference path="json2.js" />
/// <reference path="bootstrap.js" />
/// <reference path="jquery.cookie.js" />
/// <reference path="jquery.validate.js" />

var GlobalizationLanguageReplace = function () {
    this.ResourceDictionary = new Object();
};

//Singleton Static Instance Variable
GlobalizationLanguageReplace._instance = undefined;

//Singleton Get Instance Method
GlobalizationLanguageReplace.GetInstance = function () {
    if (GlobalizationLanguageReplace._instance === undefined) {
        GlobalizationLanguageReplace._instance = new GlobalizationLanguageReplace();
    }
    return GlobalizationLanguageReplace._instance;
}

GlobalizationLanguageReplace.prototype =
{
    ResourceDictionary: undefined,
    Keys:
    {
        LanguageCookieKey: "globalization_language",
        ResourceSetHeaderCookieKey: "globalization_text_",
        ReplaceElementAttributeName: "globalization-text",
        ReplaceElementAttributeValue: "true"
    },
    CookieExpire: 36000
}


//현재 다국어 상태를 반환한다.
GlobalizationLanguageReplace.prototype.getGlobalizationLanguage = function () {
    var result = null;
    result = $.cookie(this.Keys.LanguageCookieKey);
    result = (isNullOrEmpty(result) ? "" : result);
    return result;
};

//다국어 상태를 설정한다.
GlobalizationLanguageReplace.prototype.setGlobalizationLanguage = function ($value) {
    //$.cookie(this.Keys.LanguageCookieKey, $value, { expires: this.CookieExpire, domain: "localhost" });
    $.cookie(this.Keys.LanguageCookieKey, $value, { expires: this.CookieExpire, path: "/" });
}

//$text 에 대한 현재 다국어 문자열을 반환한다.
GlobalizationLanguageReplace.prototype.getGlobalizationText = function ($text) {
    var result = null;
    var temp = $.cookie(this.Keys.ResourceSetHeaderCookieKey + this.getGlobalizationLanguage() + "_" + $text);
    if (isNullOrEmpty(temp) == false) return temp;
    if (isNullOrEmpty(this.ResourceDictionary[$text]) == true) return result;
    if (this.ResourceDictionary[$text] === true) return result;
    result = this.ResourceDictionary[$text];
    return result;
}


//$text 에 대한 다국어 문자열을 적용한다.
GlobalizationLanguageReplace.prototype.setGlobalizationText = function ($text, $replaceText) {
    if ($text == $replaceText) return;
    this.ResourceDictionary[$text] = $replaceText;
    $.cookie(this.Keys.ResourceSetHeaderCookieKey + this.getGlobalizationLanguage() + "_" + $text, $replaceText, this.CookieExpire);

    //this.ResourceDictionary[$replaceText] = $replaceText;
    //$.cookie(this.Keys.ResourceSetHeaderCookieKey + this.getGlobalizationLanguage() + "_" + $replaceText, $replaceText, this.CookieExpire);
};

//다국어 변환을 실행한다.
GlobalizationLanguageReplace.prototype.executeReplace = function () {
    var instance = this;
    if (instance.getGlobalizationLanguage() == "") return;

    $("[" + this.Keys.ReplaceElementAttributeName + "='" + this.Keys.ReplaceElementAttributeValue + "']").each(function () {
        var replaceText = instance.getGlobalizationText($(this).text());
        if (isNullOrEmpty(replaceText)) 
        {
            instance.RequestReplaceGlobalizationText($(this).text());
        }
        else {
            $(this).removeAttr(instance.Keys.ReplaceElementAttributeName);
            if ($(this).text() == replaceText) {                
                return;
            }

            $(this).text(replaceText);
            
        }
    });
}

//$text 에 해당하는 다국어 문자열을 요청한다.
GlobalizationLanguageReplace.prototype.RequestReplaceGlobalizationText = function ($text) 
{
    var instance = this;
    if (instance.ResourceDictionary[$text] === true) return;
    instance.ResourceDictionary[$text] = true;

    var paramData = JSON.stringify({
        "pValue": $text
    });

    $.ajax({
        type: "POST",
        xhrFields: { withCredentials: true },
        url: "/Intergration/GlobalizationLanguageReplaceInterface.aspx/ReplaceGlobalizationText",
        contentType: "application/json; charset=utf-8",
        key: $text,
        instance: instance,
        data: paramData,
        crossDomain: false,
        dataType: "json",
        success: function (result) {
            var resultData = JSON.parse(result.d);
            if (resultData.RESULT == true) {
                instance.setGlobalizationText(this.key, resultData.VALUE);
                instance.executeReplace();
            } else {
                alert("요청 실패!");
            }
        },
        error: function (a, b, c) {
            alert("Error:" + a.status + a.statusText + b + c);
        }
    });
}
