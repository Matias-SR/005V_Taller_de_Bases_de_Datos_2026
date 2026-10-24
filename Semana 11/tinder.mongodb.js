use("maxitinder");

db.usuarios.insertOne(
    {
        "nombre" : "Pepito",
        "fotos" : [
            {
                "fecha_subida": "12/08/2026",
                "imagen" : "imagenes/Pepito/1.png"
            },
            {
                "fecha_subida": "21/10/2026",
                "imagen" : "imagenes/Pepito/1.png"
            }
        ],
        "edad": 45,
        "descripcion_perfil" : "Pepito juega a la pelota",
        "intereses" : [
            "pelota",
            "fumar",
            "cerveza"
        ]
    }
);


use("maxitinder");
db.usuarios.find();

use("maxitinder");
db.usuarios.insertMany(
    [
        {
            "nombre" : "María",
            "fotos" : [
                {
                    "fecha_subida": "11/07/2025",
                    "imagen" : "imagenes/Maria/1.png"
                },
                {
                    "fecha_subida": "04/03/2026",
                    "imagen" : "imagenes/Maria/1.png"
                }
            ],
            "edad": 26,
            "descripcion_perfil" : "Maria toma mate",
            "intereses" : [
                "danza"
            ]
        },
        {
            "nombre" : "Matías",
            "edad" : 24
        }
    ]
);

use("maxitinder");
db.usuarios.findOne(
    {
        "nombre": "Pepito"
    }
);

use("maxitinder");
db.usuarios.deleteOne(
    {
        "nombre": "Matías"
    }
);
