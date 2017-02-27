var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){
  $('#links-list').on('click', '.mark-read', markRead)
})

function markRead(e){
  e.preventDefault();

  var $this = $(this).parents('.link');
  var linkId = $this.data('link-id');

  $.ajax({
    type: 'PATCH',
    url: '/api/v1/links/' + linkId,
    data: {read: true},
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  $(`.link[data-link-id=${link.id}]`).find(".read-status").text("Read Status:" + link.read);
  $(`.link[data-link-id=${link.id}]`).find("a.mark-read").hide();
}

function displayFailure(failureData){
  alert("FAILED attempt to update Link: " + failureData.responseText);
}
