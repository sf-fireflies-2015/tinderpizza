$(function(){

  var spinnerHTML = '<div class="spinner"><div class="dot1"></div><div class="dot2"></div></div>';

  var $newPizzaContainer = $('#new-pizza-form-container');

  // Ajaxify the New Pizza Form on the Pizzas Page
 
  $('#new-pizza-form-container-button').click(function(e){
    e.preventDefault();

    // Hide the Button
    $(e.target).hide();


    $newPizzaContainer.html(spinnerHTML).addClass('loading').show();

    // get the new form
    var promise = $.get('/pizzas/new');

    promise.always(function(){
      $newPizzaContainer.removeClass('loading').empty();
    });

    promise.done(function(data){
      // Stuff the form into our waiting div and show it
      $newPizzaContainer.html(data);
    });
    
  });


    // Now make sure we submit via Ajax using delegate
  $('#new-pizza-form-container').on('submit','form', function(e){
    e.preventDefault();
    var $form = $(e.target);
    var promise = $.post('/pizzas', $form.serialize());
    promise.done(function(dataHtml){
      // All is well!!
      //console.log(dataHtml);
      
      // Remove the form 
      $newPizzaContainer.empty();
      var $pizzas = $('#pizzas');
      var $pizzaHtml = $(dataHtml);
      $pizzas.prepend($pizzaHtml);
      
      // Re-show the button
      $('#new-pizza-form-container-button').show();
    });
    promise.fail(function(jxhr, data){
      // Show the form again with errors
      $newPizzaContainer.html(jxhr.responseText);
    });
  });



  $('#new-topping-form-container-button').click(function(e){
    e.preventDefault();
    console.log(e);

    // Materialize Specific Code...
    $('#new-topping-modal').openModal();
  });
  

  // Hook up all the links which are supposed to submit via post 
  $('a.post_link').click(function (e) {
    e.preventDefault();
    var $link = $(this);

    var $form = $($link.data('formId'));

    var confirm_message = $link.data('confirm');

    if(!confirm_message || confirm(confirm_message)){
       $form.attr('action', this.href).submit();
     }
    return false;
  });

});

