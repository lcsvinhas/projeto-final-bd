CREATE TABLE pacientes(
id_paciente serial PRIMARY KEY,
nome_completo varchar(100) NOT NULL,
cpf varchar(15) NOT NULL UNIQUE,
data_nasc date NOT NULL,
telefone varchar(15) NOT NULL,
email varchar(100) UNIQUE,
endereco varchar(200) NOT NULL
);
CREATE TABLE dentistas(
id_dentista serial PRIMARY KEY,
nome_completo varchar(100) NOT NULL,
cpf varchar(15) NOT NULL UNIQUE,
cro varchar(15) NOT NULL UNIQUE,
especialidade varchar(100) NOT NULL
);

CREATE TABLE proced_odont(
id_proced_odont serial PRIMARY KEY,
nome varchar(100) NOT NULL,
descricao varchar(100),
duracao_media time
);

CREATE TABLE consultas(
id_consulta serial PRIMARY KEY,
paciente serial,
constraint paciente_fkey FOREIGN KEY (paciente)
references pacientes(id_paciente),
dentista_responsavel serial,
constraint dentista_fkey FOREIGN KEY (dentista_responsavel)
references dentistas(id_dentista),
data_consulta date NOT NULL,
horario_consulta time NOT NULL,
descricao varchar(100),
prescricao varchar(100),
procedimento serial,
constraint procedimento_fkey FOREIGN KEY (procedimento)
references proced_odont(id_proced_odont)
);

-- ____________________________________________________________________________________

INSERT INTO pacientes (nome_completo, cpf, data_nasc, telefone, email, endereco) VALUES
('João da Silva', '123.456.789-00', '1985-06-15', '(11) 91234-5678', 'joao.silva@email.com', 'Rua das Flores, 123, São Paulo, SP'),
('Maria Oliveira', '987.654.321-00', '1990-08-22', '(11) 92345-6789', 'maria.oliveira@email.com', 'Av. Brasil, 456, Rio de Janeiro, RJ'),
('Carlos Santos', '456.789.123-00', '1982-12-05', '(21) 93456-7890', 'carlos.santos@email.com', 'Rua da Paz, 789, Belo Horizonte, MG'),
('Ana Souza', '321.654.987-00', '1995-03-30', '(31) 94567-8901', 'ana.souza@email.com', 'Praça Central, 321, Curitiba, PR'),
('Fernando Lima', '654.321.987-00', '1978-07-10', '(41) 95678-9012', 'fernando.lima@email.com', 'Av. Independência, 654, Porto Alegre, RS'),
('Juliana Costa', '159.753.486-00', '2000-05-25', '(51) 96789-0123', 'juliana.costa@email.com', 'Rua do Sol, 159, Salvador, BA'),
('Ricardo Alves', '258.147.369-00', '1987-09-14', '(71) 97890-1234', 'ricardo.alves@email.com', 'Travessa das Palmeiras, 258, Recife, PE'),
('Patrícia Mendes', '369.258.147-00', '1992-11-18', '(81) 98901-2345', 'patricia.mendes@email.com', 'Rua das Acácias, 369, Fortaleza, CE'),
('Lucas Ferreira', '741.852.963-00', '1983-04-08', '(91) 99012-3456', 'lucas.ferreira@email.com', 'Av. das Américas, 741, Manaus, AM'),
('Beatriz Rocha', '852.963.741-00', '1998-02-12', '(92) 90123-4567', 'beatriz.rocha@email.com', 'Rua Rio Branco, 852, Goiânia, GO'),
('Gabriel Nunes', '753.951.456-00', '1989-10-20', '(95) 91234-5678', 'gabriel.nunes@email.com', 'Rua do Carmo, 753, Florianópolis, SC'),
('Larissa Martins', '159.357.258-00', '1993-06-05', '(85) 92345-6789', 'larissa.martins@email.com', 'Av. das Nações, 159, Natal, RN'),
('Eduardo Ribeiro', '456.852.147-00', '1975-12-28', '(65) 93456-7890', 'eduardo.ribeiro@email.com', 'Rua Tiradentes, 456, Cuiabá, MT'),
('Camila Fernandes', '987.123.654-00', '2001-07-15', '(35) 94567-8901', 'camila.fernandes@email.com', 'Praça da Liberdade, 987, Campo Grande, MS');

INSERT INTO dentistas (nome_completo, cpf, cro, especialidade) VALUES
('Dr. Fernando Almeida', '123.456.789-00', 'SP-12345', 'Ortodontia'),
('Dra. Mariana Souza', '987.654.321-00', 'RJ-67890', 'Endodontia' ),
('Dr. Ricardo Lima', '456.789.123-00', 'MG-54321', 'Implantodontia'),
('Dra. Juliana Mendes', '321.654.987-00', 'RS-98765', 'Periodontia'),
('Dr. Carlos Oliveira', '654.321.987-00', 'SP-13579', 'Cirurgia Bucomaxilofacial'),
('Dra. Ana Beatriz Rocha', '159.753.486-00', 'BA-24680', 'Odontopediatria'),
('Dr. Felipe Costa', '258.147.369-00', 'PR-11223', 'Dentística'),
('Dra. Patrícia Nogueira', '369.258.147-00', 'SC-33445', 'Prótese Dentária'),
('Dr. Gustavo Ferreira', '741.852.963-00', 'PE-55667', 'Endodontia'),
('Dra. Camila Martins', '852.963.741-00', 'GO-77889', 'Ortodontia');

