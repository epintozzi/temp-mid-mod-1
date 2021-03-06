var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){
  $('#links-list').on('click', '.mark-read', markRead)
  $('#links-list').on('click', '.mark-unread', markUnread)
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

function markUnread(e){
  e.preventDefault();

  var $this = $(this).parents('.link');
  var linkId = $this.data('link-id');

  $.ajax({
    type: 'PATCH',
    url: '/api/v1/links/' + linkId,
    data: {read: false},
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  $(`.link[data-link-id=${link.id}]`).find(".read-status").text("Read Status: " + link.read);
  if(link.read){
    // run when read
    $(`.link[data-link-id=${link.id}]`).find("a.mark-read").hide();
    $(`.link[data-link-id=${link.id}]`).addClass("link-read-true");
    $(`.link[data-link-id=${link.id}]`).removeClass("link-read-false");
    $(`.link[data-link-id=${link.id}]`).find("a.mark-unread").show();
  } else {
    //run when unread
    $(`.link[data-link-id=${link.id}]`).find("a.mark-unread").hide();
    $(`.link[data-link-id=${link.id}]`).addClass("link-read-false");
    $(`.link[data-link-id=${link.id}]`).removeClass("link-read-true");
    $(`.link[data-link-id=${link.id}]`).find("a.mark-read").show();
  }
}

function displayFailure(failureData){
  alert("FAILED attempt to update Link: " + failureData.responseText);
}
