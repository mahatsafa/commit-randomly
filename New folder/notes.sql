-- sql notes
CREATE TABLE practice (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO practice (id, name) VALUES (1, 'hello');

SELECT * FROM practice WHERE id = 1;

-- TODO: try joins next
