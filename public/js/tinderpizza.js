$(function(){

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

