
drop database if exists moviesystemdb;
CREATE DATABASE IF NOT EXISTS moviesystemdb DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE moviesystemdb;

DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS MovieReviews;
DROP TABLE IF EXISTS MovieGenres;
DROP TABLE IF EXISTS MovieActors;
DROP TABLE IF EXISTS Movies;

DROP TABLE IF EXISTS Genres;
DROP TABLE IF EXISTS Actors;
DROP TABLE IF EXISTS Directors;

CREATE TABLE IF NOT EXISTS Directors (
  director_id INT AUTO_INCREMENT PRIMARY KEY,
  director_name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Actors (
  actor_id INT AUTO_INCREMENT PRIMARY KEY,
  actor_name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Genres (
  genre_id INT AUTO_INCREMENT PRIMARY KEY,
  genre_name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Movies (
  movie_id INT AUTO_INCREMENT PRIMARY KEY,
  movie_title VARCHAR(255) NOT NULL,
  release_year INT,
  synopsis TEXT,
  trailer_url VARCHAR(2048), 
  poster_url VARCHAR(2048), 
  runtime_minutes INT,
  mpa_rating VARCHAR(10), 
  box_office_revenue BIGINT,
  average_rating DECIMAL(2,1) DEFAULT 0.0, 
  director_id INT,
  FOREIGN KEY (director_id) REFERENCES Directors(director_id) ON DELETE SET NULL
);


CREATE TABLE IF NOT EXISTS MovieGenres (
  movie_id INT,
  genre_id INT,
  PRIMARY KEY (movie_id, genre_id),
  FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE,
  FOREIGN KEY (genre_id) REFERENCES Genres(genre_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS MovieActors (
  movie_id INT,
  actor_id INT,
  PRIMARY KEY (movie_id, actor_id),
  FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE,
  FOREIGN KEY (actor_id) REFERENCES Actors(actor_id) ON DELETE CASCADE
);


INSERT INTO Directors (director_name) VALUES
('Christopher Nolan'), ('Quentin Tarantino'), ('Tatsuyuki Nagai'), ('James Cameron'),('Kenneth Branagh'),
('Alfred Hitchcock'), ('Martin Scorsese'), ('Stanley Kubrick'), ('Peter Jackson'),
('Hayao Miyazaki'), ('Wes Anderson'), ('Denis Villeneuve'), ('Greta Gerwig'),
('Frank Darabont'), ('Robert Zemeckis'), ('Lana Wachowski'), ('Lilly Wachowski'),
('Bong Joon-ho'), ('Ridley Scott'), ('Rob Minkoff'),
('John Lasseter'), ('Andrew Stanton'), ('Lee Unkrich'), ('Damien Chazelle'),
('Todd Phillips'), ('Matt Reeves'), ('Bob Persichetti'), ('Peter Ramsey'),
('Rodney Rothman'), ('David Fincher'), ('Jonathan Demme'), ('Spike Jonze'),
('Michel Gondry'), ('Joel Coen'), ('Ethan Coen'), ('Sam Mendes'),
('Joaquim Dos Santos'), ('Kemp Powers'), ('Justin K. Thompson'),('Jim Cummings'),
('Alejandro G. Iñárritu'), ('Alfonso Cuarón'), ('Guillermo del Toro'),
('Jean-Pierre Jeunet'), ('John Krasinski'), ('Kenneth Lonergan'),('Mamoru Kanbe'),
('Luca Guadagnino'), ('Noah Baumbach'), ('Tom McCarthy'), ('Adam McKay'),
('George Miller'), ('Jordan Peele'), ('Richard Linklater'), ('Peter Weir'),
('Scott Frank'), ('Bryan Singer'), ('Danny Boyle'), ('Dan Gilroy'), ('Alex Garland'),
('Gus Van Sant'), ('Theodore Melfi'), ('Ron Howard'), ('Genndy Tartakovsky'),
('Makoto Shinkai'), ('Mamoru Hosoda'), ('Dean DeBlois'), ('Chris Sanders'),
('Byron Howard'), ('Rich Moore'), ('Phil Lord'), ('Chris Miller'), ('Brad Bird'),('Kappei Yamaguchi'),('Mamoru Miyano'),
('Katsuhiro Otomo'), ('Gary Trousdale'), ('Kirk Wise'), ('Chris Buck'), ('Jennifer Lee'),
('Pete Docter'), ('Bob Peterson'), ('Paul King'),('Don Hall'),('James Algar'),('Brian Fee'),('Shinnosuke Yakuwa')
,('Yoshihiro Ôsugi'),('Jared Bush · Byron Howard'),('Carlos Saldanha'),('Isao Takahata'),('Ishirô Honda'),('Joe Johnston'),('Roger Allers'),
('Ang Lee'),('Dan Scanlon'),('Barry Cook'),('Ming-Na Wen'),('Tensai Okamura');

-- Actors
INSERT INTO Actors (actor_name) VALUES
('Mitsuo Iwata'),
('Nozomu Sasaki'),
('Amy Adams'),
('Jeremy Renner'),
('Megumi Han'),
('Ikumi Hayama'),
('Robert Downey Jr.'),
('Chris Evans'),
('Paige O''Hara'),
('Robbie Benson'),
('Ryan Potter'),
('Scott Adsit'),
('Janet Chapman'),
('Hardie Albright'),
('Mayumi Tanaka'),
('Keiko Yokozawa'),
('Anthony Gonzalez'),
('Gael García Bernal'),('Tetsurō Araki'),
('Owen Wilson'),
('Cristela Alonzo'), -- Corrected spelling
('Clive Owen'),
('Julianne Moore'),
('Fionn Whitehead'),
('Damian Bonnard'),
('Yumi Kakazu'),
('Megumi Ohara'),
('Leah Lewis'),
('Mamoudou Athie'),
('Wilmer Valderrama'),
('Henry Thomas'),
('Drew Barrymore'),
('Albert Brooks'),
('Ellen DeGeneres'),('Keiju Kobayashi'),('Issey Takahashi'),
('John Cena'),
('Kristen Bell'),
('Idina Menzel'),
('Akemi Yamaguchi'),
('Tatsumi Katayama'),
('Momoko Kōchi'),
('Akira Takarada'),
('Jay Baruchel'),
('Gerard Butler'),
('Leonardo DiCaprio'),
('Joseph Gordon-Levitt'),
('Brad Pitt'),
('Christoph Waltz'),
('Matthew McConaughey'),
('Anne Hathaway'),
('Robin Williams'),
('Bonnie Hunt'),
('Sam Neill'),
('Laura Dern'),
('Ryunosuke Kamiki'),
('Mone Kamishiraishi'),
('Jason Schwartzman'),
('J.K. Simmons'),
('Irfan Khan'),
('Suraj Sharma'),
('Matthew Broderick'),
('Jeremy Irons'),
('Billy Crystal'),
('John Goodman'),
('Noriko Hidaka'),
('Chika Sakamoto'),
('Ming-Na Wen'),
('Junko Takeuchi'),
('Noriaki Sugiyama'),
('Cillian Murphy'),
('Emily Blunt'),
('Ben Whishaw'),
('Hugh Grant'),
('Jack Black'),
('Awkwafina'),
('Song Kang-ho'),
('Patton Oswalt'),
('Lou Romano'),
('Jesse Eisenberg'),
('Rumi Hiiragi'),
('Miyu Irino'),
('Shameik Moore'),
('Hailee Steinfeld'),
('Ned Beatty'),
('Joan Cusack'),
('Sumire Morohoshi'),
('Maaya Uchida'),
('Tom Hanks'),
('Tim Allen'),
('Edward Asner'),
('Christopher Plummer'),
('Ben Burtt'),
('Elissa Knight'),
('Jim Cummings'),
('Ginnifer Goodwin'),
('Jason Bateman');


-- Genres
INSERT INTO Genres (genre_name) VALUES
('Action'), ('Adventure'), ('Animation'), ('Comedy'), ('Crime'),
('Drama'), ('Fantasy'), ('Horror'), ('Mystery'), ('Romance'),
('Sci-Fi'), ('Thriller'), ('Family'), ('Biography'), ('History'), ('Musical'),
('War'), ('Western'), ('Sport'), ('Documentary');

-- Movies (at least 40, A-Z, with poster_url, including Cartoons/Anime)
INSERT INTO Movies (movie_title, release_year, synopsis, trailer_url, poster_url, runtime_minutes, mpa_rating, box_office_revenue, director_id) VALUES
('Akira', 1988, 'Akira is a dystopian, cyberpunk manga and anime set in a post-apocalyptic and futuristic "Neo-Tokyo". The story takes place 31 years after Tokyo’s destruction and centers on teenage biker gang leader Shotaro Kaneda and his friend Tetsuo, who acquires incredible telekinetic abilities after a motorcycle accident. The story follows Kaneda and his friends as they try to prevent Tetsuo from using his unstable and destructive telekinetic abilities to ravage the city and awaken a mysterious entity with powerful psychic abilities named "Akira".', 'https://www.youtube.com/embed/nA8KmHC2Z-g?si=YC21etjLRH-h4BEi', 'https://features.japantimes.co.jp/wp-content/uploads/2018/07/akira-poster-big.jpg', 124, 'R', 4900000, (SELECT director_id FROM Directors WHERE director_name = 'Katsuhiro Otomo')),
('Arrival', 2016, 'Arrival is a sci-fi film based on Ted Chiangs short story Story of Your Life. It follows linguist Louise Banks, who is brought in to establish communication with an alien species that has recently landed on Earth. As nations teeter on the verge of global war, Banks and her team race against time to find a way to communicate with the extraterrestrial visitors and prevent a third World War.', 'https://www.youtube.com/embed/tFMo3UJ4B4g?si=EDFDMZ6fLAK_2eNF', 'https://tse4.mm.bing.net/th/id/OIP.Sa4FuPUXfEFz1j9Xln0OYQHaLj?rs=1&pid=ImgDetMain', 116, 'PG-13', 203388124, (SELECT director_id FROM Directors WHERE director_name = 'Denis Villeneuve')),
('Anohana the Movie: The Flower We Saw That Day', 2013, 'Anohana: The Flower We Saw That Day" is an anime series that follows a group of childhood friends who drifted apart after one of them, Meiko "Menma" Honma, died in an accident. Five years later, the leader of the group, Jinta Yadomi, lives as a recluse. However, Menmas ghost appears and pesters him to grant a forgotten wish, leading to emotional reunions and healing.', 'https://www.youtube.com/embed/BaZcfR5aEuI?si=iMtK6ccMV4ypICw2', 'https://tse4.mm.bing.net/th/id/OIP.8RGFuVmLqUeNHhqa95hgNgHaLH?rs=1&pid=ImgDetMain', 99, 'R', 10219593, (SELECT director_id FROM Directors WHERE director_name = 'Tatsuyuki Nagai')),
('Avengers: Endgame', 2019, 'Avengers: Endgame is a movie that follows the events of Avengers: Infinity War. The universe is in ruins after Thanos wiped out half of it, and the Avengers assemble once more to reverse Thanos actions and restore balance to the universe. The movie is the grand conclusion to twenty-two films in the Marvel Studios franchise.', 'https://www.youtube.com/embed/TcMBFSGVi1c?si=QNwm7ab6SvINn9Cf', 'https://tse3.mm.bing.net/th/id/OIP.KNfIqaD92jvecpbxNWWQ4wHaJ4?rs=1&pid=ImgDetMain', 181, 'PG-13', 2797501328, (SELECT director_id FROM Directors WHERE director_name = 'Anthony Russo')),
('Beauty and the Beast', 1991, 'Beauty and the Beast is a story about a brave young woman imprisoned by a beast in his castle. Despite her fears, she learns to see beyond the beasts hideous exterior and realizes the gentle heart of the true prince within him. The tale focuses on their relationship and the enchantment that binds them.', 'https://www.youtube.com/embed/0QwuPbbT_zk?si=tuREEt1RY6gOT0BZ', 'https://tse4.mm.bing.net/th/id/OIP.nRZVG3T9cuXrzok3ddwzlAHaLH?rs=1&pid=ImgDetMain', 84, 'G', 424967623, (SELECT director_id FROM Directors WHERE director_name = 'Gary Trousdale')),
('Big Hero 6', 2014, 'In the futuristic city of San Fransokyo,[b] Hiro Hamada, a 14-year-old high school graduate and robotics prodigy, spends his time competing in illegal underground robot fights. Hoping to get him out of this dangerous lifestyle, his older brother Tadashi takes him to attend the San Fransokyo Institute of Technology, where Hiro meets Tadashis closest friends – gritty Go Go, neurotic Wasabi, bubbly Honey Lemon and comic book fan Fred. Tadashi also introduces Baymax, an inflatable healthcare robot, which he invented. After meeting Tadashis mentor Professor Robert Callaghan, Hiro applies to the university, impressing the schools showcase with his project: a swarm of microbots that can link together in any configuration using a neural transmitter. Hiro is accepted, but the celebration is brief when a fire breaks out with Callaghan caught in it. Tadashi rushes back into the building to save him, but an explosion occurs, killing him.', 'https://www.youtube.com/embed/8IdMPpKMdcc?si=I5UAtgWnKkQe3epu', 'https://tse1.mm.bing.net/th/id/OIP.mS-_buaDYnzfEtmcG1Z7UQHaLH?rs=1&pid=ImgDetMain', 120, 'PG', 103212000, (SELECT director_id FROM Directors WHERE director_name = 'Don Hall')),
('Bambi', 1942, 'Bambi is a story about a young deer growing up in the forest. Bambis lineage means he will inherit the title of prince of the forest. The story chronicles Bambis adventures as he is guided through life by his mother and a diverse group of woodland friends, including a rabbit named Thumper. Bambi meets a female fawn, Faline, and learns the skills needed to survive. The novel traces Bambis life from his birth through childhood, the loss of his mother, the finding of a mate, the lessons he learns from his father, and the experience he gains about the dangers posed by human hunters in the forest. ', 'https://www.youtube.com/embed/k73vgTDvRek?si=cCt9fV3uMhLaszDk', 'https://tse2.mm.bing.net/th/id/OIP.78xTO0ItW6Cr5odT2xUw6AHaLH?rs=1&pid=ImgDetMain', 70, 'Tv-G', 260533221, (SELECT director_id FROM Directors WHERE director_name = 'James Algar')),
('Castle in the Sky', 1986, 'Castle in the Sky" is a steampunk-themed action adventure film. It follows orphans Sheeta and Pazu, who are pursued by government agents, the army, and pirates. They seek Sheetas crystal necklace, which is the key to accessing Laputa, a legendary flying castle hosting advanced technology. The film is inspired by Jonathan Swifts "Gullivers" Travels and tells the story of their high-flying adventure in search of Sheetas identity and the lost civilization of Laputa.', 'https://www.youtube.com/embed/FWjiXOqRKhk?si=ECUlicNJCWdelDoG', 'https://tse2.mm.bing.net/th/id/OIP.JbT1MCXBnx9EkdxIw9fa_QHaLH?rs=1&pid=ImgDetMain', 125, 'PG', 1000000, (SELECT director_id FROM Directors WHERE director_name = 'Hayao Miyazaki')),
('Coco', 2017, 'Aspiring musician Miguel, confronted with his family''s ancestral ban on music, enters the Land of the Dead to find his great-great-grandfather, a legendary singer.', 'https://www.youtube.com/embed/xlnPHQ3TLX8?si=0K70O_Oj33jKJqe7', 'https://th.bing.com/th/id/R.634e15492ef46c32b7d1708a41320a34?rik=UWVaIoD%2fjs5HlQ&pid=ImgRaw&r=0', 105, 'PG', 807897259, (SELECT director_id FROM Directors WHERE director_name = 'Lee Unkrich')),
('Cars 3', 2017, 'Five years after competing in the World Grand Prix,[b] Lightning McQueen, now a seven-time Piston Cup champion,[5] finds himself overshadowed by Jackson Storm, a rookie who is the first among a new generation of race cars with advanced technology to enhance speed and performance. As Storm wins throughout the season, many racing veterans retire or are replaced by younger racers. ', 'https://www.youtube.com/embed/2LeOH9AGJQM?si=bmU7g7DnmlwwCSXu', 'https://tse4.mm.bing.net/th/id/OIP.otvLX555X05SlH0tcmBXOQHaLH?rs=1&pid=ImgDetMain', 102, 'G', 383112444, (SELECT director_id FROM Directors WHERE director_name = 'Brian fee')),
('Cindrella', 2015, 'Beautiful Cinderella, a young woman with a heart of gold, sees her world turn upside down when her beloved mother dies, and her pained father remarries another woman: the wicked widow Lady Tremaine, the insufferable mother of cruel and jealous Anastasia and Drizella.', 'https://www.youtube.com/embed/UcjYD91YW_M?si=hEDPKAtv9HNZgmzi', 'https://tse4.mm.bing.net/th/id/OIP.8QOQTUNSbclYM6E9K0mjWwHaLH?rs=1&pid=ImgDetMain', 105, 'PG', 70154378, (SELECT director_id FROM Directors WHERE director_name = 'Kenneth Branagh')),
('Death Note', 2006, 'The story begins when Light Yagami, a highly intelligent and bored student, stumbles upon a Death Note, a notebook dropped by a rogue Shinigami (death god) named Ryuk. The Death Note comes with a chilling rule: the human whose name is written in it will die.', 'https://www.youtube.com/embed/NlJZ-YgAt-c?si=tHnHs7zZ0J_d5FxH', 'https://tse4.mm.bing.net/th/id/OIP.RoWgrTMp27MUR56sFH9O4wHaKk?rs=1&pid=ImgDetMain', 54, 'PG-13', 527018318, (SELECT director_id FROM Directors WHERE director_name = 'Tetsurō Araki')),
('Doraemon Movie Nobita the Explorer Bow Bow', 2016, 'Together with Nobita’s new pet dog, the gang heads to a mysterious location in Africa where a highly evolved dog kingdom faces a threat from within!', 'https://www.youtube.com/embed/k83U0P7cdbc?si=P3ns5pGqCbyigldO', 'https://tse2.mm.bing.net/th/id/OIP.afHYeexIFSZC3qihnj7hgwHaKf?rs=1&pid=ImgDetMain', 110, 'PG-13', 897314, (SELECT director_id FROM Directors WHERE director_name = 'Shinnosuke Yakuwa')),
('Doraemon: Nobitas Space Heroes', 2015, 'Gian and Suneo made Nobita perform as the monster, as Nobita wanted to act. Gian beats Nobita as he was a space alien and Nobita starts crying and runs away to his house to ask help from Doraemon.', 'https://www.youtube.com/embed/DdhWonvPe54?si=NbOgeB3pcjgsS1N1', 'https://th.bing.com/th/id/OIP.QkIVtFahcUbHOihVoEyhMAAAAA?rs=1&pid=ImgDetMain', 100, 'R', 28368238, (SELECT director_id FROM Directors WHERE director_name = 'Yoshihiro Ôsugi')),
('Elemental', 2023, 'Follows Ember, a tough, quick-witted and fiery young woman, whose friendship with a fun, sappy, go-with-the-flow guy named Wade challenges her beliefs about the world they live in.', 'https://www.youtube.com/embed/-cT495xKvvs?si=RIo8ufbLqQbi-IoB', 'https://static.telepedia.net/newqualitipediawiki/thumb/c/c1/Elemental2023.jpg/640px-Elemental2023.jpg', 101, 'PG', 496444300, (SELECT director_id FROM Directors WHERE director_name = 'Peter Sohn')),
('Encanto', 2021, 'Encanto is a heartwarming story about the Madrigal family, who live in a magical town hidden in the mountains of Colombia. Each member of the Madrigal family has a unique gift, except for Mirabel, the only one without any special powers. When their towns magic begins to fade, its up to Mirabel to discover the source of the problem and save the magic of their family and their town.', 'https://www.youtube.com/embed/CaimKeDcudo?si=U9eOWCSl51ES4RLx', 'https://th.bing.com/th/id/OIP.z8NUz6Y9vFNsB5oJvSLNnAHaK_?rs=1&pid=ImgDetMain', 120, 'PG', 26134873, (SELECT director_id FROM Directors WHERE director_name = 'Jared Bush · Byron Howard')),
('E.T. the Extra-Terrestrial', 1982, 'A troubled child summons the courage to help a friendly alien escape Earth and return to his home planet.', 'https://www.youtube.com/embed/qYAETtIIClk?si=7-V82lJhwlQrCv6y', 'https://m.media-amazon.com/images/I/71hePU1hACL._SL1500_.jpg', 115, 'PG', 792910554, (SELECT director_id FROM Directors WHERE director_name = 'Steven Spielberg')),
('Finding Nemo', 2003, 'After his son is captured in the Great Barrier Reef and taken to Sydney, a timid clownfish sets out on a journey to bring him home.', 'https://www.youtube.com/embed/9oQ628Seb9w?si=7pEA-1HbzVqhqBHD', 'https://th.bing.com/th/id/OIP.FL7b5widJ_SUTEeczXOUGwHaK6?rs=1&pid=ImgDetMain', 100, 'G', 940335536, (SELECT director_id FROM Directors WHERE director_name = 'Andrew Stanton')),
('Ferdinand', 2017, 'In Spain, a calf named Ferdinand lives with other bulls at Señor Morenos "Casa del Toro", where they are trained for bullfighting. Ferdinand is a pacifist and loves flowers, causing his fellow calves Valiente, Guapo, and Bones to mock him. The matador arrives, and the calves fathers fight to impress him.', 'https://www.youtube.com/embed/s-XHMNDgre8?si=wpwt2A8oZpgsibrq', 'https://image.tmdb.org/t/p/original/cLCodvk78A3r0TLRckDt9hvbaE3.jpg', 108, 'PG', 677945399, (SELECT director_id FROM Directors WHERE director_name = 'Carlos Saldanha')),
('Frozen', 2013, 'Fearless optimist Anna teams up with rugged mountain man Kristoff and his loyal reindeer Sven in an epic journey to find Anna''s sister Elsa, whose icy powers have inadvertently trapped the kingdom of Arendelle in eternal winter.', 'https://www.youtube.com/embed/TbQm5doF_Uc?si=1JBoLVE88sG7hjWA', 'https://tse2.mm.bing.net/th/id/OIP.tuIFDE7t-HHjpEzi-q6e7gHaLH?rs=1&pid=ImgDetMain', 102, 'PG', 1284540518, (SELECT director_id FROM Directors WHERE director_name = 'Chris Buck')),
('Grave of the Fireflies', 1988, 'In March 1945, American bombers destroy most of Kobe during the waning days of the Pacific War. Children of an Imperial Japanese Navy captain, Seita and his sister Setsuko, survive, but their mother dies. Seita conceals their mothers death from Setsuko.', 'https://www.youtube.com/embed/lhlh7JVcTt8?si=aB3rKJ3vTeM42-h_', 'https://tse2.mm.bing.net/th/id/OIP.syvI0X7MT2U6w2Fq47EdPAAAAA?rs=1&pid=ImgDetMain', 88, 'PG', 46836000, (SELECT director_id FROM Directors WHERE director_name = 'Isao Takahata')),
('Godzilla', 1954, 'After a dinosaur-like beast - awoken from undersea hibernation by atom bomb testing - ravages Tokyo, a scientist must decide if his similarly dangerous weapon should be used to destroy it.', 'https://www.youtube.com/embed/vIu85WQTPRc?si=8njdEIPSOY6-KQGS', 'https://tse1.mm.bing.net/th/id/OIP.z-SVEdkfXyaszHgxSWo2ogHaLH?rs=1&pid=ImgDetMain', 149, 'G', 369330363, (SELECT director_id FROM Directors WHERE director_name = 'Ishirô Honda')),
('How to Train Your Dragon', 2010, 'A hapless young Viking who aspires to hunt dragons becomes the unlikely friend of a young dragon himself, and learns there may be more to the creatures than he assumed.', 'https://www.youtube.com/embed/1efv_rhnW6M?si=G58NPhG_aMtqRjpM', 'https://tse2.mm.bing.net/th/id/OIP.mm0IRy-T2iGe3jRKeyCIjAHaLu?rs=1&pid=ImgDetMain', 98, 'PG', 494878759, (SELECT director_id FROM Directors WHERE director_name = 'Dean DeBlois')),
('Inception', 2010, 'A thief who steals corporate secrets through use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', 'https://www.youtube.com/embed/YoHD9XEInc0?si=w87m7oImhawUVMlL', 'https://tse1.mm.bing.net/th/id/OIP.bdpZ-UtWfSUdpQflPjVeJQHaKb?w=588&h=828&rs=1&pid=ImgDetMain', 148, 'PG-13', 828322195, (SELECT director_id FROM Directors WHERE director_name = 'Christopher Nolan')),
('Inglourious Basterds', 2009, 'In Nazi-occupied France during World War II, a group of Jewish-American soldiers known as the "Basterds" are chosen to spread fear throughout the Third Reich by scalping and brutally killing Nazis.', 'https://www.youtube.com/embed/KnrRy6kSFF0?si=FxbVc1NubTH1twNh', 'https://www.bestmovieposters.co.uk/wp-content/uploads/2019/01/zhCyNgJM.jpeg', 153, 'R', 321455689, (SELECT director_id FROM Directors WHERE director_name = 'Quentin Tarantino')),
('Interstellar', 2014, 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity''s survival.', 'https://www.youtube.com/embed/zSWdZVtXT7E?si=1HYXX1FaNvTHKBM5', 'https://halifaxbloggers.ca/flawintheiris/wp-content/uploads/sites/7/2014/11/Interstellar-Poster-HD-Wallpapers-Images-Pics-24.jpg', 169, 'PG-13', 701729206, (SELECT director_id FROM Directors WHERE director_name = 'Christopher Nolan')),
('Jumanji', 1995, 'In 1969, Alan Parrish lives in Brantford, New Hampshire, with his parents, Sam and Carol. One day, he escapes a group of bullies and retreats to Sams shoe factory. His friend Carl Bentley reveals a new shoe prototype he made himself.', 'https://www.youtube.com/embed/2QKg5SZ_35I?si=0gbl0r8bsuz7rmk4', 'https://th.bing.com/th/id/R.4ac6566ad29683b45bb83b7715b89179?rik=Z7D5NQzcMd3Ezw&pid=ImgRaw&r=0', 124, 'PG', 962650800, (SELECT director_id FROM Directors WHERE director_name = 'Joe Johnston')),
('Jujutsu Kaisen', 2020, 'Jujutsu Kaisen" follows high school student Yuji Itadori as he becomes embroiled in a world of curses and sorcery after ingesting a cursed talisman, leading him to join a secret organization of Jujutsu Sorcerers to combat powerful curses, including the ancient sorcerer Ryomen Sukuna, of whom he becomes the host.', 'https://www.youtube.com/embed/pkKu9hLT-t8?si=0yd4Bqlkv7zVx9_0', 'https://static.posters.cz/image/750/posters/jujutsu-kaisen-jujutsushi-i195602.jpg', 122, 'R', 1074251311, (SELECT director_id FROM Directors WHERE director_name = 'Shouta Goshozono')),
('Jurassic Park', 1993, 'A pragmatic paleontologist touring an island theme park filled with dinosaurs is tasked with protecting a couple of kids after a power failure causes the creatures to run amok.', 'https://www.youtube.com/embed/jan5CFWs9ic?si=zh1YQSAZvFLi2M0y', 'https://tse2.mm.bing.net/th/id/OIP.5_n4LaB7F5mid76mBByLyAHaLH?rs=1&pid=ImgDetMain', 127, 'PG-13', 1033909774, (SELECT director_id FROM Directors WHERE director_name = 'Steven Spielberg')),
('Kimi no Na wa (Your Name.)', 2016, 'Two strangers find themselves linked in a bizarre way. When a comet approaches Earth, they realize that they must find each other before time runs out.', 'https://www.youtube.com/embed/NooIc3dMncc?si=VjlOXaHKXTdiIk6o', 'https://tse2.mm.bing.net/th/id/OIP.kslmL_eXpN8Foj8fx_LbEgAAAA?rs=1&pid=ImgDetMain', 106, 'PG', 382218730, (SELECT director_id FROM Directors WHERE director_name = 'Makoto Shinkai')),
('Klaus', 2019, 'A simple act of kindness always sparks another, even in a frozen, faraway place. When Smeerensburg’s new postman, Jesper, befriends toy maker Klaus, their unlikely friendship melts an ancient feud and delivers a sleigh full of magical traditions.', 'https://www.youtube.com/embed/taE3PwurhYM?si=bSVwulmO7rhqKg6h', 'https://th.bing.com/th/id/R.8c00185d3d0158f433627779df0a1f2c?rik=dk1rTt3867Jv5A&pid=ImgRaw&r=0', 96, 'PG', 4000000, (SELECT director_id FROM Directors WHERE director_name = 'Sergio Pablos')), -- Added Director
('Life of Pi', 2001, 'Life of Pi" is a captivating tale of survival, faith, and the power of storytelling, following the journey of Pi Patel, who survives a shipwreck and shares a lifeboat with a Bengal tiger named Richard Parker for 227 days.', 'https://www.youtube.com/embed/3mMN693-F3U?si=qz0_83xe01rnuU_D', 'https://th.bing.com/th/id/R.9c434504432c785e3e31cbfc714ca301?rik=Bbf3k9SwS4j4%2bw&riu=http%3a%2f%2fwww.impawards.com%2f2012%2fposters%2flife_of_pi_ver2_xlg.jpg&ehk=%2bxDE1hlaMDr7CoDakWw%2fCZNpn%2bmGoEmpDnYfl0inbl8%3d&risl=&pid=ImgRaw&r=0', 127, 'PG', 447470402, (SELECT director_id FROM Directors WHERE director_name = 'Ang lee')),
('Lion King, The', 1994, 'A young lion prince flees his kingdom after the murder of his father, only to return later to reclaim his rightful place.', 'https://www.youtube.com/embed/o17MF9vnabg?si=Sk3mEvQDi8nq9Yi4', 'https://tse1.explicit.bing.net/th/id/OIP.egzFxoFHd70YxYHld6tZlgHaLH?rs=1&pid=ImgDetMain', 88, 'G', 968483777, (SELECT director_id FROM Directors WHERE director_name = 'Roger Allers')),
('Monsters University', 2013, 'When Mike Wazowski (Billy Crystal) is young, he visits Monsters University on a tour of his primary school. A senior student gives his hat to Mike, and he plans to become a scary monster.', 'https://www.youtube.com/embed/QxrQ6BaijAY?si=zAXlqkVuOYFe6nEk', 'https://tse2.mm.bing.net/th/id/OIP.NrUnAXhSDSpdTPWvcNsf4AHaLH?rs=1&pid=ImgDetMain', 92, 'G', 375253821, (SELECT director_id FROM Directors WHERE director_name = 'Dan Scanlon')),
('My Neighbor Totoro', 1988, 'Two sisters move to the countryside and discover various mythical creatures, including Totoro, a friendly forest spirit.', 'https://www.youtube.com/embed/92a7Hj0ijLs?si=HgH-QADfxyUaJaHo', 'https://tse3.mm.bing.net/th/id/OIP.0gelSwBP44NtBl18Xnrf0AHaLG?rs=1&pid=ImgDetMain', 86, 'G', 30000000, (SELECT director_id FROM Directors WHERE director_name = 'Hayao Miyazaki')),
('Mulan', 1998, 'A Chinese legend about a young woman who disguises herself as a man to take her fathers place in the army and fight against the invading Huns.', 'https://www.youtube.com/embed/HKH7_n425Ss?si=NCAcgxWCanYOAdQ3', 'https://th.bing.com/th/id/R.dffef5c601692c533c51b798df84b7a0?rik=9yW%2f8c6Wa1fgYw&pid=ImgRaw&r=0', 88, 'G', 304713813, (SELECT director_id FROM Directors WHERE director_name = 'Barry Cook')),
('Monsters, Inc.', 2001, 'Monsters generate their city''s power by scaring children, but they are terrified of being contaminated by kids, so when one enters Monstropolis, top scarer Sulley finds his life in chaos.', 'https://www.youtube.com/embed/CGbgaHoapFM?si=drEzdSxXo26feGKc', 'https://image.tmdb.org/t/p/original/hHRvKl4zwS234fcjypa82A2Ecjr.jpg', 92, 'G', 577425749, (SELECT director_id FROM Directors WHERE director_name = 'Pete Docter')),
('Naruto the Movie: Ninja Clash in the Land of Snow', 2004, 'Naruto, Sasuke, and Sakura are tasked to protect Princess Koyuki Kazahana from those who want to capture her.', 'https://www.youtube.com/embed/p2mXWbW9YZI?si=QZvj4F6iZ-a4AAJB', 'https://tse3.mm.bing.net/th/id/OIP.0pUAsuRtKD--hU8jKrukQgHaLH?rs=1&pid=ImgDetMain', 83, 'PG', 171627170, (SELECT director_id FROM Directors WHERE director_name = 'Tensai Okamura')),
('Oppenheimer', 2023, 'The story of J. Robert Oppenheimer''s role in the development of the atomic bomb during World War II.', 'https://www.youtube.com/embed/uYPbbksJxIg?si=d5XjnKJ-LWs1tSGg', 'https://cdna.artstation.com/p/assets/images/images/063/096/684/large/william-j-harris-oppenheimer-movie-poster-2023.jpg?1684720979', 180, 'R', 953880590, (SELECT director_id FROM Directors WHERE director_name = 'Christopher Nolan')),
('Paddington 2', 2017, 'Paddington, now happily settled with the Brown family and a popular member of the local community, picks up a series of odd jobs to buy a unique pop-up book for his Aunt Lucy''s 100th birthday, but when the book is stolen, he and the Browns must unmask the thief.', 'https://www.youtube.com/embed/sw7RElt-SvE?si=rxLBW50FTXf83zF0', 'https://th.bing.com/th/id/R.7f83068a44b74248827bbf15cd753a4c?rik=SHp65G0NGLvS2Q&riu=http%3a%2f%2fwww.impawards.com%2fintl%2fuk%2f2017%2fposters%2fpaddington_two_ver20_xlg.jpg&ehk=QsR%2fvwHFLmdkItGYxxxsuY1I1xKmkrGpBgMaFoDPWDo%3d&risl=&pid=ImgRaw&r=0', 103, 'PG', 227694936, (SELECT director_id FROM Directors WHERE director_name = 'Paul King')),
('Panda Kung Fu 4', 2024, 'Po is appointed the spiritual leader of the Valley of Peace, but needs to find and train a new Dragon Warrior before he can do so.', 'https://www.youtube.com/embed/_inKs4eeHiI?si=4A9taqlwIvNumMh3', 'https://image.tmdb.org/t/p/original/m2kZvaKUcqJb8O72258cTF3KyMR.jpg', 94, 'PG', 537330000, (SELECT director_id FROM Directors WHERE director_name = 'Mike Mitchell')), -- Added Director
('Parasite', 2019, 'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.', 'https://www.youtube.com/embed/5xH0HfJHsaY?si=l6EYCmgQs-YdkloK', 'https://th.bing.com/th/id/OIP.Q_kdreUaFwlVn0-fssGMXAHaLH?rs=1&pid=ImgDetMain', 132, 'R', 258971844, (SELECT director_id FROM Directors WHERE director_name = 'Bong Joon-ho')),
('Ratatouille', 2007, 'A rat who can cook makes an unusual alliance with a young kitchen worker at a famous Paris restaurant.', 'https://www.youtube.com/embed/NgsQ8mVkN8w?si=_T1hoMFfh9juZIxL', 'https://tse1.explicit.bing.net/th/id/OIP.boLxpHMKs8jNaXsySjHUdwHaLH?rs=1&pid=ImgDetMain', 111, 'G', 623722818, (SELECT director_id FROM Directors WHERE director_name = 'Brad Bird')),
('Rio', 2011, 'A domesticated Spixs macaw travels to Rio de Janeiro to mate with the last female of his species.', 'https://www.youtube.com/embed/P1GRO31ve5Q?si=huBnIv0IMe8W2jNv', 'https://th.bing.com/th/id/R.e0b82122d3788823ca99edbff67b71d1?rik=jEHE0%2bXLqAOnxA&pid=ImgRaw&r=0', 98, 'G', 4700000, (SELECT director_id FROM Directors WHERE director_name = 'Carlos Saldanha')),
('Spirited Away', 2001, 'During her family''s move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts.', 'https://www.youtube.com/embed/ByXuk9QqQkk?si=Uwpaqv1wlwd-ZFur', 'https://tse2.mm.bing.net/th/id/OIP.V8Eub5UyKkQ0EBnA3uRvQQHaKe?rs=1&pid=ImgDetMain', 125, 'PG', 395800000, (SELECT director_id FROM Directors WHERE director_name = 'Hayao Miyazaki')),
('Spider-Man: Across the Spider-Verse', 2023, 'Miles Morales catapults across the Multiverse, where he encounters a team of Spider-People charged with protecting its very existence. When the heroes clash on how to handle a new threat, Miles finds himself pitted against the other Spiders and must redefine what it means to be a hero so he can save the people he loves most.', 'https://www.youtube.com/embed/cqGjhVJWtEg?si=j-baqT_i19Ivp1Kr', 'https://tse4.mm.bing.net/th/id/OIP.N7LXprOjNxxuK2yopIwhegHaK-?rs=1&pid=ImgDetMain', 140, 'PG', 690516673, (SELECT director_id FROM Directors WHERE director_name = 'Joaquim Dos Santos')),
('Toy Story 3', 2010, 'Woody, Buzz, and their toy friends face an uncertain future when their owner, Andy, prepares to leave for college.', 'https://www.youtube.com/embed/2BlMNH1QTeE?si=Myt8VEfZRuMztTmu', 'https://tse4.mm.bing.net/th/id/OIP.fx0cuYkoBR1hwWNgqs61YQHaLH?rs=1&pid=ImgDetMain', 142, 'R', 28341469, (SELECT director_id FROM Directors WHERE director_name = 'John Lasseter')),
('The Promised Neverland', 2019, 'The story takes place in an orphanage called the Grace Field House, where children live in a seemingly idyllic environment. However, the main characters, Emma, Norman, and Ray, soon discover that they are actually being raised as livestock for demons, who consume the children to sustain their own lives', 'https://www.youtube.com/embed/ApLudqucq-s?si=6d4DUAvmqdzUCjng', 'https://tse4.mm.bing.net/th/id/OIP.7E7wKTNubuobaZl81OhS2wHaLG?w=501&h=751&rs=1&pid=ImgDetMain', 120, 'PG-13', 224920315, (SELECT director_id FROM Directors WHERE director_name = 'Mamoru Kanbe')),
('Toy Story', 1995, 'A cowboy doll is profoundly threatened and jealous when a new spaceman figure supplants him as top toy in a boy''s room.', 'https://www.youtube.com/embed/v-PjgYDrg70?si=Uyg3gLtbMwenH8qG', 'https://tse1.mm.bing.net/th/id/OIP.PIIvkkk_89npg9jVXWJ6MwHaK8?rs=1&pid=ImgDetMain', 81, 'G', 396495393, (SELECT director_id FROM Directors WHERE director_name = 'John Lasseter')),
('Up', 2009, '78-year-old Carl Fredricksen fulfills a lifelong dream of adventure by tying thousands of balloons to his house and flying to the South American wilderness.', 'https://www.youtube.com/embed/HWEW_qTLSEE?si=oYdC5xFJuPUipxsK', 'https://th.bing.com/th/id/R.d156595161676a009ff1fd6e8e137555?rik=C6gx0CSJtulHsg&riu=http%3a%2f%2fcherish365.com%2fwp-content%2fuploads%2f2015%2f11%2fup-movie-poster.jpg&ehk=CsOdxuLYl7jiaj%2bqtvCHpJUatEVuaxApDMcnZssIhgY%3d&risl=&pid=ImgRaw&r=0', 96, 'G', 735099082, (SELECT director_id FROM Directors WHERE director_name = 'Pete Docter')),
('Whisper of the heart', 1995, 'Shizuku, a young girl who aspires to be a writer, as she encounters a mysterious cat statue that leads her to Seiji, a boy determined to become a master violin maker. Together, they embark on a life-changing adventure beyond the boundaries of their imagination. ', 'https://www.youtube.com/embed/0pVkiod6V0U?si=J95zI3ya9dUhAek1', 'https://tse4.mm.bing.net/th/id/OIP.GMWMBauaTF9ljRtl7gK5kAHaLH?rs=1&pid=ImgDetMain', 111, 'G', 532308939, (SELECT director_id FROM Directors WHERE director_name = 'Hayo Miyazaki')),
('Winnie the Pooh', 2011, 'Winnie the Pooh is a beloved childrens story about a friendly and naive bear named Pooh, who lives in the Hundred Acre Wood with his animal friends. Pooh loves honey and often gets into humorous misadventures with his friends', 'https://www.youtube.com/embed/QbFz--GCkOM?si=SWcMydttHDjdNlzM', 'https://tse3.mm.bing.net/th/id/OIP.xoOpkhBadK8uM4pXuW5K9QHaLH?rs=1&pid=ImgDetMain', 63, 'G', 50281267, (SELECT director_id FROM Directors WHERE director_name = 'Don Hall')),
('Zootopia', 2016, 'In a city of anthropomorphic animals, a rookie bunny cop and a cynical con artist fox uncover a conspiracy.', 'https://www.youtube.com/embed/jWM0ct-OLsM?si=QjLgum9MAlHBsy2D', 'https://tse1.explicit.bing.net/th/id/OIP.7GP1-HqRQwLGYSc4HHw_cgHaKj?rs=1&pid=ImgDetMain', 108, 'PG', 1023784195, (SELECT director_id FROM Directors WHERE director_name = 'Byron Howard'));


-- MovieGenres (Linking movies to genres)
INSERT INTO MovieGenres (movie_id, genre_id) VALUES
((SELECT movie_id FROM Movies WHERE movie_title = 'Akira'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Akira'), (SELECT genre_id FROM Genres WHERE genre_name = 'Sci-Fi')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Akira'), (SELECT genre_id FROM Genres WHERE genre_name = 'Action')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Arrival'), (SELECT genre_id FROM Genres WHERE genre_name = 'Sci-Fi')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Arrival'), (SELECT genre_id FROM Genres WHERE genre_name = 'Drama')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Anohana the Movie: The Flower We Saw That Day'), (SELECT genre_id FROM Genres WHERE genre_name = 'Comedy')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Anohana the Movie: The Flower We Saw That Day'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Avengers: Endgame'), (SELECT genre_id FROM Genres WHERE genre_name = 'Action')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Avengers: Endgame'), (SELECT genre_id FROM Genres WHERE genre_name = 'Adventure')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Beauty and the Beast'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Beauty and the Beast'), (SELECT genre_id FROM Genres WHERE genre_name = 'Family')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Big Hero 6'), (SELECT genre_id FROM Genres WHERE genre_name = 'Comedy')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Big Hero 6'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Bambi'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Bambi'), (SELECT genre_id FROM Genres WHERE genre_name = 'Adventure')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Castle in the Sky'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Castle in the Sky'), (SELECT genre_id FROM Genres WHERE genre_name = 'Adventure')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Coco'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Coco'), (SELECT genre_id FROM Genres WHERE genre_name = 'Family')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Cars 3'), (SELECT genre_id FROM Genres WHERE genre_name = 'Comedy')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Cars 3'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Cindrella'), (SELECT genre_id FROM Genres WHERE genre_name = 'Fantasy')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Cindrella'), (SELECT genre_id FROM Genres WHERE genre_name = 'Drama')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Death Note'), (SELECT genre_id FROM Genres WHERE genre_name = 'Fantasy')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Death Note'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Doraemon Movie Nobita the Explorer Bow Bow'), (SELECT genre_id FROM Genres WHERE genre_name = 'Mystery')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Doraemon Movie Nobita the Explorer Bow Bow'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Doraemon: Nobitas Space Heroes'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Doraemon: Nobitas Space Heroes'), (SELECT genre_id FROM Genres WHERE genre_name = 'Mystery')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Elemental'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Elemental'), (SELECT genre_id FROM Genres WHERE genre_name = 'Family')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Encanto'), (SELECT genre_id FROM Genres WHERE genre_name = 'Comedy')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Encanto'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'E.T. the Extra-Terrestrial'), (SELECT genre_id FROM Genres WHERE genre_name = 'Sci-Fi')),
((SELECT movie_id FROM Movies WHERE movie_title = 'E.T. the Extra-Terrestrial'), (SELECT genre_id FROM Genres WHERE genre_name = 'Family')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Finding Nemo'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Finding Nemo'), (SELECT genre_id FROM Genres WHERE genre_name = 'Family')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Ferdinand'), (SELECT genre_id FROM Genres WHERE genre_name = 'Comedy')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Ferdinand'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Frozen'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Frozen'), (SELECT genre_id FROM Genres WHERE genre_name = 'Family')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Grave of the Fireflies'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Grave of the Fireflies'), (SELECT genre_id FROM Genres WHERE genre_name = 'Drama')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Godzilla'), (SELECT genre_id FROM Genres WHERE genre_name = 'Sci-Fi')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Godzilla'), (SELECT genre_id FROM Genres WHERE genre_name = 'Horror')),
((SELECT movie_id FROM Movies WHERE movie_title = 'How to Train Your Dragon'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'How to Train Your Dragon'), (SELECT genre_id FROM Genres WHERE genre_name = 'Adventure')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Inception'), (SELECT genre_id FROM Genres WHERE genre_name = 'Sci-Fi')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Inception'), (SELECT genre_id FROM Genres WHERE genre_name = 'Action')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Inglourious Basterds'), (SELECT genre_id FROM Genres WHERE genre_name = 'Sci-Fi')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Inglourious Basterds'), (SELECT genre_id FROM Genres WHERE genre_name = 'Drama')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Interstellar'), (SELECT genre_id FROM Genres WHERE genre_name = 'Sci-Fi')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Interstellar'), (SELECT genre_id FROM Genres WHERE genre_name = 'Adventure')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Jumanji'), (SELECT genre_id FROM Genres WHERE genre_name = 'Fantasy')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Jumanji'), (SELECT genre_id FROM Genres WHERE genre_name = 'Family')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Jujutsu Kaisen'), (SELECT genre_id FROM Genres WHERE genre_name = 'Fantasy')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Jujutsu Kaisen'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Jurassic Park'), (SELECT genre_id FROM Genres WHERE genre_name = 'Sci-Fi')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Jurassic Park'), (SELECT genre_id FROM Genres WHERE genre_name = 'Adventure')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Kimi no Na wa (Your Name.)'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Kimi no Na wa (Your Name.)'), (SELECT genre_id FROM Genres WHERE genre_name = 'Romance')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Klaus'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Klaus'), (SELECT genre_id FROM Genres WHERE genre_name = 'Family')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Life of Pi'), (SELECT genre_id FROM Genres WHERE genre_name = 'Fantasy')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Life of Pi'), (SELECT genre_id FROM Genres WHERE genre_name = 'Adventure')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Lion King, The'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Lion King, The'), (SELECT genre_id FROM Genres WHERE genre_name = 'Family')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Monsters University'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Monsters University'), (SELECT genre_id FROM Genres WHERE genre_name = 'Comedy')),
((SELECT movie_id FROM Movies WHERE movie_title = 'My Neighbor Totoro'), (SELECT genre_id FROM Genres WHERE genre_name = 'Fantasy')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Mulan'), (SELECT genre_id FROM Genres WHERE genre_name = 'Adventure')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Mulan'), (SELECT genre_id FROM Genres WHERE genre_name = 'Family')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Monsters, Inc.'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Monsters, Inc.'), (SELECT genre_id FROM Genres WHERE genre_name = 'Comedy')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Naruto the Movie: Ninja Clash in the Land of Snow'), (SELECT genre_id FROM Genres WHERE genre_name = 'Action')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Naruto the Movie: Ninja Clash in the Land of Snow'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Oppenheimer'), (SELECT genre_id FROM Genres WHERE genre_name = 'Biography')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Oppenheimer'), (SELECT genre_id FROM Genres WHERE genre_name = 'Drama')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Paddington 2'), (SELECT genre_id FROM Genres WHERE genre_name = 'Family')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Paddington 2'), (SELECT genre_id FROM Genres WHERE genre_name = 'Comedy')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Panda Kung Fu 4'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Panda Kung Fu 4'), (SELECT genre_id FROM Genres WHERE genre_name = 'Family')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Parasite'), (SELECT genre_id FROM Genres WHERE genre_name = 'Drama')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Parasite'), (SELECT genre_id FROM Genres WHERE genre_name = 'Thriller')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Ratatouille'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Ratatouille'), (SELECT genre_id FROM Genres WHERE genre_name = 'Family')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Rio'), (SELECT genre_id FROM Genres WHERE genre_name = 'Adventure')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Rio'), (SELECT genre_id FROM Genres WHERE genre_name = 'Comedy')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Spirited Away'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Spirited Away'), (SELECT genre_id FROM Genres WHERE genre_name = 'Fantasy')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Spider-Man: Across the Spider-Verse'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Spider-Man: Across the Spider-Verse'), (SELECT genre_id FROM Genres WHERE genre_name = 'Action')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Toy Story 3'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Toy Story 3'), (SELECT genre_id FROM Genres WHERE genre_name = 'Family')),
((SELECT movie_id FROM Movies WHERE movie_title = 'The Promised Neverland'), (SELECT genre_id FROM Genres WHERE genre_name = 'Fantasy')),
((SELECT movie_id FROM Movies WHERE movie_title = 'The Promised Neverland'), (SELECT genre_id FROM Genres WHERE genre_name = 'Sci-Fi')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Toy Story'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Toy Story'), (SELECT genre_id FROM Genres WHERE genre_name = 'Family')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Up'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Up'), (SELECT genre_id FROM Genres WHERE genre_name = 'Adventure')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Whisper of the heart'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Whisper of the heart'), (SELECT genre_id FROM Genres WHERE genre_name = 'Romance')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Winnie the Pooh'), (SELECT genre_id FROM Genres WHERE genre_name = 'Family')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Winnie the Pooh'), (SELECT genre_id FROM Genres WHERE genre_name = 'Musical')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Zootopia'), (SELECT genre_id FROM Genres WHERE genre_name = 'Animation')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Zootopia'), (SELECT genre_id FROM Genres WHERE genre_name = 'Family'));


