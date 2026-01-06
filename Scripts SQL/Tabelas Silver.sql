-- Silver payments
CREATE TABLE silver_payments AS
SELECT payment_order_id, payment_amount, payment_fee, payment_status
FROM fat_payments
WHERE payment_status = 'PAID';

-- Silver orders
CREATE TABLE silver_orders AS
SELECT 
    order_id,
    store_id,
    channel_id,
    payment_order_id,
    delivery_order_id,
    order_status,
    order_amount
FROM fat_orders
WHERE order_status = 'FINISHED';

-- Silver deliveries
CREATE TABLE silver_deliveries AS
SELECT delivery_order_id, driver_id, delivery_distance_meters, delivery_status
FROM fat_deliveries
WHERE delivery_status = 'DELIVERED';

-- Silver lojas
create table silver_lojas as
with lojas as (
    select ds.store_id, dh.hub_id, dh.hub_state
    from dim_hubs as dh
    inner join dim_stores as ds
        on dh.hub_id = ds.hub_id
)
select 
    so.order_id,
    so.store_id,
    so.delivery_order_id,
    sd.driver_id,
    sd.delivery_distance_meters,
    so.order_amount,
    lojas.hub_id,
    lojas.hub_state
from lojas
inner join silver_orders as so
    on lojas.store_id = so.store_id
inner join silver_deliveries as sd
    on so.delivery_order_id = sd.delivery_order_id;




