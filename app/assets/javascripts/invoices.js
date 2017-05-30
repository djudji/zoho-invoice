$(document).on('turbolinks:load', function() {
  
  item_destroy_event();
  item_add_event();
  select_on_focus();

  // Calculation
  calculate();
  check_input_and_calculate();
});



function item_destroy_event(){
  $("form").on('click', '.item-destroy', function(e){
    $(this).closest('tr').find('td.item-remove').find('input[type=hidden]').attr('value','true');
    $(this).closest("tr").remove();
    e.preventDefault();
    calculate();
  });
}

function item_add_event(){
  var item_id = parseInt($('#items tbody:last-child').find('tr[data_id]').last().attr('data_id'));
  $('.add-items').on('click', function(e){
    //time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('#items tbody:last-child').append($(this).data('fields').replace(regexp, item_id+1));
    $('#items tr:last input[name*=quantity]').val('1');
    $('#items tr:last input[name*=rate]').val('0');
    $('#items tr:last input[name*=amount]').val('0');
    $('#items tr:last textarea[name*=description]').focus();
    e.preventDefault();
    select_on_focus();
    check_input_and_calculate();
  });
}

function select_on_focus(){
  $("input[type=text], textarea, input[type=number]").on('focus', function(e){
    $(this).select();
  });
}

function check_input_and_calculate(){
  $('input[name*=quantity], input[name*=rate], input[name*=sales_tax]').on('change', function(){
    if( $(this).val().length === 0 || !$.isNumeric($(this).val()) ) {
      $(this).val("0");
    }
    else {
      calculate($(this));
    }
  });
}

var index = 0;
function calculate(current_element){
  console.log("calculating " + index++);

  var quantity = parseFloat($(current_element).closest("tr").find('input[name*=quantity]').val());
  var rate = parseFloat($(current_element).closest("tr").find('input[name*=rate]').val());

  $(current_element).closest("tr").find('input[name*=amount]').val(quantity*rate);
  
  var sub_total = 0.0;
  $('#items tr input[name*=amount]').each(function(){
    sub_total += parseFloat($(this).val());
  });
  $('input[name*=sub_total]').val(sub_total);

  var sales_tax = parseFloat($('input[name*=sales_tax]').val());
  $("input[name~='invoice[total]']").val(sub_total+(sales_tax/100*sub_total));
}
