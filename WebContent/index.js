$(document).ready(function() {
	$('#searchQuery').keypress(function(event) {
		if(event.which == 13 ){
			var name = $('#searchQuery').val();
			getBooks(name);
		}
		
	});
	
	$("#searchBooks").click(function(){
		var name = $('#searchQuery').val();
		getBooks(name);
	});
	
	function getBooks(name){
		$.post('getBooksServlet', {
			yourName : name
		}, function(responseText) {
			response = $.parseJSON(responseText);
			if(response.results.length == 0){
				showToast();
			} else {
				drawTable(response);
			}
		});
	}
	
	function drawTable(response) {
		console.log("count of results : " + response.results.length)
		for (var i = 0; i < response.results.length; i++) {
			drawRow(response.results[i]);
		}
	}

	function drawRow(rowData) {
		var parent = $(".list-group");
    	var genDiv = "<div class='list-group-item'>\
					<div class='row'> \
						<div class='col-md-1'> \
							<figure class='pull-left'> <img \
								class='book-icon magnify' \
								src='"+rowData.artworkUrl100+"' \
								alt='placehold.it/350x250'> </figure> \
						</div> \
						<div class='col-md-8'> \
							<h4 class='list-group-item-heading'>"+rowData.trackName+"</h4> \
							<p class='list-group-item-text description-text'>"+rowData.description+" \
							</p> \
							<div class='tags'>";
    	$.each( rowData.genres, function( index,genre ) {
		  genDiv = genDiv + "<a href=''>"+genre+"</a>";
		});
			genDiv += "	</div> \
						</div> \
						<div class='col-md-3'> \
							<p> \
								<i class='far fa-calendar-alt' title='Pubished on'></i> : ";
			var currDate = new Date(rowData.releaseDate);
			var date = currDate.getMonth()+"-"+currDate.getDate()+"-"+currDate.getUTCFullYear();
			genDiv += date + "  \
							</p> \
							<p> \
								<i class='far fa-user-circle' title='Author'></i> : "+rowData.artistName+" \
							</p> \
							<p> \
								<i class='far fa-money-bill-alt' title='Price'></i> Price: "+rowData.price+" "+rowData.currency+" \
							</p> \
							<div class='stars'>";
			var hasHalf = rowData.averageUserRating % 1;
			var fullStars = Math.floor(rowData.averageUserRating);
			var i = 0;
			for(;i<fullStars;i++ ) {
			  genDiv = genDiv + "<i class='fas fa-star'></i>";
			}
			if(!(hasHalf == 0)){
				genDiv = genDiv + "<i class='fas fa-star-half'></i>";
				i++;
			}
			for(;i<5;i++){
				genDiv = genDiv + "<i class='far fa-star'></i>";
			}
			genDiv += " </div> \
							<p> \
								Average "+rowData.averageUserRating+" <small> / </small> 5  \
							</p> \
							<p> \
								by <i class='fas fa-users' title='Number of users reviewed'></i> "+rowData.userRatingCount+" reviewers \
							</p> \
						</div> \
					</div> \
				</div>";
    	parent.append(genDiv);
	}
	
	function showToast() {
	    var toastbar = $("#snackbar");
	    toastbar.addClass("show");
	    setTimeout(function(){ toastbar.removeClass("show"); }, 3000);
	}
});