document.addEventListener('DOMContentLoaded', () => {
    const movieId = getMovieIdFromUrl(); 
    if (movieId) {
        fetchMovieDetails(movieId); 
        fetchMovieReviews(movieId); 
    }

    const reviewForm = document.getElementById('review-form'); 
    if (reviewForm) {
        reviewForm.addEventListener('submit', handleReviewSubmit); 
        document.getElementById('movie-id-review').value = movieId; 
    }
});


function getMovieIdFromUrl() {
    const searchParams = new URLSearchParams(window.location.search); 
    return searchParams.get('id'); 
}


async function fetchMovieDetails(movieId) {
    
    const baseUrl = 'http://localhost:3001'; 
    try {
        const response = await fetch(`${baseUrl}/api/movies/${movieId}`); 
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`); 
        }
        const movie = await response.json(); 
        displayMovieDetails(movie); 
    } catch (error) {
        console.error('Error fetching movie details:', error); 
        
        document.getElementById('movie-title').textContent = 'Error loading movie details.'; 
        document.getElementById('movie-synopsis').textContent = 'Could not load synopsis.'; 
        document.getElementById('movie-trailer').src = ''; // Clear trailer src
        document.getElementById('movie-poster').src = 'https://via.placeholder.com/450x675?text=Error+Loading+Poster'; // Placeholder for error
        document.getElementById('movie-poster').alt = 'Error loading poster'; //
        
        document.querySelector('#movie-year .detail-value').textContent = 'N/A'; //
        document.querySelector('#movie-rating .detail-value').textContent = 'N/A'; //
        document.querySelector('#movie-revenue .detail-value').textContent = 'N/A'; // Corrected ID for revenue
        document.querySelector('#movie-genres .detail-value').textContent = 'N/A'; // Corrected ID for genres
        document.querySelector('#movie-actors .detail-value').textContent = 'N/A'; //
        document.querySelector('#movie-director .detail-value').textContent = 'N/A'; //
        
        const trailerContainer = document.querySelector('.movie-details-trailer'); // Use the correct class for the container
        if (trailerContainer) {
            trailerContainer.innerHTML = '<h3 class="neon-text subheading">Trailer</h3><p class="neon-text subheading" style="text-align: center; padding: 50px;">Failed to load trailer.</p>'; //
        }
    }
}


function displayMovieDetails(movie) {
    document.getElementById('movie-title').textContent = movie.movie_title || 'N/A'; //
    document.getElementById('movie-poster').src = movie.poster_url || 'https://via.placeholder.com/450x675?text=No+Poster'; //
    document.getElementById('movie-poster').alt = `${movie.movie_title || 'Movie'} Poster`; //

    document.querySelector('#movie-year .detail-value').textContent = movie.release_year || 'N/A'; //
    document.querySelector('#movie-rating .detail-value').textContent = movie.average_rating ? parseFloat(movie.average_rating).toFixed(1) + '/5' : 'N/A'; //
    document.querySelector('#movie-revenue .detail-value').textContent = movie.box_office_revenue ? `$${parseFloat(movie.box_office_revenue).toLocaleString()}` : 'N/A'; // Corrected ID for revenue
    document.querySelector('#movie-director .detail-value').textContent = movie.director || 'N/A'; //
    document.querySelector('#movie-genres .detail-value').textContent = movie.genres || 'N/A'; // Corrected ID for genres
    document.querySelector('#movie-actors .detail-value').textContent = movie.actors || 'N/A'; //
   
    document.getElementById('movie-synopsis').textContent = movie.plot_summary || 'No synopsis available for this movie.'; //

    const movieTrailerIframe = document.getElementById('movie-trailer'); 
    const trailerSection = document.getElementById('movie-details-trailer'); 

    if (movie.trailer_url) {
        
        const youtubeMatch = movie.trailer_url.match(/(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/); //
        if (youtubeMatch && youtubeMatch[1]) {
            
            movieTrailerIframe.src = `https://www.youtube-nocookie.com/embed/${youtubeMatch[1]}?autoplay=0&modestbranding=1&rel=0`; //
            trailerSection.style.display = ''; 
        } else {
            movieTrailerIframe.src = ''; 
            trailerSection.innerHTML = '<h3 class="neon-text subheading">Trailer</h3><p class="neon-text subheading" style="text-align: center; padding: 50px;">Invalid or unsupported trailer URL.</p>'; //
            trailerSection.style.display = ''; 
        }
    } else {
        movieTrailerIframe.src = ''; 
        trailerSection.innerHTML = '<h3 class="neon-text subheading">Trailer</h3><p class="neon-text subheading" style="text-align: center; padding: 50px;">No trailer available for this movie.</p>'; //
        trailerSection.style.display = ''; 
    }
}



