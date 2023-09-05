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

-- 6 
With TotalLivros as (
	select autor_id, count(*) as livros_totais from livros
    group by autor_id
)

select autores.nome, livros_totais
from autores
inner join TotalLivros on autor_id = autores.id;

-- 7 

select alunos.nome, matriculas.curso
from alunos
inner join matriculas on aluno_id = alunos.id
order by curso asc;

-- parte 2 ex. 7

select curso, count(*) as totalPessoasCurso
from matriculas
group by curso;