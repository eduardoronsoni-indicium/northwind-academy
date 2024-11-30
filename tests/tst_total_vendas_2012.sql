/*

    Este teste garante que as vendas brutas de 2021 foram auditados em R$230784.68

*/

with 
    vendas_em_2012 as (
        select
            sum(total_bruto) as soma_total_bruto
        from {{ ref('int_vendas__metricas_de_vendas') }}
        where data_do_pedido between '2012-01-01' and '2012-12-31'
    )

select soma_total_bruto
from vendas_em_2012
where soma_total_bruto not between 230784.00 and 230785.00