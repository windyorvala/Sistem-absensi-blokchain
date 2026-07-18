# DApp Sistem Absensi

Aplikasi pencatatan kehadiran peserta per pertemuan di atas blockchain Ethereum lokal (Anvil).

## Struktur Project
- `src/SistemAbsensi.sol` - smart contract
- `test/SistemAbsensi.t.sol` - unit test
- `app/config.py` - konfigurasi koneksi & ABI
- `app/absen.py` - script catat absensi (WRITE)
- `app/laporan.py` - script lihat laporan per pertemuan (READ)
- `bukti_deploy.txt` - alamat kontrak & transaction hash

## Cara Menjalankan

### 1. Jalankan node lokal
anvil

### 2. Compile & deploy contract
forge build
forge create src/SistemAbsensi.sol:SistemAbsensi --rpc-url http://127.0.0.1:8545 --private-key <PRIVATE_KEY_AKUN_0> --broadcast

Catat "Deployed to: 0x..." lalu isi ke app/config.py (CONTRACT_ADDRESS).

### 3. Jalankan unit test
forge test

### 4. Setup aplikasi Python
cd app
python3 -m venv venv
source venv/bin/activate
pip install web3

### 5. Catat absensi
python3 absen.py "Pertemuan 1" "Nama Peserta" <index_akun_0_sampai_4>

### 6. Lihat laporan
python3 laporan.py "Pertemuan 1" "Pertemuan 2" "Pertemuan 3"

## Alamat Kontrak (contoh deploy terakhir)
Lihat bukti_deploy.txt untuk alamat kontrak dan seluruh transaction hash.
