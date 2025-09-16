--
-- Calcula la diferencia de precio (price_usd) entre cada intervalo de 5 minutos y el intervalo anterior.

use bitcoins;
select * from crypto_prices;

select datetime,
	   price_usd,
       lag(price_usd,1,0) over (order by datetime asc) as pricing_before,
       pricing_before - lag(price_usd,1,0) over (order by datetime asc) as difference
from crypto_prices;