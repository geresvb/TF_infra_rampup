CREATE TABLE merged_songs (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    song_name VARCHAR(255) NOT NULL,
    artist_name VARCHAR(255) NOT NULL,
    popularity INT DEFAULT 0,
    votes INT DEFAULT 0
);

CREATE TABLE top_songs (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    song_name VARCHAR(255) NOT NULL,
    artist_name VARCHAR(255) NOT NULL,
    popularity INT NOT NULL
);
