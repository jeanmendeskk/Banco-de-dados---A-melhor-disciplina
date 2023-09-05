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

-- 4
select alunos.nome, matriculas.curso
from alunos
inner join matriculas on alunos.id = matriculas.aluno_id
where matriculas.curso = 'Engenharia de Software';

-- 5
select produto, sum(receita) as receita_total
from vendas
group by produto;