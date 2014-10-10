$(document).ready(function () {
  
$(".logo").click(function(){
       window.location = $(this).find("a:first").attr("href");
       return false;
   });
 
 };