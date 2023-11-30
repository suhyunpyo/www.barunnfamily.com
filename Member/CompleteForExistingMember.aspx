﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteOne.Master" AutoEventWireup="true" CodeBehind="CompleteForExistingMember.aspx.cs" Inherits="BarunnIntergrationService.Member.CompleteForExistingMember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


<style>
.step_a {background:url('https://www.barunnfamily.com/resources/img_inc/bg_pattern01.png') repeat left top; padding-top: 0px;}

.apcom_p {word-break:keep-all}
.apcom_p .cont_a { padding-bottom:0;}
.apcom_p .cont_a_in { background:url('https://www.barunnfamily.com//resources/member/bg_applycom.jpg') no-repeat left top; text-align:left; padding:40px 0 463px 0}
.apcom_p .cont_a .tit { margin-left:500px; margin-top:40px; font-size:28px; line-height:1.6}
.apcom_p .cont_a .txt { margin-left:500px;width:400px;font-size:18px; margin-top:46px; line-height:1.6}
.apcom_p .cont_a .b_btn_a { display:inline-block; margin-left:500px; margin-top:50px;}
.apcom_p.member_c .step_a_in .tit+ul { display:none}
.step_a_in ul li img {width:auto;padding:8px 0 5px 0;}
.b_btn.type2.right span {height:60px; line-height:60px; font-size:22px; background:url('/resources/img_inc/bul_arrow2_right.png') no-repeat right 50%; text-align:center;color:#fff;min-width:300px;}
.b_btn.type2.left span {height:60px; line-height:60px; font-size:22px; background:url('/resources/img_inc/bul_arrow2_left.png') no-repeat left 50%; text-align:center; color:#fff;min-width:300px;}

.cont_a {background-color:#f1f1f1; text-align:center;padding:40px 0 50px 0;}
    	.head_a_in, .cont_a_in, .familysite_a_in, .step_a_in {width: 1100px;margin:0 auto;
    	}
.b_btn.type2 {background-color:#2e96ff; }
b, strong { font-weight: normal; color:#2e96ff !important;}
body{background-color:#f1f1f1}

@charset "UTF-8";
/* 페이지가 "euc-kr에서는 [ @charset "euc-kr"; ]를 정의해야한다 */
/************************************************************************
 * 설명         : 모바일 반응형 적용
************************************************************************/
/*■■■■재정의■■■■*/
select {
    height: 40px;
    vertical-align: middle;
}
/* select jquery 끊기면서 Design유지용*/
@media screen and (max-width: 500px) {
    html, button, input, select, textarea {
    font: 18px/1.2 "맑은 고딕", "Malgun Gothic", "나눔고딕", "NanumGothic", "NanumGothicWEB", "돋움", Dotum, "굴림", Gulim, sans-serif;
    color: #666;
    letter-spacing: -1px;
    }
}

 html, button, input, select, textarea, .tit {
    font: 18px/1.2 "맑은 고딕", "Malgun Gothic", "나눔고딕", "NanumGothic", "NanumGothicWEB", "돋움", Dotum, "굴림", Gulim, sans-serif;
    color: #666;
    letter-spacing: -1px;
    }


@media screen and (min-width: 640px) and (max-width: 1024px) {
    @viewport {
        width: 640px;
    }
}

/*■■■■공통정의■■■■*/
@media screen and (max-width: 1100px) {
    .wrap {
        width: 100%;
        min-width: inherit;
    }
    /*header영역*/
    .head_a_in, .cont_a_in, .familysite_a_in, .step_a_in {
        width: auto;
    }

        /*스텝*/
        .step_a_in ul li,
        .step_a_in ul li.on {
            width: 24.88%;
        }

    /* 표 table or Div Style 정의 : Table안의 Table 사용가능하게 정의
----------------------- */
    .b_sel_line + label {
        padding: 0 2% 0 1%;
    }

    .b_dtable_1 dl.addr dd .row:first-child + .row + .row input {        width: 85% !important;
    }
}

@media screen and (max-width: 800px) {
    /* 표 table or Div Style 정의 : Table안의 Table 사용가능하게 정의
----------------------- */
    /*생년월일*/
    .b_dtable_1 dl.birth dd .b_sel_line {
        width: 24% !important
    }

        .b_dtable_1 dl.birth dd .b_sel_line select {
            width: 100% !important
        }

    .b_dtable_1 dl.birth .input_b {
        width: 15% !important;
        min-width: 60px !important;
        display: inline-block
    }
    /*전화번호*/
    .b_dtable_1 dl.phone dd .b_sel_line {
        width: 24% !important
    }

        .b_dtable_1 dl.phone dd .b_sel_line select {
            width: 100% !important
        }

    .b_dtable_1 dl.phone dd input {
        width: 24% !important
    }
    /*휴대번호*/
    .b_dtable_1 dl.cphone dd .b_sel_line {
        width: 24% !important
    }

        .b_dtable_1 dl.cphone dd .b_sel_line select {
            width: 100% !important
        }

    .b_dtable_1 dl.cphone dd input {
        width: 24% !important
    }
    /*이메일*/
    .b_dtable_1 dl.email dd input {
        width: 85% !important
    }

    .b_dtable_1 dl.email dd .b_sel_line {
        width: 87% !important
    }

        .b_dtable_1 dl.email dd .b_sel_line select {
            width: 100% !important
        }

    .b_dtable_1 dl.email dd span.noti {
        display: block;
    }
}

@media screen and (max-width: 700px) {
    /* 표 table or Div Style 정의 : Table안의 Table 사용가능하게 정의
----------------------- */
    .b_dtable_1 dt {
        float: inherit;
        width: 100%;
        min-height: 50px;
        line-height: 50px;
        padding: 0;
        font-weight: bold;
    }

        .b_dtable_1 dt.mark {
            background-image: none;
        }

            .b_dtable_1 dt.mark p {
                background: url('/resources/img_inc/icon_mark.png') no-repeat right 50%;
            }

        .b_dtable_1 dt p {
            padding-left: 5%;
            padding-right: 20px;
            display: inline-block;
        }

    .b_dtable_1 dd {
        float: inherit;
        width: 95%;
        padding: 0 0 2% 5%;
    }

    .b_dtable_1 .noti_email {
        margin-top: 0;
    }
    /*이름*/
    .b_dtable_1 dl.name dd input {
        width: 85% !important
    }

    .b_dtable_1 dl.name dd span.noti {
        display: block;
    }
    /*아이디*/
    .b_dtable_1 dl.id dd input {
        width: 85% !important
    }

    .b_dtable_1 dl.id dd span.noti {
        display: block;
    }
    /*비밀번호*/
    .b_dtable_1 dl.pw dd input {
        width: 85% !important
    }

    .b_dtable_1 dl.pw dd span.noti {
        display: block;
    }
    /*비밀번호 한번더*/
    .b_dtable_1 dl.pw2 dd input {
        width: 85% !important
    }

    .b_dtable_1 dl.pw2 dd span.noti {
        display: block;
    }
    /*주소*/
    .b_dtable_1 dl.addr dd .row + .row input {
        width: 85% !important
    }

    .b_dtable_1 dl.addr dd span.noti {
        display: block;
    }
    /*예식일*/
    .b_dtable_1 dl.cerem dd input {
        width: 70% !important
    }

    .b_dtable_1 dl.cerem dd span.noti {
        display: block;
    }
    /*웨딩홀*/
    .b_dtable_1 dl.whall .input_b {
        width: 45% !important;
        min-width: 60px !important;
        display: inline-block
    }
}

@media screen and (max-width: 650px) {
    .step_a_in ul li.on {
        width: 24.6%;
    }

    .step_a_in ul li img {
        width: 80%;
    }
    /* button Style 정의
----------------------- */
    .b_btn.type2 {
        width: 300px;
    }

    .term_p .b_btn.type2,
    .form_p .b_btn.type2,
    .mmodi_p .b_btn.type2,
    .mleave_p .b_btn.type2 {
        width: 40% !important;
    }

    .b_btn.type2 span {
        min-width: 100% !important;
        font-size: 16px;
        letter-spacing: -2px;
        background-size: auto 30% !important;
    }

    .b_btn.type2.left span {
        text-indent: 20px;
        font-size: 16px;
        letter-spacing: -2px;
    }

    .b_btn.type2.right span {
        text-indent: -20px;
        font-size: 16px;
        letter-spacing: -2px;
    }
}

@media screen and (max-width: 600px) {
    .familysite_a .list_a dd {
        margin-left: 10px;
    }
}

@media screen and (max-width: 500px) {
    .head_a .ci {
        margin-top: 20px;
        width: 50%
    }

        .head_a .ci img {
            width: 100%;
            max-width: 220px;
        }

    .head_a .bi {
        text-align: right;
        width: 48%;
        margin-top: 18px;
    }

    .step_a_in .tit {
        padding: 15px 0 12px;
    }

        .step_a_in .tit img {
            height: 30px;
        }

    /* 표 table or Div Style 정의 : Table안의 Table 사용가능하게 정의
----------------------- */
    .b_dtable_1 .input_b {
        display: block;
        margin-top: 10px;
    }

    .b_dtable_1 dd div:first-child.row input {
        width: 20px !important;
    }
}

@media screen and (max-width: 450px) {
    .head_a .ci {
        margin-top: 23px;
    }

    .head_a .bi img {
        height: 26px;
    }

    .step_a_in ul li.on {
        width: 24.4%;
    }

   .foot_a {
    text-align: center;
    padding: 30px 0 50px;
    clear: both;
    color: #aeaeae;
}

    .foot_a strong {
        color: #fff;
    }

    .familysite_a .list_a dl {
        max-width: 350px;
        margin: 0 auto;
        padding-bottom: 5px;
    }
}

@media screen and (max-width: 400px) {
    .head_a .ci {
        margin-top: 20px;
    }

    .head_a .bi img {
        height: 20px;
    }
}

/*■■■■페이지별정의■■■■*/
/*회원가입메인
-------------------------------*/
@media screen and (max-width: 900px) {
    .welcome_p .cont_a {
        height: 694px;
        position: relative
    }

    .welcome_p .cont_a_in {
        width: auto;
        width: 80%;
        height: 647px
    }

    .welcome_p .oneidinfo .txt {
        font-size: 14px;
    }
}

@media screen and (max-width: 600px) {
    .welcome_p .cont_a {
        background: url('/resources/member/bg_welcome_m.jpg') no-repeat 50% bottom;
        background-size: auto 420px;
        background-color: #ab605d;
        height: auto;
        min-height: 600px;
        position: relative
    }

    .welcome_p .cont_a_in {
        width: auto;
        background: none;
        height: auto;
        padding-top: 30px
    }

        .welcome_p .cont_a_in .subcopy {
            margin-top: 0px;
        }

            .welcome_p .cont_a_in .subcopy,
            .welcome_p .cont_a_in .subcopy + .tit {
                text-align: center
            }

                .welcome_p .cont_a_in .subcopy img {
                    content: url('/resources/member/txt_welcome_01_m.png');
                    width: 70%;
                    max-width: 360px;
                }

                .welcome_p .cont_a_in .subcopy + .tit img {
                    width: 70%;
                    max-width: 399px;
                }

        .welcome_p .cont_a_in .b_btn_a {
            text-align: center;
            margin-top: 30px;
        }

    .welcome_p .oneidinfo {
        text-align: center;
        font-size: 12px;
        background-color: rgba(0, 0, 0, 0.4);
        position: absolute;
        width: 100%;
        bottom: 0;
        padding: 10px 0;
    }

        .welcome_p .oneidinfo .tit {
            border-color: #fff;
        }

        .welcome_p .oneidinfo .txt {
            font-size: 14px;
            color: #fff;
            margin-top: 10px;
        }
}

@media screen and (max-width: 400px) {
    .welcome_p .cont_a {
        min-height: 550px;
    }

    .welcome_p .oneidinfo .txt {
        font-size: 12px;
        color: #fff;
    }

    .welcome_p .cont_a_in .b_btn_a {
        margin-top: 10px
    }

    .welcome_p .b_btn_a .b_btn.type4 span {
        height: 50px;
        line-height: 50px;
        width: 200px;
    }
}

/*본인인증
-------------------------------*/
.authway_a dl a {
    -webkit-transition: width 0s;
    -moz-transition: width 0s;
    -ms-transition: width 0s;
    -o-transition: width 0s;
    transition: width 0s;
}

@media screen and (max-width: 950px) {
    .authway_a {
        width: 650px;
    }

        .authway_a dl a {
            width: 300px
        }

    /*case-기존ID다수보유*/
    .selectid_b {
        width: 95%;
    }

        .selectid_b .id_list dl.mark {
            background-image: none;
        }
}

@media screen and (max-width: 800px) {
    .authway_a {
        width: 550px;
    }

        .authway_a dl a {
            width: 250px;
            padding-top: 0;
            height: auto;
            padding-bottom: 20px;
        }

        .authway_a dl dd img {
            width: 150px;
        }
}

@media screen and (max-width: 700px) {
    /*case-기존ID다수보유*/
    .selectid_b .id_list dt {
        width: 38%;
    }

        .selectid_b .id_list dt .input_b {
            margin-left: 10px;
        }

    .selectid_b .id_list dd.date {
        width: 22%
    }

    .selectid_b .id_list dd.id {
        width: 40%
    }
    /*아이디입력*/
    .selectid_b .anotherid_a {
        padding-left: 10px;
    }
}

@media screen and (max-width: 650px) {
    .authway_a {
        width: 430px;
    }

        .authway_a dl a {
            width: 200px;
            min-height: 180px;
            padding-bottom: 10px;
        }

        .authway_a dl dd img {
            width: 100px;
        }

    .cont_a_in > .tit img {
        width: 80%;
    }

    .cont_a_in > .tit + .txt {
        width: 80%;
        margin: 0 auto;
        margin-top: 20px;
    }

    .authway_a dl dt {
        font-size: 18px;
        letter-spacing: -2px;
    }

    .authway_a dl dd {
        font-size: 14px
    }

    .authway_a dl a {
        border: 5px solid #fff;
    }
    /*case-기존ID다수보유*/
    .condition_noti {
        font-size: 16px;
        width: 80%;
        margin: 0 auto
    }
}

@media screen and (max-width: 500px) {
    .authway_a {
        width: 290px;
    }

        .authway_a dl a {
            width: 130px;
            padding-top: 0;
        }

        .authway_a dl dd img {
            width: 80px;
        }

        .authway_a dl dt {
            font-size: 14px;
        }

            .authway_a dl dt + dd {
                font-size: 12px;
            }

    .failnoti_a dt {
        font-size: 16px;
    }

    .failnoti_a dd {
        font-size: 12px;
        width: 80%;
        margin: 0 auto;
        margin-top: 10px;
    }
    /*case-기존ID다수보유*/
    .selectid_b .date_info {
        width: 90%;
        margin: 0 auto;
    }

        .selectid_b .date_info + p {
            font-size: 16px;
        }
    /*아이디입력*/
    .selectid_b .anotherid_a span.noti {
        display: block;
        padding-left: 0;
        padding-top: 10px;
    }
}

@media screen and (max-width: 450px) {
    /*case-기존ID다수보유*/
    .selectid_b .id_list dt, .selectid_b .id_list dd {
        height: 20px;
        line-height: 20px;
        padding-top: 10px;
    }

    .selectid_b .id_list dt {
        width: 50%;
    }

    .selectid_b .id_list dd.date {
        width: 40%;
        text-align: right;
        float: right;
        padding-right: 10px !important;
    }

    .selectid_b .id_list dd.id {
        clear: left;
        padding-left: 40px;
        padding-bottom: 5px;
        padding-top: 5px;
        width: 100%;
    }

    .selectid_b .id_list.oneid dt label {
        margin-left: 20px;
    }

    .selectid_b .id_list.oneid dd.id {
        padding-left: 25px;
    }
}

/*약관동의
-------------------------------*/
@media screen and (max-width: 1100px) and (min-width: 750px) {
}

@media screen and (max-width: 1100px) {
    .term_p .agreeall_a {
        padding: 0 20px
    }

        .term_p .agreeall_a .b_btn_a {
            margin-right: 10px;
        }

    .term_s .term_b {
        margin: 0 20px
    }
}

@media screen and (max-width: 850px) {
    .term_s .term_b > h2 {
        font-size: 16px;
    }

    .term_s .term_b.off > h2 {
        margin-bottom: 50px;
    }

    .term_s .term_b.off .input_b {
        left: 0;
        right: auto;
        top: 60px;
    }

    .term_s .term_b.off .txt_a {
        margin-top: 60px;
    }
}

@media screen and (max-width: 750px) {
    .agreeall_a .input_b {
        float: inherit;
        margin: 0 auto;
    }

    .term_p .agreeall_a .b_btn_a {
        clear: both;
        float: none;
        margin-top: 10px;
        margin-right: inherit;
    }
}

@media screen and (max-width: 650px) {
    .term_s .term_b .txt_a {
        height: 150px;
    }

    .policy_a {
        font-size: 12px;
        font-family: "돋움", Dotum, "굴림", Gulim, sans-serif;
    }
    /*기준폰트 줄이기*/
}

@media screen and (max-width: 500px) {
    .term_s .term_b.off > h2 {
        margin-bottom: 45px;
    }

    .term_s .term_b.off .input_b {
        top: 45px
    }
}

@media screen and (max-width: 450px) {
    .agreeall_a label {
        font-size: 12px;
        letter-spacing: -2px;
    }

        .agreeall_a label strong {
            font-size: 16px;
        }

    .term_s .term_b .input_b {
        font-size: 12px;
        letter-spacing: -1px;
    }

    .term_s .term_b .detail {
        font-size: 14px;
    }

    .term_s .term_b.off {
        padding-top: 20px;
        padding-bottom: 20px;
    }

        .term_s .term_b.off > h2 {
            font-size: 14px;
        }
}

/*회원가입완료
-------------------------------*/
@media screen and (max-width: 1100px) {
    .apcom_p .affiliated_join {
        display: none;
    }
}

@media screen and (max-width: 1100px) and (min-width: 651px) {
    .apcom_p .cont_a_in {
        background-position: 38% top
    }

    .apcom_p .cont_a .tit {
        margin-left: 42%
    }

        .apcom_p .cont_a .tit img {
            width: 90%;
            max-width: 400px;
        }

    .apcom_p .cont_a .txt {
        width: 55%;
        max-width: 400px;
        margin-left: 42%
    }

    .apcom_p .cont_a .b_btn_a {
        margin-left: 42%;
        text-align: left;
    }
}

@media screen and (max-width: 650px) {
    .apcom_p .b_btn.type2 {
        width: 200px !important;
    }
}

@media screen and (max-width: 650px) {
    .apcom_p .cont_a_in {
        padding: 0 0 50% 0;
        background-position: -45% 270px;
        background-size: 130% auto
    }

    .apcom_p .cont_a .tit {
        margin-left: 0;
        margin-top: 30px;
        text-align: center
    }

        .apcom_p .cont_a .tit img {
            width: 80%;
            max-width: 400px;
        }

    .apcom_p .cont_a .txt {
        text-align: center;
        width: 90%;
        font-size: 16px;
    }

    .apcom_p .cont_a .b_btn_a {
        margin-left: 0;
        width: 100%;
    }
}

@media screen and (max-width: 500px) {
    .apcom_p .cont_a .tit {
        font-size: 18px;
    }

    .apcom_p .cont_a .txt {
        font-size: 14px;
    }
}

@media screen and (max-width: 380px) {
    .apcom_p .cont_a .b_btn.type1 {
        width: 200px;
        display: inline-block;
        margin-bottom: 10px;
    }

    .apcom_p .cont_a .b_btn_a {
        margin-top: 30px
    }
}


/* 회원정보수정
-------------------------------*/
@media screen and (max-width: 600px) {
    .mmodi_p .b_noti01 {
        width: 90%;
        margin: 0 auto;
    }
}

/* 회원탈퇴이유
-------------------------------*/
@media screen and (max-width: 1100px) {
    .mleave_p .leave_noti {
        margin-left: 5%;
    }

    .mleave_p .reason_a {
        width: 83%
    }
}

@media screen and (max-width: 650px) {
    /*폰트조정*/
    .mleave_p .leave_noti .b_noti01 li {
        letter-spacing: -2px;
    }
}

@media screen and (max-width: 600px) {
    .mleave_p .reason_a {
        width: 85%;
        padding: 15px 20px
    }

        .mleave_p .reason_a ul li {
            font-size: 14px;
            letter-spacing: -2px;
        }

    .mleave_p .leave_noti .b_noti01 {
        padding-right: 20px;
    }
}

@media screen and (max-width: 500px) {
    /*html폰트조정*/
    .mleave_p .reason_a ul li {
        float: inherit;
        width: 100%;
    }
}


/* 회원탈퇴완료
-------------------------------*/
@media screen and (max-width: 900px) {
    .mleave_p .goodbye_txt p.tit img {
        content: url('/resources/mypage/txt_member_leave_2_2.png');
    }

    @media screen and (max-width: 650px) {
        /*폰트조정*/
        .mleave_p .goodbye_txt p.tit {
            margin-top: 0;
        }

            .mleave_p .goodbye_txt p.tit + p {
                font-size: 18px;
                margin-top: 30px
            }
    }

    @media screen and (max-width: 600px) {
        .mleave_p .goodbye_txt p.tit img {
            width: 90%;
            max-width: 460px;
        }

        .mleave_p .goodbye_txt {
            width: 90%;
            padding: 0 5%;
        }
    }




    /* OOOOOOOOOOOOOOOOOOOOOO
-------------------------------*/
    @media screen and (max-width: 1100px) {
    }

    @media screen and (max-width: 950px) {
    }

    @media screen and (max-width: 900px) {
    }

    @media screen and (max-width: 850px) {
    }

    @media screen and (max-width: 800px) {
    }

    @media screen and (max-width: 750px) {
    }

    @media screen and (max-width: 700px) {
    }

    @media screen and (max-width: 650px) { /*1차폰트조정*/
    }

    @media screen and (max-width: 600px) {
    }

    @media screen and (max-width: 500px) { /*2차폰트조정*/
    }

    @media screen and (max-width: 450px) {
    }

    @media screen and (max-width: 400px) {
    }


</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<!-- contents -->
	<div class="cont_a">
		<div class="cont_a_in">
            <input type="hidden" name="sendUserId" id="sendUserId" value="<%=UserId%>" />
            <input type="hidden" name="rouletteKey" id="rouletteKey" value="<%=RouletteKey != null ? RouletteKey : ""%>" />
            <input type="hidden" name="resultCode" id="resultCode" value="<%=ResultCode.HasValue ? ResultCode.Value.ToString() : ""%>" />
            <input type="hidden" name="errorMsg" id="errorMsg" value="<%=ErrorMsg != null ? ErrorMsg : ""%>" />

			<div class="tit">회원님은 <strong><asp:Literal ID="ltrUserID" runat="server"></asp:Literal></strong> 아이디로<br> 가입되어 있습니다.</div>
			<p class="txt">위의 아이디로 로그인 해주시기 바랍니다.<br>
			비밀번호가 기억나지 않으시면 비밀번호 찾기를 클릭해 주세요.</p>
			<!-- 하단버튼 -->
			<div class="b_btn_a">
                <a href="javascript:;" id="btnGoLogin" class="b_btn type1" runat="server" target="_parent" ><span>로그인하기</span></a>
                <a href="javascript:;" id="btnGoFindPassword" class="b_btn dim type1" runat="server" target="_parent" ><span>비밀번호찾기</span></a>
			</div>
			<!-- / 하단버튼 -->
		</div>
	</div>
	<!-- / contents -->
    <script type="text/javascript">
        $(document).ready(function () {

            /*룰렛 이벤트 API 연동*/
            if ($("#rouletteKey").val() != "" && $("#resultCode").val() != "" && $("#errorMsg").val() != "") {

                var userid = $("#sendUserId").val();
                var roulettekey = $("#rouletteKey").val();
                var resultcode = Number($("#resultCode").val());
                var errormsg = $("#errorMsg").val();

                if (resultcode == 1) {
                    //중복 응모 여부 체크 및 응모 정보 저장
                    fnRouletteEventApply(userid, roulettekey);
                } else if (resultcode == -1) {
                    alert(errormsg + "!!\n\n고객센터에 문의바랍니다.");
                } else if (result.resultcode == -2) {
                    alert(errormsg + "!!\n\n고객센터에 문의바랍니다.");
                } else {
                    alert(errormsg + "!!\n\n고객센터에 문의바랍니다.");
                }
            }

        });

        $(".wrap .step_a").html("<div style=\"height:50px;\"></div>");
        $("#MasterBody").removeClass("apcom_p member_c").addClass("auth_p");

        function fnRouletteEventApply(userid, roulettekey) {

            var paramData = JSON.stringify({
                "userId": userid,
                "partnerCode": "enmad",
                "extendData": roulettekey
            });

            $.ajax({
                type: "POST",
                url: "CompleteForExistingMember.aspx/applyJehu",
                contentType: "application/json; charset=utf-8",
                data: paramData,
                crossDomain: false,
                dataType: "json",
                async: false,
                success: function (result) {

                    var resultData = JSON.parse(result.d);

                    if (resultData.RESULT == true) {
                        if (resultData.VALUE == "N") {
                            alert("룰렛 이벤트에 참여해 주셔서 감사합니다.\n\n룰렛 이벤트 참여 시 입력하신 휴대전화번호로 경품이 발송됩니다.");
                        } else {
                            alert("이벤트에 응모하신 내역이 있습니다.");
                        }
                    }
                },
                error: function (a, b, c) {
                    //alert("Error:" + a.status + a.statusText + b + c);
                    alert("Ajax 통신 에러!!\n\n고객센터에 문의바랍니다.");
                }
            });
        }


    </script>
</asp:Content>
