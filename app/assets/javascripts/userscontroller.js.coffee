# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('.datepicker').datepicker({
                dateFormat : "dd MM yy",
                buttonImageOnly : true,
                buttonImage : "<%= asset_path('iconDatePicker.gif') %>",
                showOn : "both",
                changeMonth : true,
                changeYear : true,
                yearRange : "c-20:c+5"
            })