-- GOLD 1: Top 20 entregadores por distância percorrida
create table if not exists gold_top20_drivers as
with ranked_drivers as (
    select 
        dd.driver_id,
        dd.driver_type,
        dd.driver_modal,
        sum(sd.delivery_distance_meters) as distancia_total,
        row_number() over (order by sum(sd.delivery_distance_meters) desc) as ranking
    from dim_drivers dd
    join silver_deliveries sd
        on dd.driver_id = sd.driver_id
    group by dd.driver_id, dd.driver_type, dd.driver_modal
)
select *
from ranked_drivers
where ranking <= 20;


-- GOLD 2: Distribuição da distância média percorrida pelos motoboys por estado
create table if not exists gold_motoboys_distancia_estado as
select 
    sl.hub_state as estado,
    round(avg(sl.delivery_distance_meters), 2) as media_distancia_percorrida
from silver_lojas as sl
left join dim_drivers as dd
    on sl.driver_id = dd.driver_id
where dd.driver_modal = 'MOTOBOY'
group by estado;


-- GOLD 3: Receita média e total por tipo de loja
create table if not exists gold_receita_tipo_loja as
select 
    ds.store_segment as tipo_loja, 
    round(sum(sp.payment_amount - sp.payment_fee), 2) as receita_total, 
    round(avg(sp.payment_amount - sp.payment_fee), 2) as receita_media 
from silver_payments as sp
left join silver_orders as so
    on sp.payment_order_id = so.payment_order_id 
join dim_stores as ds 
    on so.store_id = ds.store_id 
group by tipo_loja;


-- GOLD 4: Receita média e total por estado
create table if not exists gold_receita_estado as
select 
    dh.hub_state as estado, 
    round(sum(sp.payment_amount - sp.payment_fee), 2) as receita_total, 
    round(avg(sp.payment_amount - sp.payment_fee), 2) as receita_media 
from silver_payments as sp
left join silver_orders as so 
    on sp.payment_order_id = so.payment_order_id 
join dim_stores as ds 
    on so.store_id = ds.store_id 
join dim_hubs as dh 
    on ds.hub_id = dh.hub_id 
group by estado;
