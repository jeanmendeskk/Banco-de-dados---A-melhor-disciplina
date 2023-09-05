-- 1
select titulo from livros;

-- 2
select nome
from autores
where nascimento < '1900-01-01';

-- 3
select titulo
from livros
where autor_id = 1;