$(document).ready(function(){

  $.ajax({
    type: 'GET',
    url: 'https://murmuring-lake-24503.herokuapp.com/',
    headers: { Accept: "application/json", "Content-Type": "application/json" }
  }).then(updateHotLinks)
    .fail(displayFailure);

});

function updateHotLinks(links){
  var topLink = true;
  $(links).each(function(){
    var url = this[0];
    $("a[href='" + url + "']").each(function() {
      if (topLink){
        $(this).parent().prepend("<p class='top-tag'> top link </p>");
      } else {
        $(this).parent().prepend("<p class='hot-tag'> hot </p>");
      }
    });
    topLink = false;
  });
}

function displayFailure(failureData){
  alert("FAILED attempt to update links: " + failureData.responseText);
}
