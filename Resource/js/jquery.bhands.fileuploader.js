/*
    Bhands File Uploader
    @author         Nokcha
*/

(function ($) {
    var 
    defaults = {
        key: null,
        frameID: "bhandsFileUploader",
        src: "/Common/IFrameUnit/FileUploadIFrameUnit.aspx",
        actionURL: "/Intergrafition/LegacyFileUploadHandler.ashx",
        frameClass: "",
        frameBorder: 0,
        frameWidth: 600,
        frameHeight: 70,
        callbackUploadComplate: function (target) {
            //Callback
        },
        callbackUploadFail: function (target) {
            //Callback
        },
        callbackReset: function (target) {
            //Callback
        }
    };

    $.fn.BhandsFileUploader = function ($options) {
        return this.each(function () {
            $(this).data('bhandsFileUploader', new $pc(this, $options));
        });
    };

    $.BhandsFileUploader = function ($container, $o) 
    {
        this.options = $.extend({}, defaults, $o || {});
        this.Container = $container;
        this.IFrame = null;
        this.createTagIFrame = function () {
            var result = "<iframe ";
            result += " id='" + this.options.frameID + "' ";
            result += " src='" + this.createSrc() + "' ";
            result += " class='bhandsFileUploader " + this.options.frameClass + "' ";
            result += " frameborder='" + this.options.frameBorder + "' ";
            result += " width='" + this.options.frameWidth + "' ";
            result += " height='" + this.options.frameHeight + "' ";
            result += " scrolling='no' ";
            result += "></iframe>";
            return result;
        };

        this.createSrc = function () {
            var result = this.options.src;
            result += "?actionURL=" + encodeURIComponent(this.options.actionURL);
            return result;
        };

        this.onLoadIFrameEventListener = function () {
            var currentURL = this.GetCurrentURL();
            if (currentURL == this.options.actionURL || currentURL.indexOf(this.options.actionURL) > 0) {
                var resultValue = this.GetResult();
                switch (resultValue) {
                    case undefined:
                    case null:
                    case "fail":
                        this.options.callbackUploadFail(this.Container);
                        break;
                    default:
                        this.options.callbackUploadComplate(this.Container);
                        break;
                }
            }
            else {
                this.options.callbackReset(this.Container);
            }
        };

        this.IFrame = $(this.createTagIFrame()).appendTo(this.Container);
        $(this.IFrame).load($.proxy(this.onLoadIFrameEventListener, this));
    };

    var $pc = $.BhandsFileUploader;
    $pc.fn = $pc.prototype = {
        bhandsFileUploader: '1.0.0'
    };
    $.fn.bhandsFileUploader = $.fn.BhandsFileUploader;
    $pc.fn.extend = $pc.extend = $.extend;

    //Interface
    $pc.fn.extend({
        GetIFrame: function () {
            return this.IFrame;
        },
        //업로드프레임을 초기화 한다.
        Reset: function () {
            $(this.IFrame).attr("src", this.options.src);
        },
        GetCurrentURL: function () {
            var currentURL = undefined;
            try {
                currentURL = $(this.IFrame)[0].contentWindow.location.href;
            } catch (ex) {
                //Nothing
                currentURL = "";
            }
            return currentURL;
        },
        GetResult: function () {
            var result = undefined;

            try {
                result = $("#result", $(this.IFrame).contents()).val();
            }
            catch (ex) {
                //Nothing
            }
            return result;
        },
        GetKey: function () 
        {
            return this.options.key;
        }
    }); //End Extend

} (window.jQuery || window.$));