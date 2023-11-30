var Agreement = {
    init: function () {
        window.name = "Parent_window";
        Agreement.events();
        Agreement.sizeInit();
        setTimeout(Agreement.sizeInit, 500);
    },

    events: function () {

        $("#btnCPCLIENT, #btnCPCLIENT2").on('click', function () {
            Agreement.executeCPClient();
        });        
    },

    executeCPClient: function () {

        document.domain = window.location.hostname;

        window.open('', 'popupCPClient', 'width=500, height=461, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
        $("[name=formCPClientRequest]").attr("target", "popupCPClient");
        $("[name=formCPClientRequest]").attr("action", "https://nice.checkplus.co.kr/CheckPlusSafeModel/service.cb");
        $("[name=formCPClientRequest]").submit();
    },

    sizeInit: function () {
        var getDocHeight = document.body.scrollHeight;
        window.parent.postMessage({ message: 'iframeHeight|' + getDocHeight + ',ajaxFlag|0,UserId|,userDinfo|' }, "*");
    }
};


$(document).ready(function () {
    Agreement.init();
});