if ($) {
    $(document).ready(function() {
        $(".new-comment").hide()
        $(".comment-button").bind('click', function() {
            $( ".new-comment").slideDown()
            $(".comment-button").hide()
        });
    });
}
