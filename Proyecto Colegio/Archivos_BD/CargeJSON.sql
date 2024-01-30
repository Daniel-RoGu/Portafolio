Use bdColegio;

LOAD DATA INFILE 'C:/Program Files/MySQL/MySQL Server 8.0/Uploads/Genero.json'
INTO TABLE Genero
LINES TERMINATED BY '\r\n'
(@json)
SET nombreGenero = JSON_EXTRACT(@json, '$.generos');

/*SHOW VARIABLES LIKE "secure_file_priv";*/