-- MovieActors (Linking movies to actors)
INSERT IGNORE INTO MovieActors (movie_id, actor_id) VALUES
((SELECT movie_id FROM Movies WHERE movie_title = 'Akira'), (SELECT actor_id FROM Actors WHERE actor_name = 'Mitsuo Iwata')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Akira'), (SELECT actor_id FROM Actors WHERE actor_name = 'Nozomu Sasaki')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Arrival'), (SELECT actor_id FROM Actors WHERE actor_name = 'Amy Adams')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Arrival'), (SELECT actor_id FROM Actors WHERE actor_name = 'Jeremy Renner')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Anohana the Movie: The Flower We Saw That Day'), (SELECT actor_id FROM Actors WHERE actor_name = 'Megumi Han')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Anohana the Movie: The Flower We Saw That Day'), (SELECT actor_id FROM Actors WHERE actor_name = 'Ikumi Hayama')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Avengers: Endgame'), (SELECT actor_id FROM Actors WHERE actor_name = 'Robert Downey Jr.')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Avengers: Endgame'), (SELECT actor_id FROM Actors WHERE actor_name = 'Chris Evans')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Beauty and the Beast'), (SELECT actor_id FROM Actors WHERE actor_name = 'Paige O''Hara')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Beauty and the Beast'), (SELECT actor_id FROM Actors WHERE actor_name = 'Robbie Benson')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Big Hero 6'), (SELECT actor_id FROM Actors WHERE actor_name = 'Ryan Potter')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Big Hero 6'), (SELECT actor_id FROM Actors WHERE actor_name = 'Scott Adsit')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Bambi'), (SELECT actor_id FROM Actors WHERE actor_name = 'Janet Chapman')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Bambi'), (SELECT actor_id FROM Actors WHERE actor_name = 'Hardie Albright')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Castle in the Sky'), (SELECT actor_id FROM Actors WHERE actor_name = 'Mayumi Tanaka')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Castle in the Sky'), (SELECT actor_id FROM Actors WHERE actor_name = 'Keiko Yokozawa')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Coco'), (SELECT actor_id FROM Actors WHERE actor_name = 'Anthony Gonzalez')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Coco'), (SELECT actor_id FROM Actors WHERE actor_name = 'Gael García Bernal')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Cars 3'), (SELECT actor_id FROM Actors WHERE actor_name = 'Owen Wilson')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Cars 3'), (SELECT actor_id FROM Actors WHERE actor_name = 'Cristela Alonzo')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Cindrella'), (SELECT actor_id FROM Actors WHERE actor_name = 'Clive Owen')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Cindrella'), (SELECT actor_id FROM Actors WHERE actor_name = 'Julianne Moore')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Death Note'), (SELECT actor_id FROM Actors WHERE actor_name = 'Mamoru Miyano')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Death Note'), (SELECT actor_id FROM Actors WHERE actor_name = 'Kappei Yamaguchi')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Doraemon Movie Nobita the Explorer Bow Bow'), (SELECT actor_id FROM Actors WHERE actor_name = 'Yumi Kakazu')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Doraemon Movie Nobita the Explorer Bow Bow'), (SELECT actor_id FROM Actors WHERE actor_name = 'Megumi Ohara')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Doraemon: Nobitas Space Heroes'), (SELECT actor_id FROM Actors WHERE actor_name = 'Megumi Ohara')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Doraemon: Nobitas Space Heroes'), (SELECT actor_id FROM Actors WHERE actor_name = 'Yumi Kakazu')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Elemental'), (SELECT actor_id FROM Actors WHERE actor_name = 'Leah Lewis')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Elemental'), (SELECT actor_id FROM Actors WHERE actor_name = 'Mamoudou Athie')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Encanto'), (SELECT actor_id FROM Actors WHERE actor_name = 'Wilmer Valderrama')),
((SELECT movie_id FROM Movies WHERE movie_title = 'E.T. the Extra-Terrestrial'), (SELECT actor_id FROM Actors WHERE actor_name = 'Henry Thomas')),
((SELECT movie_id FROM Movies WHERE movie_title = 'E.T. the Extra-Terrestrial'), (SELECT actor_id FROM Actors WHERE actor_name = 'Drew Barrymore')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Finding Nemo'), (SELECT actor_id FROM Actors WHERE actor_name = 'Albert Brooks')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Finding Nemo'), (SELECT actor_id FROM Actors WHERE actor_name = 'Ellen DeGeneres')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Ferdinand'), (SELECT actor_id FROM Actors WHERE actor_name = 'John Cena')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Frozen'), (SELECT actor_id FROM Actors WHERE actor_name = 'Kristen Bell')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Frozen'), (SELECT actor_id FROM Actors WHERE actor_name = 'Idina Menzel')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Grave of the Fireflies'), (SELECT actor_id FROM Actors WHERE actor_name = 'Akemi Yamaguchi')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Grave of the Fireflies'), (SELECT actor_id FROM Actors WHERE actor_name = 'Tatsumi Katayama')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Godzilla'), (SELECT actor_id FROM Actors WHERE actor_name = 'Momoko Kōchi')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Godzilla'), (SELECT actor_id FROM Actors WHERE actor_name = 'Akira Takarada')),
((SELECT movie_id FROM Movies WHERE movie_title = 'How to Train Your Dragon'), (SELECT actor_id FROM Actors WHERE actor_name = 'Jay Baruchel')),
((SELECT movie_id FROM Movies WHERE movie_title = 'How to Train Your Dragon'), (SELECT actor_id FROM Actors WHERE actor_name = 'Gerard Butler')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Inception'), (SELECT actor_id FROM Actors WHERE actor_name = 'Leonardo DiCaprio')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Inception'), (SELECT actor_id FROM Actors WHERE actor_name = 'Joseph Gordon-Levitt')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Inglourious Basterds'), (SELECT actor_id FROM Actors WHERE actor_name = 'Brad Pitt')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Inglourious Basterds'), (SELECT actor_id FROM Actors WHERE actor_name = 'Christoph Waltz')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Interstellar'), (SELECT actor_id FROM Actors WHERE actor_name = 'Matthew McConaughey')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Interstellar'), (SELECT actor_id FROM Actors WHERE actor_name = 'Anne Hathaway')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Jumanji'), (SELECT actor_id FROM Actors WHERE actor_name = 'Robin Williams')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Jumanji'), (SELECT actor_id FROM Actors WHERE actor_name = 'Bonnie Hunt')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Jurassic Park'), (SELECT actor_id FROM Actors WHERE actor_name = 'Sam Neill')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Jurassic Park'), (SELECT actor_id FROM Actors WHERE actor_name = 'Laura Dern')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Kimi no Na wa (Your Name.)'), (SELECT actor_id FROM Actors WHERE actor_name = 'Ryunosuke Kamiki')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Kimi no Na wa (Your Name.)'), (SELECT actor_id FROM Actors WHERE actor_name = 'Mone Kamishiraishi')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Klaus'), (SELECT actor_id FROM Actors WHERE actor_name = 'Jason Schwartzman')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Klaus'), (SELECT actor_id FROM Actors WHERE actor_name = 'J.K. Simmons')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Life of Pi'), (SELECT actor_id FROM Actors WHERE actor_name = 'Irfan Khan')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Life of Pi'), (SELECT actor_id FROM Actors WHERE actor_name = 'Suraj Sharma')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Lion King, The'), (SELECT actor_id FROM Actors WHERE actor_name = 'Matthew Broderick')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Lion King, The'), (SELECT actor_id FROM Actors WHERE actor_name = 'Jeremy Irons')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Monsters University'), (SELECT actor_id FROM Actors WHERE actor_name = 'Billy Crystal')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Monsters University'), (SELECT actor_id FROM Actors WHERE actor_name = 'John Goodman')),
((SELECT movie_id FROM Movies WHERE movie_title = 'My Neighbor Totoro'), (SELECT actor_id FROM Actors WHERE actor_name = 'Noriko Hidaka')),
((SELECT movie_id FROM Movies WHERE movie_title = 'My Neighbor Totoro'), (SELECT actor_id FROM Actors WHERE actor_name = 'Chika Sakamoto')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Mulan'), (SELECT actor_id FROM Actors WHERE actor_name = 'Ming-Na Wen')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Mulan'), (SELECT actor_id FROM Actors WHERE actor_name = 'Ming-Na Wen')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Monsters, Inc.'), (SELECT actor_id FROM Actors WHERE actor_name = 'Billy Crystal')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Monsters, Inc.'), (SELECT actor_id FROM Actors WHERE actor_name = 'John Goodman')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Naruto the Movie: Ninja Clash in the Land of Snow'), (SELECT actor_id FROM Actors WHERE actor_name = 'Junko Takeuchi')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Naruto the Movie: Ninja Clash in the Land of Snow'), (SELECT actor_id FROM Actors WHERE actor_name = 'Noriaki Sugiyama')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Oppenheimer'), (SELECT actor_id FROM Actors WHERE actor_name = 'Cillian Murphy')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Oppenheimer'), (SELECT actor_id FROM Actors WHERE actor_name = 'Emily Blunt')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Paddington 2'), (SELECT actor_id FROM Actors WHERE actor_name = 'Ben Whishaw')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Paddington 2'), (SELECT actor_id FROM Actors WHERE actor_name = 'Hugh Grant')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Panda Kung Fu 4'), (SELECT actor_id FROM Actors WHERE actor_name = 'Jack Black')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Panda Kung Fu 4'), (SELECT actor_id FROM Actors WHERE actor_name = 'Awkwafina')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Parasite'), (SELECT actor_id FROM Actors WHERE actor_name = 'Song Kang-ho')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Ratatouille'), (SELECT actor_id FROM Actors WHERE actor_name = 'Patton Oswalt')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Ratatouille'), (SELECT actor_id FROM Actors WHERE actor_name = 'Lou Romano')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Rio'), (SELECT actor_id FROM Actors WHERE actor_name = 'Jesse Eisenberg')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Rio'), (SELECT actor_id FROM Actors WHERE actor_name = 'Anne Hathaway')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Spirited Away'), (SELECT actor_id FROM Actors WHERE actor_name = 'Rumi Hiiragi')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Spirited Away'), (SELECT actor_id FROM Actors WHERE actor_name = 'Miyu Irino')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Spider-Man: Across the Spider-Verse'), (SELECT actor_id FROM Actors WHERE actor_name = 'Shameik Moore')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Spider-Man: Across the Spider-Verse'), (SELECT actor_id FROM Actors WHERE actor_name = 'Hailee Steinfeld')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Toy Story 3'), (SELECT actor_id FROM Actors WHERE actor_name = 'Ned Beatty')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Toy Story 3'), (SELECT actor_id FROM Actors WHERE actor_name = 'Joan Cusack')),
((SELECT movie_id FROM Movies WHERE movie_title = 'The Promsied Neverland'), (SELECT actor_id FROM Actors WHERE actor_name = 'Sumire Morohoshi')),
((SELECT movie_id FROM Movies WHERE movie_title = 'The Promised Neverland'), (SELECT actor_id FROM Actors WHERE actor_name = 'Maaya Uchida')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Toy Story'), (SELECT actor_id FROM Actors WHERE actor_name = 'Tom Hanks')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Toy Story'), (SELECT actor_id FROM Actors WHERE actor_name = 'Tim Allen')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Up'), (SELECT actor_id FROM Actors WHERE actor_name = 'Edward Asner')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Up'), (SELECT actor_id FROM Actors WHERE actor_name = 'Christopher Plummer')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Whisper of the heart'), (SELECT actor_id FROM Actors WHERE actor_name = 'Issey Takahashi')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Whisper of the heart'), (SELECT actor_id FROM Actors WHERE actor_name = 'Keiju Kobayashi')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Winnie the Pooh'), (SELECT actor_id FROM Actors WHERE actor_name = 'Jim Cummings')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Zootopia'), (SELECT actor_id FROM Actors WHERE actor_name = 'Ginnifer Goodwin')),
((SELECT movie_id FROM Movies WHERE movie_title = 'Zootopia'), (SELECT actor_id FROM Actors WHERE actor_name = 'Jason Bateman'));

