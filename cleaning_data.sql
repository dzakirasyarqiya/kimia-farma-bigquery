-- ============================================
-- File: cleaning_data.sql
-- Tujuan: Membersihkan data dari tabel_analisa
-- Output: tabel_analisa_cleaned
-- Project: rakamin-kf-analytics-467302
-- Dataset: kimia_farma
-- ============================================

-- Membuat tabel baru hanya berisi data valid

CREATE OR REPLACE TABLE `rakamin-kf-analytics-467302.kimia_farma.tabel_analisa_cleaned` AS
SELECT *
FROM (
  SELECT *,
         ROW_NUMBER() OVER(PARTITION BY transaction_id) AS row_num
  FROM `rakamin-kf-analytics-467302.kimia_farma.tabel_analisa`
)
WHERE
  row_num = 1 -- Hapus duplikat transaction_id
  AND transaction_id IS NOT NULL
  AND branch_id IS NOT NULL
  AND product_id IS NOT NULL
  AND actual_price > 0
  AND discount_percentage BETWEEN 0 AND 100
  AND nett_sales >= 0
  AND nett_profit >= 0
  AND rating_transaksi BETWEEN 0 AND 5
  AND rating_cabang BETWEEN 0 AND 5;
