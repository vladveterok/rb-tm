document.addEventListener("turbolinks:load", function mySorting() {
	
	$(".sortable").sortable({
	  update: function(e, ui) {
		$.ajax({
		  url:  $(this).data("url"),
		  type: "PATCH",
		  data: $(this).sortable('serialize'),
		});
	  }
	});
	});

document.addEventListener("mousedown", function mySorting() {

	$(".sortable").sortable({
		update: function(e, ui) {
		$.ajax({
			url:  $(this).data("url"),
			type: "PATCH",
			data: $(this).sortable('serialize'),
		});
		}
	});
	});
	
	
	