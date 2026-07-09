# 🎬 Movie Explorer

A full-stack movie database web application that allows users to browse, search, filter, and review movies through a responsive interface backed by a MySQL database and RESTful API.

---

## 📌 Overview

Movie Explorer is a full-stack web application developed using **Node.js, Express.js, MySQL, HTML, CSS, and JavaScript**. The application provides an interactive platform for exploring a movie database with advanced search, filtering, sorting, pagination, and user review functionality.

The backend exposes REST APIs that communicate with a MySQL database, while the frontend delivers a modern and responsive user experience.

---

## ✨ Features

- 🔍 Search movies by title, actors, or genres
- 🔤 Alphabetical filtering (A–Z)
- 🎭 Filter movies by genre
- 📊 Sort by:
  - Title
  - Rating
  - Release Year
  - Box Office Revenue
- 📄 Pagination
- 🎥 Dedicated movie details page
- ⭐ User rating and review system
- 🗄️ MySQL database integration
- 🔗 RESTful API architecture
- 📱 Responsive interface
- 🎨 Animated particle background

---

## 🛠 Tech Stack

### Frontend

- HTML5
- CSS3
- JavaScript

### Backend

- Node.js
- Express.js

### Database

- MySQL
- mysql2

### Other

- REST APIs
- CORS
- Express Static Files

---

## 🗂 Project Structure

```
Movie-Explorer/

│
├── public/
│   ├── index.html
│   ├── movie-details.html
│   ├── style.css
│   ├── script.js
│   └── movie-details-script.js
│
├── server.js
├── db.js
├── movies.sql
├── package.json
├── package-lock.json
└── README.md
```

---

## 🚀 API Endpoints

| Method | Endpoint | Description |
|---------|----------|-------------|
| GET | `/api/movies` | Retrieve movies with search, filtering, sorting, and pagination |
| GET | `/api/movies/:id` | Retrieve movie details |
| GET | `/api/movies/:id/reviews` | Retrieve movie reviews |
| POST | `/api/reviews` | Submit a movie review |

---

## 🔍 Search & Filtering

The application supports:

- Search by movie title
- Search by actors
- Search by genres
- Alphabetical filtering
- Genre filtering
- Multiple sorting options
- Pagination

---

## ⭐ Review System

Users can:

- Submit ratings (1–5)
- Add comments
- View reviews
- See reviews ordered by latest submissions

---

## 🗄 Database

The application uses a MySQL database containing movie information, including:

- Movie details
- Directors
- Actors
- Genres
- Ratings
- Box office revenue
- Reviews
- Trailers
- Synopsis

A database view (`MovieSummaryView`) is used to efficiently retrieve aggregated movie information.

---

## ⚙ Installation

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/movie-explorer.git
```

### 2. Navigate to the project

```bash
cd movie-explorer
```

### 3. Install dependencies

```bash
npm install
```

### 4. Configure MySQL

Create a MySQL database and import:

```
movies.sql
```

Update your database credentials inside:

```
db.js
```

```javascript
host: "localhost",
user: "your_username",
password: "your_password",
database: "moviesystemdb"
```

### 5. Start the server

```bash
node server.js
```

The application will run at:

```
http://localhost:3001
```

---

## 📸 Screenshots

Add screenshots here.

### Home Page

```
images/home.png
```

### Movie Details

```
images/details.png
```

### Search & Filtering

```
images/search.png
```

### Reviews

```
images/reviews.png
```

---

## 🎯 Learning Outcomes

This project demonstrates practical experience with:

- Full-Stack Web Development
- RESTful API Design
- Express.js
- Node.js
- MySQL Database Design
- SQL Queries
- Database Views
- Client-Server Architecture
- CRUD Operations
- Search & Filtering
- Pagination
- Responsive Web Design

---

## 🚀 Future Improvements

- User authentication
- Favorite movies
- Watchlist
- Admin dashboard
- JWT authentication
- Movie recommendations
- AI-powered movie suggestions
- Dark/Light mode
- Deployment on Render or Railway

---

## 👤 Author

**Muqadas Ilyas**

Software Engineering Student

**Interests:** Artificial Intelligence • Full-Stack Development • Software Engineering • Systems Programming

GitHub: https://github.com/muqadasilyas

LinkedIn: https://linkedin.com/in/muqadas-ilyas-8681923b5

---

⭐ If you found this project useful, consider giving it a star.
