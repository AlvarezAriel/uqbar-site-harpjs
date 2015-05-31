$( document ).ready(function(){
    $(".button-collapse").sideNav();

    var options =
    {
        offset: 0,
        onTopHidden: function( elm, distance_scrolled ) {
            $('nav').removeClass('transparent-nav');
        },
        onTopIn:function(){$('nav').addClass('transparent-nav');}
    };
    $('#hero-logo').scrollfire(options);
});
