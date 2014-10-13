$(document).ready(function() {

 new Morris.Line({
    // ID of the element in which to draw the chart.
    element: 'showChart',
    // Chart data records -- each entry in this array corresponds to a point on
    // the chart.
    data: $('#showChart').data('moments'),
    // A list of names of data record attributes that contain y-values.
    xkey: "created_at",
    // Labels for the ykeys -- will be displayed when you hover over the
    // chart.
    ykeys: ["accum_value"],
    // The name of the data record attribute that contains x-values.
    labels: ['Value'],
    
    lineColors: ['#FF8636'],
    
    pointSize: ['5px'],
    
    pointFillColors: ['#54B1C4'],
    
    hideHover: 'auto',
    
    gridTextColor: ['#54B1C4'],
    
    gridTextFamily: ['Helvetica, sans-serif'],
    
    gridTextWeight: ['light'],
    
    resize: 'true'
  });
});