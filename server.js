const express = require('express');
const path = require('path');
const db = require('./db'); 
const cors = require('cors');

const app = express();
const PORT = 3001;


app.use(cors({
    exposedHeaders: ['X-Total-Count'] 
}));

app.use(express.json());

app.use(express.static(path.join(__dirname, 'public')));


app.get('/api/movies', async (req, res) => {
    const { search, starts_with, sortBy, genre, page = 1, limit = 12 } = req.query;

    
    const parsedPage = parseInt(page, 10);
    const parsedLimit = parseInt(limit, 10);
    const offset = (parsedPage - 1) * parsedLimit;

  
    if (isNaN(parsedPage) || isNaN(parsedLimit) || parsedPage < 1 || parsedLimit < 1) {
        return res.status(400).json({ error: 'Invalid page or limit parameter' });
    }

    let baseQuery = 'FROM MovieSummaryView';
    const conditions = [];
    const params = [];

    if (search) {
        conditions.push('(movie_title LIKE ? OR actors LIKE ? OR genres LIKE ?)');
        params.push(`%${search}%`, `%${search}%`, `%${search}%`);
    }

    if (starts_with) {
        conditions.push('movie_title LIKE ?');
        params.push(`${starts_with}%`);
    }

    if (genre) {
        conditions.push('genres LIKE ?');
        params.push(`%${genre}%`);
    }

    let whereClause = conditions.length > 0 ? ' WHERE ' + conditions.join(' AND ') : '';
    let orderByClause = ' ORDER BY movie_title ASC'; // Default sort

    switch (sortBy) {
        case 'title_asc':
            orderByClause = ' ORDER BY movie_title ASC';
            break;
        case 'title_desc':
            orderByClause = ' ORDER BY movie_title DESC';
            break;
        case 'rating_desc':
            orderByClause = ' ORDER BY average_rating DESC, movie_title ASC';
            break;
        case 'year_desc':
            orderByClause = ' ORDER BY release_year DESC';
            break;
        case 'year_asc':
            orderByClause = ' ORDER BY release_year ASC';
            break;
        case 'revenue_desc':
            orderByClause = ' ORDER BY box_office_revenue DESC';
            break;
        case 'revenue_asc':
            orderByClause = ' ORDER BY box_office_revenue ASC';
            break;
    }

    try {
        
        const [countRows] = await db.execute(`SELECT COUNT(*) as total ${baseQuery} ${whereClause}`, params);
        const totalMovies = countRows[0].total;


        const movieQuery = `SELECT * ${baseQuery} ${whereClause} ${orderByClause} LIMIT ${parsedLimit} OFFSET ${offset}`;
        const [movies] = await db.execute(movieQuery, params);

        res.setHeader('X-Total-Count', totalMovies); 
        res.json(movies);
    } catch (err) {
       
        console.error('Error fetching movies:', err);
        res.status(500).json({ error: 'Internal server error while fetching movies', details: err.message });
    }
});


app.get('/api/movies/:id', async (req, res) => {
    
    const movieId = parseInt(req.params.id, 10);

    if (isNaN(movieId)) {
        return res.status(400).json({ error: 'Invalid movie ID provided. ID must be a number.' });
    }

    try {
        const [rows] = await db.execute(`SELECT * FROM MovieSummaryView WHERE movie_id = ?`, [movieId]);

        if (rows.length > 0) {
            res.json({
                ...rows[0],
                plot_summary: rows[0].synopsis || 'No synopsis available', 
                runtime: rows[0].runtime_minutes || 'N/A', 
                trailer_url: rows[0].trailer_url || null
            });
        } else {
            res.status(404).json({ error: 'Movie not found' });
        }
    } catch (err) {
        
        console.error(`Error fetching movie details for ${movieId}:`, err);
        res.status(500).json({ error: 'Internal server error while fetching movie details', details: err.message });
    }
});


app.post('/api/reviews', async (req, res) => {
    const { movie_id, reviewer_name, rating, comment } = req.body;

 
    const parsedMovieId = parseInt(movie_id, 10);
    const parsedRating = parseFloat(rating);

    if (isNaN(parsedMovieId) || !reviewer_name || isNaN(parsedRating)) {
        return res.status(400).json({ error: 'Please provide a valid movie ID, your name, and a rating' });
    }
    if (parsedRating < 1 || parsedRating > 5) {
        return res.status(400).json({ error: 'Rating must be between 1 and 5' });
    }

    try {
        const [result] = await db.execute(
            'INSERT INTO MovieReviews (movie_id, reviewer_name, rating, comment, review_date) VALUES (?, ?, ?, ?, NOW())',
            [parsedMovieId, reviewer_name, parsedRating, comment || null]
        );
        res.status(201).json({ message: 'Review submitted successfully', reviewId: result.insertId });
    } catch (err) {
       
        console.error('Error submitting review:', err);
        res.status(500).json({ error: 'Internal server error while submitting review', details: err.message });
    }
});

app.get('/api/movies/:id/reviews', async (req, res) => {
  
    const movieId = parseInt(req.params.id, 10);

    if (isNaN(movieId)) {
        return res.status(400).json({ error: 'Invalid movie ID provided. ID must be a number.' });
    }

    try {
        const [reviews] = await db.execute(
            'SELECT reviewer_name, rating, comment, review_date FROM MovieReviews WHERE movie_id = ? ORDER BY review_date DESC',
            [movieId]
        );
        res.json(reviews);
    } catch (err) {
        
        console.error(`Error fetching reviews for movie ${movieId}:`, err);
        res.status(500).json({ error: 'Internal server error while fetching reviews', details: err.message });
    }
});

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
