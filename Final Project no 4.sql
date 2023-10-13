-- top 5 metode pembayaran tahun 2022 (berdasarkan total unique order). gunakan is_valid = 1
SELECT
	pd.payment_method as metode_pembayaran,
    count(od.payment_id) total_penggunaan
FROM
	order_detail as od left join payment_detail as pd on od.payment_id = pd.id
WHERE
	is_valid = 1
    AND
    od.order_date between '01/01/2022' and '12/31/2022'
group BY
	metode_pembayaran
order BY
	total_penggunaan desc
limit 5  
