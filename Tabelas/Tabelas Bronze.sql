create table if not exists dim_drivers (
    driver_id bigint,
    driver_modal text,
    driver_type text
);

-- Tabela Bronze de Hubs
create table if not exists dim_hubs (
    hub_id bigint,
    hub_name text,
    hub_city text,
    hub_state text,
    hub_latitude double,
    hub_longitude double
);

-- Tabela Bronze de Stores
create table if not exists dim_stores (
    store_id bigint,
    hub_id bigint,
    store_name text,
    store_segment text,
    store_plan_price double,
    store_latitude double,
    store_longitude double
);


-- Tabela Bronze de Deliveries
create table if not exists fat_deliveries (
    delivery_id bigint,
    delivery_order_id bigint,
    driver_id double,
    delivery_distance_meters double,
    delivery_status text
);


-- Tabela Bronze de Payments
create table if not exists fat_payments (
    payment_id bigint,
    payment_order_id bigint,
    payment_amount double,
    payment_fee double,
    payment_method text,
    payment_status text
);

-- Tabela Bronze de Orders (versão completa)
create table if not exists fat_orders (
    order_id bigint,
    store_id bigint,
    channel_id bigint,
    payment_order_id bigint,
    delivery_order_id bigint,
    order_status text,
    order_amount double,
    order_delivery_fee double,
    order_delivery_cost double,
    order_created_hour bigint,
    order_created_minute bigint,
    order_created_day bigint,
    order_created_month bigint,
    order_created_year bigint,
    order_moment_created text,
    order_moment_accepted text,
    order_moment_ready text,
    order_moment_collected text,
    order_moment_in_expedition text,
    order_moment_delivering text,
    order_moment_delivered text,
    order_moment_finished text,
    order_metric_collected_time double,
    order_metric_paused_time double,
    order_metric_production_time double,
    order_metric_walking_time double,
    order_metric_expediton_speed_time double,
    order_metric_transit_time double,
    order_metric_cycle_time double
);
