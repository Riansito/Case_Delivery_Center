/*Numa ação de marketing, para atrair mais entregadores, 
vamos dar uma bonificação para os 20 entregadores que possuem maior distância percorrida ao todo. 
A bonificação vai variar de acordo com o tipo de profissional que ele é e o modelo que ele usa para se locomover 
(moto, bike, etc). */



WITH ranked_drivers AS (
    SELECT 
        dd.driver_id,
        dd.driver_type,
        dd.driver_modal,
        SUM(sd.delivery_distance_meters) AS distancia_total,
        ROW_NUMBER() OVER (ORDER BY SUM(sd.delivery_distance_meters) DESC) AS ranking
    FROM dim_drivers dd
    JOIN silver_deliveries sd
        ON dd.driver_id = sd.driver_id
    GROUP BY dd.driver_id, dd.driver_type, dd.driver_modal
)
SELECT *
FROM ranked_drivers
WHERE ranking <= 20;

/*
Além disso, o time de Pricing precisa ajustar os valores pagos aos entregadores. 
Para isso, eles precisam da distribuição da distância média percorrida pelos motoqueiros separada por estado, 
já que cada região terá seu preço.
*/
select 
	sl.hub_state as Estado,
    round(avg(sl.delivery_distance_meters) , 2) as Media_Distancia_Percorrida
from silver_lojas as sl
left join dim_drivers as dd
on sl.driver_id = dd.driver_id
where dd.driver_modal = "MOTOBOY"
group by Estado;


/*Por fim, o CFO precisa de alguns indicadores de receita para apresentar para a diretoria executiva. 
Dentre esses indicadores, vocês precisarão levantar 

(1) a receita média e total separada por tipo (Food x Good) 
*/

select 
	ds.store_segment as Tipo_Loja, 
    round(sum(sp.payment_amount-sp.payment_fee),2) as receita_total, 
    round(avg(sp.payment_amount-sp.payment_fee),2) as receita_media 
from silver_payments as sp
left join silver_orders as so
on sp.payment_order_id = so.payment_order_id 
join dim_stores as ds 
on so.store_id = ds.store_id 
group by Tipo_Loja;


/*(2) A receita média e total por estado. Ou seja, são 4 tabelas ao todo./*/
select 
	dh.hub_state as Estado, 
	round(sum(sp.payment_amount-sp.payment_fee),2) as receita_total, 
	round(avg(sp.payment_amount-sp.payment_fee),2) as receita_media 
from silver_payments as sp
left join silver_orders as so 
on sp.payment_order_id = so.payment_order_id 
join dim_stores as ds 
on so.store_id = ds.store_id 
join dim_hubs as dh 
on ds.hub_id = dh.hub_id 
group by Estado;



