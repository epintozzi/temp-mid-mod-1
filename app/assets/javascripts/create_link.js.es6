var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){
  $newLinkTitle = $("#link-title");
  $newLinkUrl  = $("#link-url");

  $("#new-link").on('submit', createLink);
})

function createLink (event){
  event.preventDefault();

  // console.log("win")

  var link = getLinkData();

 //  $.post("/api/v1/links", link)
 //   .then( renderLink )
 //   .fail( displayFailure )
 // }

 $.ajax({
   type: 'POST',
   url: '/api/v1/links',
   data: link,
 }).then(renderLink)
   .fail(displayFailure)
}

function getLinkData() {
 return {
   title: $newLinkTitle.val(),
   url: $newLinkUrl.val()
 }
}

function renderLink(link){
  $("#links-list").prepend( linkHTML(link) )
  clearLink();
}

function linkHTML(link) {

    return `<div class='link' data-link-id='${link.id}' id="link-${link.id}">
              <h5 class='link-title'>${ link.title }</h5>
              <a href='${ link.url }' class='link-url'>${ link.url }</a>

              <p class="link_read read-status">
                Read Status: ${ link.read }
              </p>
              <a href='/api/v1/links/${link.id}' class="mark-read">
                Mark as Read</a>
              <a href='/links/${link.id}/edit' class=''>Edit
              </a>
            </div>`
}

function clearLink() {
  $newLinkTitle.val("");
  $newLinkUrl.val("");
}

function displayFailure(failureData){
  alert("There was a problem. " + failureData.responseText);
}
