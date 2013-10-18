$(function() {
  $( "#from" ).datepicker({
    minDate: 0,
    changeMonth: true,
    numberOfMonths: 1,
    onClose: function( selectedDate ) {
      $( "#to" ).datepicker( "option", "minDate", selectedDate );
      $( "#to" ).datepicker( "option", "disabled", false );
    }
  });
  $( "#to" ).datepicker({
    disabled: true,
    changeMonth: true,
    numberOfMonths: 1,
    onClose: function( selectedDate ) {
      $( "#from" ).datepicker( "option", "maxDate", selectedDate );
    }
  });
});