CREATE TABLE IF NOT EXISTS MovieReviews (
  review_id INT AUTO_INCREMENT PRIMARY KEY,
  movie_id INT NOT NULL,
  reviewer_name VARCHAR(255) NOT NULL,
  rating DECIMAL(2,1) NOT NULL CHECK (rating >= 1.0 AND rating <= 5.0), -- Rating from 1.0 to 5.0
  comment TEXT,
  review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE
);
INSERT INTO MovieReviews (movie_id, reviewer_name, rating, comment) VALUES
( (SELECT movie_id FROM Movies WHERE movie_title = 'Oppenheimer'), 'FilmFanatic', 4.5, 'A truly gripping and intense biographical drama!'),
( (SELECT movie_id FROM Movies WHERE movie_title = 'Oppenheimer'), 'ScienceLover', 5.0, 'Masterpiece of filmmaking, historically profound.');
drop view if exists MovieSummaryView;
CREATE VIEW MovieSummaryView AS
SELECT
    m.movie_id,
    m.movie_title,
    m.release_year,
    m.synopsis,
    m.poster_url,
    m.trailer_url,
    d.director_name AS director,
    GROUP_CONCAT(DISTINCT a.actor_name ORDER BY a.actor_name SEPARATOR ', ') AS actors,
    GROUP_CONCAT(DISTINCT g.genre_name ORDER BY g.genre_name SEPARATOR ', ') AS genres,
    AVG(r.rating) AS average_rating,
    MAX(m.box_office_revenue) AS box_office_revenue -- Assuming box_office_revenue is part of Movies table
