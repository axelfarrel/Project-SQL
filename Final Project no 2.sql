-- Selama transaksi pada tahun 2022, kategori apa yang menghasilkan nilai transaksi (after_discount)
-- paling besar? Gunakan is_valid = 1 untuk memfilter data transaksi.
SELECT
    sku_detail.category,
    sum(order_detail.after_discount) as nilai_transaksi
FROM
	order_detail join sku_detail on order_detail.sku_id = sku_detail.id
where
	is_valid = 1
    AND
    order_date BETWEEN '01/01/2022' and '12/31/2022'
group by sku_detail.category
order by nilai_transaksi desc