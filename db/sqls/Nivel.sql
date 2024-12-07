CREATE TABLE nivel (
    nivel_id INT AUTO_INCREMENT PRIMARY KEY,
    porcentaje_acumulacion FLOAT NOT NULL,
    visitas_necesarias INT NOT NULL
);


INSERT INTO (porcentaje_acumulacion, visitas_necesarias) VALUES
    (0.05, 0),
    (0.1, 13), 
    (0.1, 24);