async function fetchMovieReviews(movieId) {
    const reviewsContainer = document.getElementById('reviews-container'); //
    if (!reviewsContainer) return; //

   
    const baseUrl = 'http://localhost:3001'; //

    try {
        const response = await fetch(`${baseUrl}/api/movies/${movieId}/reviews`); //
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`); //
        }
        const reviews = await response.json(); 
        displayReviews(reviews, reviewsContainer); 
    } catch (error) {
        console.error('Error fetching reviews:', error); //
        reviewsContainer.innerHTML = '<p class="error-message">Failed to load reviews.</p>'; //
    }
}


function displayReviews(reviews, container) {
    container.innerHTML = ''; 
    if (reviews && reviews.length > 0) {
        reviews.forEach(review => {
            const reviewDiv = document.createElement('div');
            reviewDiv.classList.add('review-item'); 

            const reviewDate = new Date(review.review_date).toLocaleDateString('en-US', {
                year: 'numeric',
                month: 'long',
                day: 'numeric'
            });

            // Generate star rating HTML
            const starRatingHTML = generateStarRating(review.rating);

            reviewDiv.innerHTML = `
                <p class="reviewer"><strong>${review.reviewer_name || 'Anonymous'}</strong></p>
                <div class="star-rating">${starRatingHTML}</div>
                <p class="comment">${review.comment || 'No comment provided.'}</p>
                <p class="review-date">Reviewed on: ${reviewDate}</p>
            `;
            container.appendChild(reviewDiv);
        });
    } else {
        container.innerHTML = '<p>No reviews yet. Be the first to write one!</p>';
    }
}

// Helper function to generate star rating HTML
function generateStarRating(rating) {
    const maxRating = 5;
    let starsHtml = '';
    for (let i = 1; i <= maxRating; i++) {
        if (i <= rating) {
            starsHtml += '<span class="star">&#9733;'; // Filled star
        } else if (i - 0.5 === rating) {
            starsHtml += '<span class="star half-filled">&#9733;'; // Half-filled star (using full star icon for simplicity)
        }
        else {
            starsHtml += '<span class="star empty">&#9733;'; // Empty star
        }
    }
    return starsHtml;
}

// Function to handle review form submission
async function handleReviewSubmit(event) {
    event.preventDefault(); // Prevent default form submission

    const movieId = document.getElementById('movie-id-review').value; //
    const reviewerName = document.getElementById('reviewer-name').value; //
    const rating = document.getElementById('rating').value; //
    const comment = document.getElementById('comment').value; //
    const reviewMessage = document.getElementById('review-message'); // Element to display messages
    const reviewForm = document.getElementById('review-form'); // Retrieve reviewForm here

    const reviewData = {
        movie_id: parseInt(movieId), //
        reviewer_name: reviewerName, //
        rating: parseFloat(rating), // Parse rating as a float
        comment: comment //
    };

    // Client-side validation
    if (!reviewData.reviewer_name.trim() || reviewData.rating < 1 || reviewData.rating > 5) {
        reviewMessage.className = 'form-message error'; //
        reviewMessage.textContent = 'Please ensure you provide a valid name and a rating between 1 and 5.'; //
        return;
    }

    try {
        // This should point to your local server, ngrok will tunnel to it.
        const baseUrl = 'http://localhost:3001'; //
        const response = await fetch(`${baseUrl}/api/reviews`, {
            method: 'POST', //
            headers: {
                'Content-Type': 'application/json' //
            },
            body: JSON.stringify(reviewData) //
        });

        // Log the full response for debugging
        console.log('Full server response:', response);
        console.log('Response status:', response.status);
        console.log('Response status text:', response.statusText);

        // Check if the response is OK (status 2xx)
        if (response.ok) {
            const contentType = response.headers.get('content-type');
            if (contentType && contentType.includes('application/json')) {
                try {
                    const result = await response.json(); // Attempt to parse JSON
                    reviewMessage.className = 'form-message success'; //
                    reviewMessage.textContent = result.message || 'Review submitted successfully!'; //
                } catch (jsonError) {
                    // This catch block handles errors if response.json() fails even if Content-Type is application/json
                    console.error('Error parsing JSON response for successful submission:', jsonError);
                    reviewMessage.className = 'form-message success'; // Still treat as success
                    reviewMessage.textContent = 'Review submitted successfully, but response was unexpected.'; //
                }
            } else {
                // If response is OK but not JSON (e.g., 200 OK with empty body or plain text)
                reviewMessage.className = 'form-message success'; //
                reviewMessage.textContent = 'Review submitted successfully!'; //
            }
            fetchMovieReviews(movieId); // Reload reviews to show the new one
            if (reviewForm) { // Added a check for reviewForm before resetting
                reviewForm.reset(); // Clear the form
            }
        } else {
            // Handle HTTP errors (e.g., 400, 500)
            let errorMessage = 'Failed to submit review.';
            const contentType = response.headers.get('content-type');
            if (contentType && contentType.includes('application/json')) {
                try {
                    const errorResult = await response.json(); // Attempt to parse JSON for error message
                    errorMessage = errorResult.message || errorMessage;
                } catch (jsonError) {
                    console.error('Error parsing JSON response for failed submission:', jsonError);
                    errorMessage = `Server responded with status ${response.status}, but error message was unreadable.`;
                }
            } else {
                errorMessage = `Server responded with status ${response.status} ${response.statusText || ''}.`;
            }
            reviewMessage.className = 'form-message error'; //
            reviewMessage.textContent = errorMessage; //
        }
    } catch (error) {
        // This catch block handles network errors or errors before response is received
        console.error('Network or unexpected error submitting review:', error); //
        reviewMessage.className = 'form-message error'; //
        reviewMessage.textContent = 'An unexpected error occurred. Please try again. (Network or pre-response error)'; //
    }
}