FROM
    Movies m
LEFT JOIN
    Directors d ON m.director_id = d.director_id
LEFT JOIN
    MovieActors ma ON m.movie_id = ma.movie_id
LEFT JOIN
    Actors a ON ma.actor_id = a.actor_id
LEFT JOIN
    MovieGenres mg ON m.movie_id = mg.movie_id
LEFT JOIN
    Genres g ON mg.genre_id = g.genre_id
LEFT JOIN
    MovieReviews r ON m.movie_id = r.movie_id
GROUP BY
    m.movie_id, m.movie_title, m.release_year, m.synopsis, m.poster_url, m.trailer_url, d.director_name
ORDER BY
    m.movie_title;

SELECT
    M.movie_title,
    M.release_year,
    M.average_rating
FROM Movies AS M
JOIN Directors AS D ON M.director_id = D.director_id
WHERE D.director_name = 'Christopher Nolan'
ORDER BY M.release_year DESC;

SELECT
    M.movie_title,
    M.release_year,
    M.mpa_rating,
    M.average_rating
FROM Movies AS M
JOIN MovieGenres AS MG ON M.movie_id = MG.movie_id
JOIN Genres AS G ON MG.genre_id = G.genre_id
WHERE G.genre_name = 'Animation'
ORDER BY M.release_year DESC;

