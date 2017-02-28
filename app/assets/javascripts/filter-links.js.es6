$(document).ready(function(){

  $('.filter_buttons').click(function(event){
    event.preventDefault();

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


  });
});
