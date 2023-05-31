-- write your table creation sql here!
DROP TABLE IF EXISTS homicide_weapons;

CREATE TABLE homicide_weapons (
    id serial PRIMARY KEY,
    state varchar(14),
    all_weapons int DEFAULT 0,
    firearm int DEFAULT 0,
    handgun int DEFAULT 0,
    rifle int DEFAULT 0,
    shotgun int DEFAULT 0,
    sharp_object int DEFAULT 0,
    blunt_object int DEFAULT 0,
    body_part int DEFAULT 0,
    fire int DEFAULT 0,
    narcotics int DEFAULT 0,
    asphyxiation int DEFAULT 0,
    other int DEFAULT 0,
    not_specified int DEFAULT 0
);