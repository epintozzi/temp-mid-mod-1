$(document).ready(function(){

  $('.filter_buttons').click(function(event){
    if (event.target.name == "all-read") {
      $('#links-list div').each(function(){
        var link_class = this.className;
        var link_array = link_class.split(" ")
        if (link_array.includes("link-read-true")) {
          $(this).show();
        } else {
          $(this).hide();
        }
      });
    } else {
      $('#links-list div').each(function(){
        var link_class = this.className;
        var link_array = link_class.split(" ")
        if (link_array.includes("link-read-false")) {
          $(this).show();
        } else {
          $(this).hide();
        }
      });
    }
    event.preventDefault();

  });

  $('#filter-input').on('input', function(e){
    var search_term = $('#filter-input').val();
    $('#links-list div').each(function(){
      var title = $(this).find('h5').text();
      var url = $(this).find('.url-link').text();
      if(title.includes(search_term) || url.includes(search_term)){
        $(this).show();
      } else {
        $(this).hide();
      }
    });
  });



});
