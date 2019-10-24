$(document).ready(function() {

  console.log(hello)

    //   $.get('http:/localhost:9292/booking_requests/1/new', function(data) {
    //   console.log(data)
    // });

      $(function () {
        $('#datetimepicker1').datetimepicker({
          format: 'DD/MM/YYYY',
          minDate: '2019/12/03',
          maxDate: '2019/12/24',
          disabledDates: [
          '2019/12/16',
          '2019/12/12'
          ]
        });
     });

});
