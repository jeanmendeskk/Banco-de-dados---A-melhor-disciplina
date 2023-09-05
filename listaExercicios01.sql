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

-- 8 
select produto, avg(receita) as receita_media
from vendas
group by produto;

-- 9
select produto, sum(receita) as receita_total
from vendas
group by produto having receita_total > '10000';

-- 10 

-- tomei liberdade de usar o insert pra busca receber algum valor, pois com a tabela original ele não exibiria nada

insert into livros (id, titulo, autor_id)
values (null, 'Harry Potter e a Ordem da Fênix', 1),
(null, 'A revolução dos bichos', 2),
(null, 'Por Que Escrevo',  2);

With TotalLivros as (
	select autor_id, count(*) as livros_totais from livros
    group by autor_id having livros_totais > '2'
)

select autores.nome, livros_totais
from autores
inner join TotalLivros on autor_id = autores.id;

-- 11

select nome, titulo
from autores
inner join livros on autor_id = autores.id;

-- 12

select nome, curso
from alunos
left join matriculas on aluno_id = alunos.id;

-- 13

-- adicionei valores que se encaixam no que o exercicio pede

insert into autores(id, nome, nascimento)
values (null, 'Stephen King', '1947-09-21'),
(null, 'George R. R. Martin', '1948-09-20');
select nome, titulo
from autores
left join livros on autor_id = autores.id;

-- 14

-- adicionei valores que se encaixam no que o exercicio pede

insert into matriculas(id, aluno_id, curso)
values (null, null, 'Ciências da computação');
select nome, curso
from alunos
right join matriculas on aluno_id = alunos.id;

-- 15

select nome, curso
from alunos
inner join matriculas on aluno_id = alunos.id;

-- 16 

With TotalLivros as (
	select autor_id, count(*) as livros_publicados from livros
    group by autor_id
)

select autores.nome, livros_publicados
from autores
inner join TotalLivros on autor_id = autores.id
order by livros_publicados desc
limit 1;

-- 17

select produto, receita
from vendas
order by receita asc
limit 1;

-- 18

-- obs: fiz esse exercicio considerando que cada autor vendeu apenas uma unidade de seus livros, então se o autor publicou mais de um livro, ele "lucrou" mais

With TotalLivros as (
	select autor_id, count(*) as livros_totais from livros
    group by autor_id
)

select autores.nome, livros_totais, livros_totais * 20 as receita_livro
from autores
inner join TotalLivros on autor_id = autores.id;