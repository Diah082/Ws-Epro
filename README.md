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

- 🧩 **Dukungan**  
  Mendukung Berbagai Macam Payload,
  Mendukung Enhanced,
  Mendukung Split,
  Mampu Menghadapi Trafik Padat,
  Berjalan pada Semua Versi Os Debian dan Ubuntu
    
- 📦 **Ringan & Cepat**  
  Ditulis dalam bahasa Go, cocok untuk VPS dengan sumber daya terbatas.

---

## 🛠️ Instalasi

### 1. Run Command 

```
wget -q https://raw.githubusercontent.com/diah082/Ws-Epro/main/sshws.sh && chmod +x sshws.sh && ./sshws.sh
```

Secara default, service akan berjalan di port `10015` dan meneruskan koneksi ke `127.0.0.1:143`. [Dropbear]

---

## ⚙️ Konfigurasi

Edit file konfigurasi `config.conf` pada direktori /usr/bin/config.conf :

```yaml
## verbose level 0=info, 1=verbose, 2=very verbose
verbose: 0
listen:

# // SSH
- target_host: 127.0.0.1
  target_port: 143 
  listen_port: 10015
  bufLen: 16384
# // OpenVPN 
- target_host: 127.0.0.1
  target_port: 1194
  listen_port: 10012
  bufLen: 16384
```

> Ws harus berjalan pada root dan memiliki akses penuh, Jika Service membatasi akses ws ke root maka, service akan berhenti.

---

## 📄 Contoh Penggunaan

Gunakan bersama aplikasi VPN/SSH yang mendukung WebSocket. Konfigurasikan koneksi WebSocket di klien dengan:

- **Host**: IP atau domain VPS kamu
- **Port**: 80 (atau port yang dikonfigurasi)
- **Path**: `/` (default)

---

## 📂 Struktur Direktori

```
/usr/bin/
├── ws                # Entry point aplikasi WebSocket proxy
├── config.conf       # (Opsional) Konfigurasi port/target
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