INSERT INTO proced_odont (nome, descricao, duracao_media) VALUES
('Ajuste de aparelho ortodôntico', 'Correção e regulagem do aparelho', '00:30:00'),
('Tratamento de canal', 'Remoção da polpa do dente e selamento', '01:30:00'),
('Implante dentário', 'Colocação de pino de titânio para prótese', '02:00:00'),
('Limpeza e raspagem', 'Remoção de tártaro e placa bacteriana', '00:45:00'),
('Extração do siso', 'Remoção de dente do siso incluso', '01:00:00'),
('Consulta infantil - cárie', 'Avaliação e tratamento de cáries em crianças', '00:40:00'),
('Restauração dentária', 'Reparo de dente cariado com resina ou amálgama', '00:50:00'),
('Troca de prótese dentária', 'Substituição de prótese desgastada', '01:15:00'),
('Retratamento de canal', 'Revisão de um tratamento de canal anterior', '01:45:00'),
('Ajuste de contenção ortodôntica', 'Ajuste de aparelho de contenção', '00:30:00');


INSERT INTO consultas (paciente, dentista_responsavel, data_consulta, horario_consulta, descricao, prescricao,procedimento) VALUES
(1, 1, '2025-04-10', '08:30:00', 'Avaliação ortodôntica', 'Uso de aparelho dentário recomendado',1),
(2, 2, '2025-04-11', '09:00:00', 'Tratamento de canal', 'Antibiótico Amoxicilina 500mg por 7 dias',2),
(3, 3, '2025-04-12', '10:30:00', 'Implante dentário', 'Uso de analgésico e repouso de 48h',3),
(4, 4, '2025-04-13', '14:00:00', 'Limpeza periodontal', 'Uso de enxaguante bucal com clorexidina',4),
(5, 5, '2025-04-14', '16:30:00', 'Extração de siso', 'Anti-inflamatório Ibuprofeno 600mg por 3 dias',5),
(6, 6, '2025-04-15', '11:00:00', 'Consulta infantil', 'Aplicação de flúor e orientação de escovação',6),
(7, 7, '2025-04-16', '15:30:00', 'Restauração de cárie', 'Evitar alimentos duros por 24h',7),
(8, 8, '2025-04-17', '13:45:00', 'Colocação de prótese dentária', 'Retorno em 15 dias para ajuste',8),
(9, 9, '2025-04-18', '10:15:00', 'Retratamento de canal', 'Uso de antibiótico e acompanhamento',9),
(10, 10, '2025-04-19', '09:45:00', 'Ajuste de aparelho ortodôntico', 'Uso de cera ortodôntica se necessário',10);



-- ____________________________________________________________________________________
--SQL de dois índices coerentes;

CREATE INDEX idx_paciente_cpf on pacientes(cpf);
CREATE INDEX idx_dentistas_nome on dentistas(nome_completo);

--3 atualizações de registros com condições em alguma tabela

update pacientes set nome_completo = 'Matheus Ruella' where id_paciente =2;
update dentistas set especialidade = 'Prótese Dentária' where id_dentista =7;
update consultas set data_consulta = '2025-04-09' where id_consulta =4;

--3 exclusão de registros com condições em alguma tabela.

delete from consultas where id_consulta =4;
delete from dentistas  where id_dentista =4;
delete from pacientes  where id_paciente =4;

--Quantidade de consultas por especialidade: selecione todas as especialidades
--dos dentistas e faça um COUNT para contar o número total de consultas realizadas por
--cada especialidade.

select dentistas.especialidade, count(consultas.id_consulta) as consultas_realizadas from dentistas
join consultas on consultas.dentista_responsavel = dentistas.id_dentista
group by dentistas.especialidade;

--Quantidade de consultas realizadas por cada dentista: selecione o nome de todos
--os dentistas e faça um COUNT para contar a quantidade de consultas realizadas por
--cada um e exiba em ordem decrescente pela quantidade de consultas.

select dentistas.nome_completo, count(consultas.id_consulta) as quantidade_consultas from dentistas
join consultas on consultas.id_consulta = dentistas.id_dentista
group by dentistas.nome_completo 
order by quantidade_consultas desc;

--Pacientes com maior número de consultas: liste os pacientes e a quantidade de
--consultas que cada um realizou, ordenando em ordem decrescente pelo número de
--consultas.

select pacientes.nome_completo, count(consultas.id_consulta) as quantidade_consultas from pacientes
join consultas on consultas.paciente = pacientes.id_paciente
group by pacientes.nome_completo
order by quantidade_consultas desc;

--View com lista de consultas ordenadas por data: crie uma VIEW que selecione os
--seguintes campos: id_consulta, nome_paciente, nome_dentista, data_consulta,
--procedimentos_realizados e ordene em ordem decrescente pela data da consulta.
CREATE VIEW consultas_ordenadas AS
SELECT 
    consultas.id_consulta, 
    pacientes.nome_completo AS nome_paciente, 
    dentistas.nome_completo AS nome_dentista, 
    consultas.data_consulta,
    consultas.procedimento
FROM consultas
JOIN pacientes ON consultas.paciente = pacientes.id_paciente
JOIN dentistas ON consultas.dentista_responsavel = dentistas.id_dentista
ORDER BY consultas.data_consulta DESC;

--Média de consultas por dentista: calcule a média de consultas realizadas por dentista.

SELECT d.nome_completo, 
       (SELECT AVG(quantidade) 
        FROM (SELECT COUNT(*) AS quantidade 
              FROM consultas 
              GROUP BY dentista_responsavel) AS subquery
       ) AS media_geral_consultas
FROM dentistas d;