SELECT
    M.movie_title,
    M.release_year,
    GROUP_CONCAT(DISTINCT G.genre_name ORDER BY G.genre_name SEPARATOR ', ') AS genres
FROM Movies AS M
JOIN MovieActors AS MA ON M.movie_id = MA.movie_id
JOIN Actors AS A ON MA.actor_id = A.actor_id
LEFT JOIN MovieGenres AS MG ON M.movie_id = MG.movie_id
LEFT JOIN Genres AS G ON MG.genre_id = G.genre_id
WHERE A.actor_name = 'Tom Hanks'
GROUP BY M.movie_id
ORDER BY M.movie_title;


SELECT
    movie_title,
    release_year,
    average_rating
FROM Movies
ORDER BY average_rating DESC, movie_title ASC
LIMIT 5;

SELECT
    movie_title,
    release_year,
    mpa_rating,
    runtime_minutes
FROM Movies
WHERE release_year > 2015 AND mpa_rating = 'PG-13'
ORDER BY release_year DESC;

SELECT
    D.director_name,
    SUM(M.box_office_revenue) AS total_revenue
FROM Movies AS M
JOIN Directors AS D ON M.director_id = D.director_id
WHERE D.director_name = 'Steven Spielberg'
GROUP BY D.director_name;

SELECT movie_id FROM Movies WHERE movie_title = 'Oppenheimer'; 


