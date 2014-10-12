$(document).ready(function () {
  
$(".logo").click(function(){
       window.location = $(this).find("a:first").attr("href");
       return false;
   });
   
  new Morris.Bar({
    // ID of the element in which to draw the chart.
    element: 'chart',
    // Chart data records -- each entry in this array corresponds to a point on
    // the chart.
    data: $('#chart').data('moments'),
    // A list of names of data record attributes that contain y-values.
    xkey: "created_at",
    // Labels for the ykeys -- will be displayed when you hover over the
    // chart.
    ykeys: ["accum_value"],
    // The name of the data record attribute that contains x-values.
    labels: ['Value']
  });
   
});

 