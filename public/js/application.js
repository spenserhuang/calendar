$('select').change(function() {

  var selectedOption = $(this).find('option:selected').text();

  var link = ""

  if ( selectedOption === "Today") {
    link = "/calendars/current_day"
  } else if ( selectedOption === "Current Week") {
    link = "/calendars/current_week"
  } else if ( selectedOption === "Current 5 Day") {
    link = "/calendars/five_day"
  } else if ( selectedOption === "Current Month") {
    link = "/calendars/current_month"
  } else if ( selectedOption === "Current Year") {
    link = "/calendars/current_year"
  } else if ( selectedOption === "Chosen Day") {
    link = "/calendars/chosen_day"
  } else if ( selectedOption === "Chosen Week") {
    link = "/calendars/chosen_week"
  } else if ( selectedOption === "Chosen 5 Day") {
    link = "/calendars/chosen_five_day"
  } else if ( selectedOption === "Chosen Month") {
    link = "/calendars/chosen_month"
  } else if ( selectedOption === "Chosen Year") {
    link = "/calendars/chosen_year"
  };

  var request = $.ajax({
    method: "GET",
    url: link,
  })

  request.done(function(response){
    var list = $(response).find('.main-display')
    $('.wrapper-div').empty();
    $('.wrapper-div').html(list)
  })

  request.error(function(){
    status: 404;
  });

})



$(".text-bar").on('click', '#submit-button', function() {
  event.preventDefault();

  var result = $('.text-bar').serialize()

  var request = $.ajax({
    method: "POST",
    url: '/calendars/choose_date',
    data: result,
  })

  request.done(function(response){
    var list = $(response).find('.main-display')
    $('.wrapper-div').empty();
    $('.wrapper-div').html(list)
  })

  request.error(function(){
    status: 404;
  });

})