SELECT movie_title, average_rating FROM Movies WHERE movie_title = 'Oppenheimer';


DELIMITER //

CREATE TRIGGER TR_UpdateMovieAverageRating_Insert
AFTER INSERT ON MovieReviews
FOR EACH ROW
BEGIN
    UPDATE Movies
    SET average_rating = (SELECT AVG(rating) FROM MovieReviews WHERE movie_id = NEW.movie_id)
    WHERE movie_id = NEW.movie_id;
END;
//

CREATE TRIGGER TR_UpdateMovieAverageRating_Update
AFTER UPDATE ON MovieReviews
FOR EACH ROW
BEGIN
    UPDATE Movies
    SET average_rating = (SELECT AVG(rating) FROM MovieReviews WHERE movie_id = NEW.movie_id)
    WHERE movie_id = NEW.movie_id;
END;
//

CREATE TRIGGER TR_UpdateMovieAverageRating_Delete
AFTER DELETE ON MovieReviews
FOR EACH ROW
BEGIN
    UPDATE Movies
    SET average_rating = COALESCE((SELECT AVG(rating) FROM MovieReviews WHERE movie_id = OLD.movie_id), 0.0)
    WHERE movie_id = OLD.movie_id;
END;
//

DELIMITER ;
select * from Movies;

SELECT * FROM MovieSummaryView LIMIT 5; 
SELECT COUNT(*) FROM MovieSummaryView; 
SELECT movie_title, genres FROM MovieSummaryView WHERE genres LIKE '%Animation%' LIMIT 5;
SELECT movie_title, genres FROM MovieSummaryView WHERE genres LIKE '%Action%' LIMIT 5;