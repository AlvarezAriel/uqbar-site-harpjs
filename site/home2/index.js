$( document ).ready(function(){
    $(".button-collapse").sideNav();

    var options =
    {
        offset: 50,
        onTopHidden: function( elm, distance_scrolled ) {
            $('.fixed-navbar').removeClass('transparent-nav');
        },
        onTopIn:function(){$('.fixed-navbar').addClass('transparent-nav');}
    };
    $('.static-nav').scrollfire(options);
});
