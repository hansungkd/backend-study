-- 1번
SELECT `users`.`id`, `name`, `seat_number`
    FROM `tickets`
        INNER JOIN `users` ON tickets.user = users.id
    where train=11
    ORDER BY seat_number;

-- 2번
SELECT `users`.`id`, `users`.`name`, COUNT(*) as `trains_count`, SUM(`trains`.`distance`)/10 as `total_distance`
    FROM `tickets`
        INNER JOIN trains ON tickets.train = trains.id
        INNER JOIN users ON tickets.user = users.id
    GROUP BY `users`.`id`
    ORDER BY `total_distance` DESC
    LIMIT 6;

-- 3번
SELECT trains.id, types.name as type, src_stn.name as src_stn, dst_stn.name as src_stn, Timediff(trains.arrival, trains.departure) as travel_time
    FROM trains
        INNER JOIN types on trains.type = types.id
        INNER JOIN stations src_stn on trains.source = src_stn.id
        INNER JOIN stations dst_stn on trains.destination = dst_stn.id
    ORDER BY travel_time DESC
    LIMIT 6;

-- 4번
SELECT types.name as type, src_stn.name as src_stn, dst_stn.name as dst_name, departure, arrival, ROUND(trains.distance/1000*types.fare_rate, -2) as fare
    FROM trains
        INNER JOIN types on trains.type = types.id
        INNER JOIN stations src_stn ON trains.source = src_stn.id
        INNER JOIN stations dst_stn ON trains.destination = dst_stn.id
    ORDER BY departure;

-- 5번
SELECT trains.id, types.name as type, src_stn.name as src_stn, dst_stn.name as dst_stn, COUNT(tickets.id) as occupied, types.max_seats as maximum
    FROM tickets
        INNER JOIN trains ON tickets.train = trains.id
        INNER JOIN types ON trains.type = types.id
        INNER JOIN stations src_stn ON trains.source = src_stn.id
        INNER JOIN stations dst_stn ON trains.destination = dst_stn.id
    GROUP BY trains.id
    ORDER BY trains.id;

-- 6번
SELECT trains.id, types.name as type, src_stn.name as src_stn, dst_stn.name as dst_stn, COUNT(`tickets`.id) as occupied, types.max_seats as maximum
    FROM trains
        INNER JOIN types ON trains.type = types.id
        INNER JOIN stations src_stn ON trains.source = src_stn.id
        INNER JOIN stations dst_stn ON trains.destination = dst_stn.id
        LEFT OUTER JOIN tickets ON trains.id = tickets.train
    GROUP BY trains.id
    ORDER BY trains.id;