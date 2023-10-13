-- Selama transaksi yang terjadi selama 2021, pada bulan apa total nilai transaksi 
-- (after_discount) paling besar? Gunakan is_valid = 1 untuk memfilter data transaksi.

SELECT
	extract (month from order_date) as bulan, 
    sum (after_discount) as total_nilai_transaksi
FROM
	order_detail
where 
	is_valid = 1 
    and 
    order_date BETWEEN '01/01/2021' and '12/31/2021'
group by bulan
order by total_nilai_transaksi desc