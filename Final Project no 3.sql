-- Bandingkan nilai transaksi dari masing-masing kategori pada tahun 2021 dengan 2022. Sebutkan kategori apa saja 
-- yang mengalami peningkatan dan kategori apa yang mengalami penurunan nilai transaksi dari tahun 2021 ke 2022. 
-- Gunakan is_valid = 1 untuk memfilter data transaksi.
    
SELECT
	transaksi_2021.kategori,
    transaksi_2021.total_nilai_transaksi_2021,
    transaksi_2022.total_nilai_transaksi_2022,
    (transaksi_2022.total_nilai_transaksi_2022 - transaksi_2021.total_nilai_transaksi_2021)/total_nilai_transaksi_2021 as perubahan
FROM
	(
		SELECT
			sku_detail.category as kategori,
  			sum (order_detail.after_discount) as total_nilai_transaksi_2021
		FROM
			order_detail left join sku_detail on order_detail.sku_id = sku_detail.id
		WHERE
			is_valid = 1
  			AND
  			order_date BETWEEN '01/01/2021' and '12/31/2021'
		group BY
			kategori
    ) as transaksi_2021
    left join
    (
    	SELECT
			sku_detail.category as kategori,
  			sum (order_detail.after_discount) as total_nilai_transaksi_2022
		FROM
			order_detail left join sku_detail on order_detail.sku_id = sku_detail.id
		WHERE
			is_valid = 1
  			AND
  			order_date BETWEEN '01/01/2022' and '12/31/2022'
		group BY
			kategori
    ) as transaksi_2022	
    on transaksi_2021.kategori = transaksi_2022.kategori
