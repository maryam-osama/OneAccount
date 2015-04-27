$(document).on('click', '#add_to_wishlist', function(){
    addToWishlist($("#hidden_app_id").text());
});

function addToWishlist(app_id) {
    $("#add_to_wishlist").text('Loading...');
    $.ajax({
        type: 'POST',
        url: '/wishlist?app_id=' + app_id,
        success: function(data) {
            $("#add_to_wishlist").text('Remove from wishlist');
        }
    });
}

