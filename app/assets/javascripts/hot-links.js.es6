$(document).ready(function(){

  $.ajax({
    type: 'GET',
    url: 'http://localhost:3001',
    headers: { Accept: "application/json", "Content-Type": "application/json" }
  }).then(updateHotLinks)
    .fail(displayFailure);

});

function updateHotLinks(links){
  console.log(links);
}

function displayFailure(failureData){
  alert("FAILED attempt to update links: " + failureData.responseText);
}
