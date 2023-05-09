use `henry_checkpoint_m3`;
-- cientes diferentes que compraron el 2020
Select @cant_client_2020 :=(
SELECT count(distinct IdCliente) as cantidad_clientes
from venta v 
where year(v.Fecha) = 2020);

-- cliente con mas compras: 
-- par aguardarlo en variable
select @respuesta :=(
SELECT 
	    sum(round(v.Cantidad * v.Precio)) as monto_gastado_x_el_cliente
FROM venta v 
group by v.IdCliente
order by monto_gastado_x_el_cliente Desc
limit 1);

select @respuesta;
 
 
 
 --  2 del total de clientes que realizarpm compras el 2020, 
 -- que porcentaje lo hizo solo en una uniaca sucursal


-- cientes diferentes que compraron el 2020
Select @cant_client_2020 :=(
SELECT count(distinct IdCliente) as cantidad_clientes
from venta v 
where year(v.Fecha) = 2020);

-- cant clientes que lo hizo solo en una uniaca sucursal...:
select @respuesta2 :=(
select count(*) 
		from(
		select Distinct IdCliente
		from venta 
		where year(Fecha) = 2020
		group by IdCliente
		having count(distinct IdSucursal) = 1
) respuesta2);


select @respuesta2 / @cant_client_2020 * 100 ; -- me quiero mataaa me daba bien!

