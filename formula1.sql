CREATE DATABASE IF NOT EXISTS formula1;


USE formula1;


CREATE TABLE paises (

  cod_pais INT PRIMARY KEY AUTO_INCREMENT,
  nome_pais VARCHAR(50) NOT NULL
);



CREATE TABLE equipes (
  id_equipe INT PRIMARY KEY AUTO_INCREMENT,
  nome_equipe VARCHAR(100) NOT NULL,
  cod_pais INT,
  FOREIGN KEY (cod_pais) REFERENCES paises(cod_pais)
);



CREATE TABLE pilotos (
  id_piloto INT PRIMARY KEY AUTO_INCREMENT,
  nome_piloto VARCHAR(100) NOT NULL,
  cod_pais INT,
  id_equipe INT,
  FOREIGN KEY (cod_pais) REFERENCES paises(cod_pais),
  FOREIGN KEY (id_equipe) REFERENCES equipes(id_equipe)
);



CREATE TABLE corridas (
  id_gp INT PRIMARY KEY AUTO_INCREMENT,
  nome_gp VARCHAR(100) NOT NULL,
  cod_pais INT,
  quantidade_voltas INT,
  FOREIGN KEY (cod_pais) REFERENCES paises(cod_pais)
);



INSERT INTO paises (nome_pais) VALUES
('Brasil'),
('Itália'),
('França'),
('Bélgica'),
('Alemanha'),
('Reino Unido'),
('Espanha'),
('Holanda'),
('Suíça'),
('Áustria');


INSERT INTO equipes (nome_equipe, cod_pais) VALUES
('Ferrari', 2),
('McLaren', 6),
('Mercedes', 5),
('Red Bull Racing', 10),
('Williams', 6),
('Alpine', 3),
('Aston Martin', 6),
('Haas', 5),
('Sauber', 9),
('RB', 2);


INSERT INTO pilotos (nome_piloto, cod_pais, id_equipe) VALUES
('Ayrton Senna', 1, 5),
('Emerson Fittipaldi', 1, 2),
('Nelson Piquet', 1, 3),
('Felipe Massa', 1, 1),
('Rubens Barrichello', 1, 4),
('Michele Alboreto', 2, 1),
('Giancarlo Fisichella', 2, 6),
('Riccardo Patrese', 2, 5),
('Alain Prost', 3, 3),
('Pierre Gasly', 3, 6);



INSERT INTO corridas (nome_gp, cod_pais, quantidade_voltas) VALUES
('Grande Prêmio do Brasil', 1, 71),
('Grande Prêmio da Itália', 2, 53),
('Grande Prêmio da França', 3, 53),
('Grande Prêmio da Bélgica', 4, 44),
('Grande Prêmio da Alemanha', 5, 67),
('Grande Prêmio da Grã-Bretanha', 6, 52),
('Grande Prêmio da Espanha', 7, 66),
('Grande Prêmio da Holanda', 8, 72),
('Grande Prêmio da Suíça', 9, 60),
('Grande Prêmio da Áustria', 10, 71);

ALTER TABLE pilotos ADD COLUMN salario DECIMAL(10,2);


UPDATE pilotos SET salario = 95000.00 WHERE id_piloto = 1;
UPDATE pilotos SET salario = 85000.00 WHERE id_piloto = 2;
UPDATE pilotos SET salario = 78000.00 WHERE id_piloto = 3;
UPDATE pilotos SET salario = 92000.00 WHERE id_piloto = 4;
UPDATE pilotos SET salario = 65000.00 WHERE id_piloto = 5;
UPDATE pilotos SET salario = 88000.00 WHERE id_piloto = 6;
UPDATE pilotos SET salario = 72000.00 WHERE id_piloto = 7;
UPDATE pilotos SET salario = 55000.00 WHERE id_piloto = 8;
UPDATE pilotos SET salario = 98000.00 WHERE id_piloto = 9;
UPDATE pilotos SET salario = 48000.00 WHERE id_piloto = 10;


SELECT nome_pais FROM paises
WHERE nome_pais LIKE 'B%L';


SELECT p.nome_piloto, pa.nome_pais
FROM pilotos p
JOIN paises pa ON p.cod_pais = pa.cod_pais
WHERE pa.nome_pais IN ('Brasil', 'Itália', 'França');


SELECT nome_piloto FROM pilotos;
SELECT nome_gp, quantidade_voltas AS total_voltas
FROM corridas;


SELECT p.nome_piloto, pa.nome_pais
FROM pilotos p
JOIN paises pa ON p.cod_pais = pa.cod_pais;


SELECT nome_piloto, salario FROM pilotos
WHERE salario BETWEEN 70000 AND 100000;


SELECT cod_pais, ROUND(AVG(salario),2) AS media_salarial
FROM pilotos
GROUP BY cod_pais;


SELECT DISTINCT salario FROM pilotos

ORDER BY salario ASC;

SELECT * 
FROM pilotos;

