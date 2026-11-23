-- Создание базы данных
CREATE DATABASE IF NOT EXISTS gold;

-- 1. Таблица: Запуски по странам за день
CREATE TABLE IF NOT EXISTS gold.launches_by_country_day
(
    launch_date Date,
    country String,
    launches_count UInt32,
    processed_at DateTime
) ENGINE = ReplacingMergeTree(processed_at)
ORDER BY (launch_date, country);

-- 2. Таблица: Успешность ракет
CREATE TABLE IF NOT EXISTS gold.rocket_success_rate
(
    launch_date Date,
    rocket_name String,
    total_launches UInt32,
    successful UInt32,
    failed UInt32,
    success_rate Float32,
    processed_at DateTime
) ENGINE = ReplacingMergeTree(processed_at)
ORDER BY (launch_date, rocket_name);

-- 3. Таблица: Топ агентств (провайдеров)
CREATE TABLE IF NOT EXISTS gold.agency_top_10
(
    launch_date Date,
    provider_name String,
    launches_count UInt32,
    processed_at DateTime
) ENGINE = ReplacingMergeTree(processed_at)
ORDER BY (launch_date, provider_name);
