$(function(){

  // Ajaxify the New Pizza Form on the Pizzas Page
 
  $('#new-pizza-form-container-button').click(function(e){
    e.preventDefault();

    $(e.target).hide();

    // get the new form
    var promise = $.get('/pizzas/new');

    promise.done(function(data){
      // Stuff the form into our waiting div and show it
      var $container = $('#new-pizza-form-container');
      $container.html(data);
      $container.show();
    });
    
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

