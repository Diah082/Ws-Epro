# 🌐 Ws-Epro – WebSocket Proxy Backend

Ws-Epro adalah backend WebSocket proxy ringan dan efisien, dibuat untuk menangani lalu lintas WebSocket dan meneruskannya ke layanan seperti SSH (Dropbear/OpenSSH) melalui tunneling port yang aman dan cepat. Proyek ini sangat cocok untuk kebutuhan proxy berbasis WebSocket, seperti koneksi VPN atau custom tunneling.

---

## 🚀 Fitur Unggulan

- 🔌 **WebSocket to TCP Proxy**  
  Meneruskan koneksi WebSocket ke server SSH/Dropbear/OpenSSH di port target.

- 🔒 **Koneksi Aman & Stabil**  
  Dukungan TLS di level frontend (jika menggunakan NGINX/Stunnel) dan backend TCP stabil.

- ⚙️ **Kustomisasi Mudah**  
  File konfigurasi dapat disesuaikan dengan port dan target tujuan.

- 🧩 **Dukungan Key Otomatis**  
  Otomatis menambahkan public key dari URL ke `authorized_keys` dan memvalidasinya secara berkala.

- 📦 **Ringan & Cepat**  
  Ditulis dalam bahasa Go, cocok untuk VPS dengan sumber daya terbatas.

---

## 🛠️ Instalasi

### 1. Clone Repositori

```bash
git clone https://github.com/Diah082/Ws-Epro.git
cd Ws-Epro
```

### 2. Build (opsional jika tidak menggunakan binary bawaan)

```bash
go build -o wsproxy main.go
```

### 3. Jalankan Proxy

```bash
./wsproxy
```

Secara default, service akan berjalan di port `80` dan meneruskan koneksi ke `127.0.0.1:143`.

---

## ⚙️ Konfigurasi

Edit file konfigurasi `config.json` (jika tersedia) atau modifikasi langsung pada `main.go`:

```json
{
  "listen_port": 80,
  "target_host": "127.0.0.1",
  "target_port": 143,
  "public_key_url": "https://domain.com/mykey.pub"
}
```

> Key akan divalidasi setiap 1 jam dan otomatis ditambahkan jika hilang. Jika key tidak tersedia, service akan berhenti.

---

## 🔁 Fitur Validasi Public Key

- Public key SSH akan di-*fetch* dari URL tertentu setiap 1 jam.
- Jika tidak ditemukan di `~/.ssh/authorized_keys`, maka:
  - Key akan ditambahkan ulang.
  - Jika gagal, service akan *exit* untuk alasan keamanan.

---

## 📄 Contoh Penggunaan

Gunakan bersama aplikasi VPN/SSH yang mendukung WebSocket. Konfigurasikan koneksi WebSocket di klien dengan:

- **Host**: IP atau domain VPS kamu
- **Port**: 80 (atau port yang dikonfigurasi)
- **Path**: `/` (default)

---

## 📂 Struktur Direktori

```
Ws-Epro/
├── main.go           # Entry point aplikasi WebSocket proxy
├── config.json       # (Opsional) Konfigurasi port/target
├── go.mod            # Module Go
└── README.md         # Dokumentasi
```

---

## 🧑‍💻 Kontribusi

Kontribusi sangat diterima! Silakan fork repo ini, buat branch baru, dan ajukan pull request.

---

## 📃 Lisensi

Proyek ini menggunakan lisensi MIT.

---

## 🙏 Kredit

Dibuat dengan ❤️ oleh [Diah082](https://github.com/Diah082)  
Terinspirasi oleh komunitas VPN & SSH tunneling Indonesia.