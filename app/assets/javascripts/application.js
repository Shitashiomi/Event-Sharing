// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar
//= require_tree .

// 画面遷移を検知 カレンダー機能実装
$(document).on('turbolinks:load', function () {
    // lengthを呼び出すことで、#calendarが存在していた場合はtrueの処理がされ、無い場合はnillを返す
    if ($('#calendar').length) {
        function eventCalendar() {
            return $('#calendar').fullCalendar({
                });
            };
            function clearCalendar() {
                $('#calendar').html('');
            };

            $(document).on('turbolinks:load', function () {
                eventCalendar();
            });
            $(document).on('turbolinks:before-cache', clearCalendar);

            $('#calendar').fullCalendar({
                events: '/events.json',
                titleFormat: 'YYYY年 M月',
                //曜日を日本語表示
                dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
                //ボタンのレイアウト
                header: {
                    left: '',
                    center: 'title',
                    right: 'today prev,next'
                },
                //終了時刻がないイベントの表示間隔
                defaultTimedEventDuration: '03:00:00',
                buttonText: {
                    prev: '前',
                    next: '次',
                    prevYear: '前年',
                    nextYear: '翌年',
                    today: '今日',
                    month: '月',
                    week: '週',
                    day: '日'
                },
                //イベントの時間表示を２４時間に
                timeFormat: "HH:mm",
                //イベントの色を変える
                eventColor: '#63ceef',
                //イベントの文字色を変える
                eventTextColor: '#000000',
                displayEventTime: false,
            });
//             var newEvent = new Object();
// 　　　　　　　　newEvent.title = "Something";
// 　　　　　　　　newEvent.start = new Date();
// 　　　　　　　　newEvent.allDay = false;
// 　　　　　　　　newEvent.className = "hideCalendarTime";
        }
        // ここまで

// スライドショーの記述 ここから
$("#theTarget").skippr({
    // スライドショーの変化 ("fade" or "slide")
    transition : 'slide',
    // 変化に係る時間(ミリ秒)
    speed : 2000,
    // easingの種類
    easing : 'easeOutQuart',
    // ナビゲーションの形("block" or "bubble")
    navType : 'block',
    // 子要素の種類("div" or "img")
    childrenElementType : 'div',
    // ナビゲーション矢印の表示(trueで表示)
    arrows : true,
    // スライドショーの自動再生(falseで自動再生なし)
    autoPlay : true,
    // 自動再生時のスライド切替間隔(ミリ秒)
    autoPlayDuration : 3000,
    // キーボードの矢印キーによるスライド送りの設定(trueで有効)
    keyboardOnAlways : true,
    // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
    hidePrevious : false
    });
});
          //ここまで

          $(function(){
            // #back-to-topを消す
            $("#back-to-top").hide();

            // スクロールが十分された時に#back-to-topを表示。スクロールされたら非表示
            $(window).scroll(function(){
            // this(window要素)がどれだけスクロールしたかをscrollTop()を使って値を取る
            $('#pos').text($(this).scrollTop());
              if ($(this).scrollTop() > 60){
                $("#back-to-top").fadeIn();
              }else{
                $('#back-to-top').fadeOut();
              }

           });

            //#back-to-topがクリックされたら上に戻る
            // animateメソッドを使用
            $('#back-to-top a').click(function() {
            $('html, body').animate({
              scrollTop:0
             }, 800);
             return false;
          });

     });

// スクロールイベントの記述ここから
$(function(){
  $('.effect content1').css("opacity","0");
  $(window).scroll(function (){
    $(".effect").each(function(){
      var imgPos = $(this).offset().top;
      var scroll = $(window).scrollTop();
      var windowHeight = $(window).height();
      if (scroll > imgPos - windowHeight + windowHeight/5){
        $("i, div",this).css("opacity","1" );
        $("i",this).css({
          "font-size": "100px",
          "padding": "0 20px 40px"
        });
      } else {
        $("i, div",this).css("opacity","0" );
        $("i",this).css({
          "font-size": "20px",
          "padding": "20px"
        });
      }
    });
  });
});
// ここまで