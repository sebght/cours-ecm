
// at page load time
$(function(){
    $('input[data-role="tags"]').each(function() {
        var input = $(this);

        $.getJSON(input.data('service-url'), function(data) {
            input.tokenfield({autocomplete: {
                source: data,
                delay: 100
            }});
        })
    });

    $('button[data-role="addIngredient"]').click(function() {
        var index = $('#ingredients > div').length;

        $('#ingredients').append($('<div>').load('/admin/recettes/ingredientFormRow?ingredientIndex=' + index));
    });

    $('button[data-role="addSel"]').click(function() {
        var index = $('#ingredients > div').length;

        $('#ingredients').append($('<div>').load('/admin/recettes/ingredientFormRow?ingredientIndex='+index+"&ingredientName=sel"));
    });

    $('button[data-role="addPoivre"]').click(function() {
        var index = $('#ingredients > div').length;

        $('#ingredients').append($('<div>').load('/admin/recettes/ingredientFormRow?ingredientIndex='+index+"&ingredientName=poivre"));
    });


    $(document).on('click', 'button[data-role="removeIngredient"]', function() {
        $(this).parents('.row')[0].remove();
    });
});


