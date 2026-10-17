
use('peliculas_lukas');

db.movie.insertMany(
    [{
        "titulo" : "Star wars IV",
        "duracion" : "120",
        "generos" : [
            "sci-fi",
            "aventura"
        ]
    },
    {
        "titulo" : "Shrek 2",
        "duracion" : "132"
    }]
);

use('peliculas_lukas');

db.movie.find();