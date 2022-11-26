# Project Documentation

## Nama Anggota Kelompok B-03
1. Alicia Kirana Utomo
2. Elsa Giana Abigail Sitompul
3. Jeremy Alva Prathama
4. Khairinka Rania Lizadhi
5. Ratu Almas Naurah Anvilen
6. Muhammad Al Rivalda


## Link Aplikasi Heroku
[Verinvest](https://verinvest.herokuapp.com/)


## Latar Belakang
Salah satu isu yang diangkat oleh G20, yang merupakan konferensi para pemimpin dunia, adalah Transformasi Digital. Menurut firma konsultansi teknologi Accenture, transformasi digital merupakan proses dimana organisasi menerapkan teknologi pada kegiatan operasional mereka untuk menggerakkan perubahan. Bila di maknai secara lebih luas, transformasi digital merupakan proses peningkatan efisiensi dan manfaat suatu proses yang sebelumnya terdominasi oleh metode-metode non-digital.

Salah satu penerapan transformasi digital adalah pada validasi informasi investasi illegal. Kominfo dalam rapat persiapan G20 sempat menyerukan bahwa salah satu tujuan dari isu Transformasi Digital pada G20 adalah dengan membrantas investasi illegal yang terjadi di masyarakat. Meski demikian, nyatanya proses penyaluran informasi investasi illegal masih terjadi secara mulut ke mulut, melalui aplikasi _instant messaging_, ataupun lewat artikel-artikel berita yang seringkali tidak tersentralisasi dan _up to date_. 

Kelompok kami melihat suatu kesempatan untuk menerapkan solusi berbasi web untuk meningkatkan efisiensi dari proses penyaluran informasi investasi ilegal. Solusi kami, Verinvest, akan memungkinkan user untuk mempublikasikan berita terkait investasi yang diduga illegal kepada komunitas Verinvest. Nantinya, informasi ini akan melalui proses _peer validation_ dan _expert validation_ dimana orang-orang dapat mendukung suatu informasi sampai akhirnya dapat dinyatakan bahwa informasi berikut sudah benar.

[Artikel Kominfo tentang pencegahan investasi ilegal dan G20](https://aptika.kominfo.go.id/2022/03/kominfo-angkat-isu-literasi-digital-untuk-cegah-korban-investasi-ilegal-di-g20/)


## Daftar Modul Aplikasi
Berikut adalah modul yang akan kami implementasikan
1. Landing Page (Muhammad Al Rivalda)
   1. Login
   2. Logout
   3. Sign Up
   4. Landing Page / Home
2. Profile Page (Alicia Kirana Utomo)
   1. Account information
   2. Upvoted posts
   3. Delete account
3. Collections Page (Jeremy Alva Prathama)
   1. Search post
   2. Cards collection
   3. Sort posts
4. Forum Post Item (Ratu Almas Naurah Anvilen)
   1. Create post
   2. Upvote post
   3. Comment post
   4. Share post (copy link)  
5. Edukasi Post Item (Elsa Giana Abigail Sitompul)
   1. Create post
   2. Upvote post
   3. Comment post
   4. Share post (copy link)  
6. FAQ Page (Khairinka Rania Lizadhi)
   1. FAQ page
   2. Contact us
   3. About us


## Role Pengguna
1. Regular User
   
Merupakan pengguna biasa dengan kemampuan menavigasi aplikasi, membuat post, menghapus post sendiri, berinteraksi dengan post (upvote, comment, share link), namun tidak dapat memberikan Expert Verification terhadap suatu post.

2. Domain Expert

Memiliki semua kemampuan Regular User, ditambah dengan kemampuan untuk memberikan Expert Verification terhadap suatu post yang ada. Expert Verification akan sangat berpengaruh terhadap status apakah suatu post tervalidasi sebagai berita benar atau tidak.


## Alur Pengintegrasian dengan Web Service
1. Membuat API endpoints untuk web application Verinvest yang dibuat pada tengah semester
2. Membuat class di Flutter yang akan melakukan GET pada API endpoint sebelumnya
3. Integrasi data dari endpoint dengan _user interface_ melalui asynchronous programming