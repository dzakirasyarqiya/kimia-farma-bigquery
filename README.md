# kimia-farma-bigquery
SQL queries for Kimia Farma Business Analysis 2020-2023
# 💊 Kimia Farma Business Analytics 2020–2023

Proyek ini merupakan bagian dari tugas akhir program Big Data Analyst Internship bersama Kimia Farma. Analisis dilakukan terhadap data transaksi Kimia Farma selama periode 2020 hingga 2023 menggunakan **Google BigQuery** dan divisualisasikan melalui **Looker Studio**.

Repository ini berisi SQL script utama yang digunakan untuk membentuk **tabel analisa**, serta melakukan **data cleaning**, untuk visualisasi analitik.

---

## 📁 Struktur File

### ✅ 1. `create_tabel_analisa.sql`
- **Deskripsi:**  
  Query untuk membentuk **tabel gabungan** dari tiga dataset utama:
  - `kf_final_transaction`
  - `kf_kantor_cabang`
  - `kf_product`
- **Fungsi:**  
  - Menggabungkan data transaksi dengan data cabang dan produk.
  - Menghitung:
    - `nett_sales` (harga setelah diskon)
    - `nett_profit` (keuntungan bersih)
    - `persentase_gross_laba` (berdasarkan harga jual)

### ✅ 2. `cleaning_data.sql`
- **Deskripsi:**  
  Membersihkan data dari tabel `tabel_analisa` agar siap digunakan untuk analisis.
- **Fungsi:**  
  - Menghapus duplikat berdasarkan `transaction_id`
  - Menghilangkan data dengan:
    - `actual_price` <= 0
    - `discount_percentage` tidak valid (harus 0–100)
    - `nett_sales` atau `nett_profit` negatif
    - `rating` di luar batas (0–5)
  - Membuat tabel baru: `tabel_analisa_cleaned`


---

## 🧰 Tools dan Teknologi
- Google Cloud Platform (BigQuery)
- SQL Standard (BigQuery Syntax)
- Looker Studio (untuk visualisasi)
- GitHub (untuk dokumentasi)

---

## 📌 Catatan
- Semua data yang dianalisis bersumber dari dataset internal Kimia Farma (periode 2020–2023).
- Analisis ditujukan untuk mendukung pengambilan keputusan strategis berdasarkan data cabang, pelanggan, dan produk.

---

## 👩‍💻 Author
**Dzakira Syarqiya**  
Big Data Analyst Intern  
Email: [dzakirasyarqiya@gmail.com]  
GitHub: [https://github.com/dzakirasyarqiya](https://github.com/dzakirasyarqiya)

---


