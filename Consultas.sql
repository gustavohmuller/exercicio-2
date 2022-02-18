-- 1. Monte uma busca para criação de um relatório que apresente todas as infrações com velocidade medida igual ou acima de 20% da velocidade permitida. Ordenar a lista por data e hora da infração.

  Select idInfracao as 'Número', dataInfracao as 'Data e hora', equipamento as 'Equipamento', velocidadePermitida as 'Velocidade Permitida', velocidadeMedida as 'Velocidade Medida'
    From infracao
   Where velocidadeMedida >= velocidadePermitida * 1.20
Order by dataInfracao;

-- 2. Monte uma busca que para cada remessa apresente sua identificação, sua situação, o total de infrações, total de infrações válidas e total de infrações inválidas. Ordenar a consulta pela situação das remessas.

    Select idRemessa as 'Identificação Numérica', situacao as 'Situação', totalInfracoes as 'Total de infrações', Count(case when valorBinario = 1 then valorBinario end) as 'Total de infrações válidas', Count(case when valorBinario = 0 then valorBinario end) as 'Total de infrações inválidas'
      From remessa
Inner join infracao
	On idRemessa = Remessa_idRemessa
  Group by idRemessa
  Order by situacao;
