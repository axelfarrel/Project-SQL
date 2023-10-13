-- urutkan samsung, apple, sony, huawei, lenovo berdasarkan nilai transaksinya. is_valid = 1
SELECT
	sd.sku_name as product_name,
    sum(od.after_discount) as total_transaksi
FROM
	order_detail as od left join sku_detail as sd on od.sku_id = sd.id
WHERE
	is_valid = 1
    and
    (sd.sku_name like '%msu%'
    or 
    sd.sku_name like '%ple%'
    or 
    sd.sku_name like '%ony%'
    or 
    sd.sku_name like '%uaw%'
    or 
    sd.sku_name like '%nov%')
group BY
	product_name
order BY
	total_transaksi desc
