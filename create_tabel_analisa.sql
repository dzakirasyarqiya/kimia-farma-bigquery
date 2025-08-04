-- ===========================================
-- File: create_tabel_analisa.sql
-- Tujuan: Membuat tabel gabungan untuk analisis
-- Dataset: kimia_farma
-- Project: rakamin-kf-analytics-467302
-- Tabel hasil: tabel_analisa
-- ===========================================

CREATE OR REPLACE TABLE `rakamin-kf-analytics-467302.kimia_farma.tabel_analisa` AS
SELECT
  t.transaction_id,       -- ID transaksi
  t.date,                 -- Tanggal transaksi
  t.branch_id,            -- ID cabang
  c.branch_name,          -- Nama cabang
  c.kota,                 -- Kota cabang
  c.provinsi,             -- Provinsi cabang
  c.rating AS rating_cabang,  -- Rating cabang
  t.customer_name,        -- Nama pelanggan
  t.product_id,           -- ID produk
  p.product_name,         -- Nama produk
  t.price AS actual_price, -- Harga sebelum diskon
  t.discount_percentage,   -- Persentase diskon

  -- Penentuan persentase laba berdasarkan price
  CASE 
    WHEN t.price <= 50000 THEN 0.10
    WHEN t.price <= 100000 THEN 0.15
    WHEN t.price <= 300000 THEN 0.20
    WHEN t.price <= 500000 THEN 0.25
    ELSE 0.30
  END AS persentase_gross_laba,

  -- Perhitungan nett_sales (harga setelah diskon)
  (t.price - (t.price * t.discount_percentage / 100)) AS nett_sales,

  -- Perhitungan nett_profit (laba bersih)
  ((t.price - (t.price * t.discount_percentage / 100)) *
    CASE 
      WHEN t.price <= 50000 THEN 0.10
      WHEN t.price <= 100000 THEN 0.15
      WHEN t.price <= 300000 THEN 0.20
      WHEN t.price <= 500000 THEN 0.25
      ELSE 0.30
    END
  ) AS nett_profit,

  -- Rating dari transaksi individual
  t.rating AS rating_transaksi

FROM
  `rakamin-kf-analytics-467302.kimia_farma.kf_final_transaction` t
JOIN
  `rakamin-kf-analytics-467302.kimia_farma.kf_kantor_cabang` c
  ON t.branch_id = c.branch_id
JOIN
  `rakamin-kf-analytics-467302.kimia_farma.kf_product` p
  ON t.product_id = p.product_id;
