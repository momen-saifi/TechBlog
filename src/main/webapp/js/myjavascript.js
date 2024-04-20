function doLike(pid, uid) {
	console.log(pid + " " + uid);
	const d = {
		uid: uid,
		pid: pid,
		operation: 'like'
	};

	$.ajax({
		url: "LikeServlet",
		data: d,
		success: function(data, textStatus, jqXHR) {
			console.log(data);
			let likeButton = $("#likeButton");
			let likeCounter = $(".like-counter");
			let currentCount = parseInt(likeCounter.text());

			if (data.trim() === 'true') {
				likeButton.removeClass("btn-outline-light").addClass("btn-danger");
				// Replace the HTML content of the button, but keep the content of the span tag intact
				likeButton.html('Liked '+ '<i class="fa-regular fa-thumbs-up"></i>' + likeCounter.prop('outerHTML'));
				// likeCounter.text(currentCount + 1); // Increment like count
			} else if (data.trim() === 'false') {
				likeButton.removeClass("btn-danger").addClass("btn-outline-light");
				// Replace the HTML content of the button, but keep the content of the span tag intact
				likeButton.html('Like'+' <i class="fa-regular fa-thumbs-up"></i>' + likeCounter.prop('outerHTML'));
				//  likeCounter.text(currentCount - 1); // Decrement like count
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.error(errorThrown);
		}
	});
}


//



    function initializeLikeCounter(pid) {
        $(document).ready(function() {
            var postId = pid; // This gets the value of p.getPid() from Java and inserts it into the JavaScript code

            // Function to send AJAX request
            function sendLikeCountRequest() {
                $.ajax({
                    type : "GET",
                    url : "LikeCountServlet",
                    data : {
                        postId : postId
                    },
                    success : function(response) {
                        $(".like-counter").text(response); // Update the like counter with the received response
                    },
                    error : function(xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });
            }

            // Initial request when the page is ready
            sendLikeCountRequest();

            // Event listener for like button click
            $(document).on("click", "#likeButton", function() {
                sendLikeCountRequest();
            });

            // Additional event listeners
            // Event listener for page load
            $(window).on("load", function() {
                sendLikeCountRequest();
            });

            // Event listener for other actions on the page
            // Example: clicking another button
            $(document).on("click", "#otherButton", function() {
                // Perform some action
                // Then, update the like count
                sendLikeCountRequest();
            });

        });
    }
    // Call the function to initialize the like counter
