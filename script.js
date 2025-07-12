document.addEventListener('DOMContentLoaded', () => {
    const movieListContainer = document.getElementById('movieList');
    const searchInput = document.getElementById('searchInput');
    const searchButton = document.getElementById('searchButton');
    const filterLetters = document.querySelectorAll('.filter-letter');
    const genreFilter = document.getElementById('genreFilter');
    const sortBy = document.getElementById('sortBy');
    const prevPageBtn = document.getElementById('prevPage');
    const nextPageBtn = document.getElementById('nextPage');
    const pageInfo = document.getElementById('pageInfo');

    let currentPage = 1;
    const moviesPerPage = 12;
    let totalMovies = 0;

 
    const canvas = document.getElementById('particleCanvas');
    const ctx = canvas.getContext('2d');
    let particlesArray = []; 
    const numberOfParticles = 100;

    
    function setCanvasDimensions() {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
    }

    
    setCanvasDimensions();

    
    window.addEventListener('resize', () => {
        setCanvasDimensions();
        
        particlesArray = []; 
        initParticles(); 
    });

    class Particle {
        constructor() {
            this.reset(); 
        }

        
        reset() {
            this.x = Math.random() * canvas.width;
            this.y = Math.random() * canvas.height;
            this.size = Math.random() * 2 + 0.5; 
            this.speedX = Math.random() * 1 - 0.5;
            this.speedY = Math.random() * 1 - 0.5;
            this.color = `hsl(${Math.random() * 360}, 100%, 85%)`; 
        }

        update() {
            this.x += this.speedX;
            this.y += this.speedY;

           
            if (this.x < 0 - this.size) this.x = canvas.width + this.size;
            if (this.x > canvas.width + this.size) this.x = 0 - this.size;
            if (this.y < 0 - this.size) this.y = canvas.height + this.size;
            if (this.y > canvas.height + this.size) this.y = 0 - this.size;
        }

        draw() {
            ctx.fillStyle = this.color;
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
            ctx.fill();
        }
    }

    function initParticles() {
        for (let i = 0; i < numberOfParticles; i++) {
            particlesArray.push(new Particle());
        }
    }

    function animateParticles() {
        ctx.clearRect(0, 0, canvas.width, canvas.height); 
        for (let i = 0; i < particlesArray.length; i++) {
            particlesArray[i].update();
            particlesArray[i].draw();
        }
        requestAnimationFrame(animateParticles); 
    }

    
    initParticles();
    animateParticles();

    
    function displayMovies(movies) {
        movieListContainer.innerHTML = ''; 
        if (movies.length === 0) {
            movieListContainer.innerHTML = '<p>No movies found.</p>';
            return;
        }

        movies.forEach(movie => {
            const movieCard = document.createElement('div');
            movieCard.classList.add('movie-card');

           
            const movieRating = parseFloat(movie.average_rating);
            const formattedRating = !isNaN(movieRating) ? movieRating.toFixed(1) : 'N/A';

           
            const movieRevenue = parseFloat(movie.box_office_revenue);
            const formattedRevenue = !isNaN(movieRevenue) ? `$${movieRevenue.toLocaleString()}` : 'N/A';

            movieCard.innerHTML = `
                <img src="${movie.poster_url}" alt="${movie.movie_title}" onerror="this.onerror=null;this.src='https://placehold.co/150x225/000000/FFFFFF?text=No+Poster';">
                <h3>${movie.movie_title} (${movie.release_year})</h3>
                <p>Director: ${movie.director || 'N/A'}</p>
                <p>Actors: ${movie.actors || 'N/A'}</p>
                <p>Genres: ${movie.genres || 'N/A'}</p>
                <p>Rating: ${formattedRating}</p>
                <p>Revenue: ${formattedRevenue}</p>
                <button onclick="goToMovieDetailsPage(${movie.movie_id})" class="neon-button details-button">Details</button>
            `;
            movieListContainer.appendChild(movieCard);
        });
    }

    
    function getCurrentFilterParams() {
        const params = {};
        const searchTerm = searchInput.value.trim();
        const letter = document.querySelector('.filter-letter.active')?.dataset.letter;
        const genre = genreFilter.value;
        const sort = sortBy.value;

        if (searchTerm) params.search = searchTerm;
        if (letter && letter !== 'ALL') params.starts_with = letter;
        if (genre) params.genre = genre;
        if (sort) params.sortBy = sort;
        return params;
    }

   
    async function fetchMovies(params = {}) {
        
        const baseUrl = 'http://localhost:3001'; 

        const url = new URL(`${baseUrl}/api/movies`);
        Object.keys(params).forEach(key => url.searchParams.append(key, params[key]));

        url.searchParams.append('page', currentPage);
        url.searchParams.append('limit', moviesPerPage);

        console.log('Fetching movies with URL:', url.toString()); 

        try {
            const response = await fetch(url);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }

            const totalCountHeader = response.headers.get('X-Total-Count');
            console.log('X-Total-Count header received:', totalCountHeader); 
            totalMovies = parseInt(totalCountHeader, 10);
            console.log('Parsed totalMovies:', totalMovies); 

            const movies = await response.json();
            displayMovies(movies);
            updatePaginationInfo();
        } catch (error) {
            console.error('Error fetching movies:', error);
            movieListContainer.innerHTML = '<p>Failed to load movies. Please try again later.</p>';
            totalMovies = 0; 
            updatePaginationInfo();
        }
    }

    // Function to update pagination info
    function updatePaginationInfo() {
        const totalPages = Math.ceil(totalMovies / moviesPerPage);
        pageInfo.textContent = `Page ${currentPage} of ${totalPages || 1}`; // Display "Page 1 of 1" if 0 movies
        
        console.log(`Pagination Info: currentPage=${currentPage}, totalPages=${totalPages}, totalMovies=${totalMovies}`); // Log pagination state

        prevPageBtn.disabled = currentPage === 1;
        nextPageBtn.disabled = currentPage === totalPages || totalPages === 0;

        console.log(`Buttons disabled state: Prev=${prevPageBtn.disabled}, Next=${nextPageBtn.disabled}`); // Log button disabled state
    }

    function applyFilters() {
        currentPage = 1; 
        const params = getCurrentFilterParams(); 
        fetchMovies(params);
    }

    
    searchButton.addEventListener('click', applyFilters);

    filterLetters.forEach(button => {
        button.addEventListener('click', () => {
            filterLetters.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');
            const letter = button.dataset.letter;
            if (letter === 'ALL') {
                searchInput.value = ''; 
            } else {
                searchInput.value = ''; 
            }
            applyFilters();
        });
    });

    genreFilter.addEventListener('change', applyFilters);
    sortBy.addEventListener('change', applyFilters);

    prevPageBtn.addEventListener('click', () => {
        if (currentPage > 1) {
            currentPage--;
            fetchMovies(getCurrentFilterParams()); 
        }
    });

    nextPageBtn.addEventListener('click', () => {
        const totalPages = Math.ceil(totalMovies / moviesPerPage);
        if (currentPage < totalPages) {
            currentPage++;
            fetchMovies(getCurrentFilterParams()); 
        }
    });

    fetchMovies();
});


function goToMovieDetailsPage(movieId) {
    window.location.href = `movie-details.html?id=${movieId}`;
}
