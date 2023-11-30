/*기본 Tab정의
----------------------------------------------------------------------------*/
/*btn의 동작반영*/
$.jbtn_action = function(target,btnIndex) {
	$(target).addClass('on').siblings().removeClass('on');
	$(target).closest('.jquery_a').find('.jbtnlist_a').children().removeClass('on').hide().eq(btnIndex).addClass('on').fadeIn(100);
	$.jquery_Test(target,btnIndex); // TEST 정보 넣기 [삭제]
	return true;
}
/*TEST용 정보 넣기 [삭제] */
$.jquery_Test = function(target,btnIndex) {
	var btnLengthClass = $(target).closest('.jbtn_a').attr('class');
	$(target).closest('.jquery_a').find('.tab_index').text(btnIndex)
	.closest('.jquery_a').find('.jbtn_num').text(btnLengthClass);
	return true;	
}
/*초기 html세팅*/
$.html_Setting = function() {
	/*jbtn의 개수넣기*/
	$('.jbtn_a>dd,.jbtn_a>li').each(function() {
		var btnLength = $(this).closest('.jbtn_a').children('dd,li').length;
		$(this).closest('.jbtn_a').addClass('tabnum'+btnLength);
	});

	/*버튼 last에 last클래스 넣기*/
	$('.jbtn_a>dd,.jbtn_a>li').filter(':last-child').addClass('last')
		/* 같은효과
		$('.jbtn_a>dd,.jbtn_a>li').filter(':last-child').each(function() {
			$(this).addClass('last');
		});*/
	return true;
}
/*엑션 세팅*/
$(function(){
	/*기본실행*/
	$.html_Setting();
	
	/*Tab*/
	$('.jbtn_a>dd,.jbtn_a>li').bind('click','focus', function() {
		var btnIndex = $(this).index();
		$.jbtn_action(this,btnIndex);
		return false;
	});
	/*radio버튼*/
	$('.jbtn_a input:radio').focus(function() {
		/*label이 input앞에 있는지 뒤에 있는지에 따라 btn index기준 바꾸기*/
		if($(this).next("label").length > 0){
			var btnIndex = $(this).index()/2;
		} else {
			var btnIndex = $(this).parent('label').index();
		}
		//alert(btnIndex);
		$.jbtn_action(this,btnIndex);
			return false;
			/*$("#blk-"+$(this).val()).show('slow');*/
	});
});


/*input 기본정의
----------------------------------------------------------------------------*/
$(document).ready(function () {
	/*input TEXT Action*/
    $('input:not(:checkbox,:radio),textarea').focus(
    function(){
		$(this).removeClass('jtxtoff');
        $(this).addClass('jtxton');
    });
    $('input:not(:checkbox,:radio),textarea').blur(
    function(){
        $(this).removeClass('jtxton placeholdersjs'); //textarea에 placeholdersjs가 계속 잔류하는 증상 수정
        $(this).addClass('jtxtoff');
    });
});

/*checkbox, radio정의*/
$(function() {
	//기본 ezmark실행
	$('input[type=radio]').ezMark();
	$('input[type=checkbox]').ezMark();
	//전체체크버튼이 아닌 것
	var $not_check_allbutton = $(".check_all_area input:checkbox:not('.check_all')")
	/*all 버튼을 클릭시*/
	$(".check_all").change(function () {
        var $check_all_area = $(this).closest(".check_all_area").find("input:checkbox").not('.not-chk');
		var $check_allbutton = $(this).closest(".check_all_area").find("input:checkbox.check_all");
			$check_all_area.prop('checked', $(this).prop("checked"));
		if ( $check_allbutton.is(':checked') ) {
            $check_all_area.parent('.ez-checkbox').addClass('ez-checked');
            if ($('#FooterButtonArea').length > 0) {
                $("html, body").animate({
                    scrollTop: $('#FooterButtonArea').offset().top
                }, 500);
            }
            

		} else {
			$check_all_area.removeAttr('checked');
			$check_all_area.parent('.ez-checkbox').removeClass('ez-checked');
			}
	})
	/*all 버튼외의 버튼이 클릭시*/
	$(".ez-checkbox input:checkbox:not('.check_all')").click(function () {
		var $check_allbutton = $(this).closest(".check_all_area").find("input:checkbox.check_all:first");
		var $check_frist_allbutton = $("body .check_all_area input:checkbox.check_all:first");
		if ( $check_allbutton.is(':checked') ) {
			$check_allbutton.removeAttr('checked');
			$check_frist_allbutton.removeAttr('checked');
			$check_allbutton.parent('.ez-checkbox').removeClass('ez-checked');
			$check_frist_allbutton.parent('.ez-checkbox').removeClass('ez-checked');
		}
	});
});


	

/*select 기본정의
----------------------------------------------------------------------------*/
$(function() {
  $('select, .select').selectric();

  $('.customOptions').selectric({
	optionsItemBuilder: function(itemData, element, index){
	  return element.val().length ? '<span class="ico ico-' + element.val() +  '"></span>' + itemData.text : itemData.text;
	}
  });
});


/*터치반응정의
----------------------------------------------------------------------------*/
$(document).ready(function() { //터치하고 드래그하면 링크 안먹게 한다.
	var dragging = false;
	$(".touch").on("touchmove", function(){ // a, .touch 에만 적용한다.
	  dragging = true;
	});
	$(".touch").on("touchend", function(e){
	  if (dragging){
		e.preventDefault();
	}
	else {var el = $(this);
	var link = el.attr('href');
	window.location = link;
	}    
	});
	$("a,.touch").on("touchstart", function(){
	dragging = false;
	});
});

/*기타정의
----------------------------------------------------------------------------*/
$(function() {
	/*회원탈퇴시 ETC를 선택하면*/
	$(".term_b.off:first").addClass("offfirst_b");
	
	
	$('input:checkbox.check_etc').click(function() {
		if ( $(this).is(':checked') ) {
			$(this).closest('.reason_a').find('.reasonetc_a').slideDown();
		} 
		else {
			$(this).closest('.reason_a').find('.reasonetc_a').slideUp();
		}
	});
	/*ID를 선택하면*/
	$('.id_list .input_b,.id_list input:radio').click(function() {
		$target = $(this).closest('.id_list').find('dl').not('.mark');
		$targetdl = $(this).closest('dl');
		$(this).closest('.id_list').find('dl').removeClass('mark');
		$(this).closest('dl').addClass('mark');
		/*사용못하는 ID에 mark가 들어가면*/
		if ($targetdl.is('dl.not.mark')) {
			$target.find('.anotherid_a').slideUp(200);
			$targetdl.find('.anotherid_a').slideDown(500);
		} else {
			$target.find('.anotherid_a').slideUp(200);
		}
	});

	/*약관동의 삼성공동멤버십 약관 열기*/
    //$('.term_s .term_b a.detail').click(function () {
    //    var $selectBox = $(this).closest('.term_b').find('.txt_a');

    //    alert("A");
    //    $selectBox.slideToggle(200);
    //});
 //   $('.term_s .term_b a.detail').click(function () {
 //       //$(".txt_a").css("display", "none");
	//	var $selectBox = $(this).closest('.term_b').find('.txt_a');

 //       //if ($(this).attr("chkView") == "1") {
 //       //    $(this).parent().parent().parent().parent().find(".txt_a").css("display", "block");
 //       //} else {
 //       //    $(this).parent().parent().parent().find(".txt_a").css("display", "block");
 //       //}


	//	$selectBox.slideToggle(200);
	//});
});

/*기타정의 시작
----------------------------------------------------------------------------*/
