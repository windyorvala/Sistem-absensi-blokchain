import sys
from config import contract

daftar_pertemuan = sys.argv[1:]

if not daftar_pertemuan:
    daftar_pertemuan = ["Pertemuan 1", "Pertemuan 2"]

for nama_pertemuan in daftar_pertemuan:
    print(nama_pertemuan)
    peserta = contract.functions.getPesertaPertemuan(nama_pertemuan).call()

    if not peserta:
        print(" (belum ada yang absen)")
    else:
        for i, nama in enumerate(peserta):
            cabang = "└──" if i == len(peserta) - 1 else "├──"
            print(f" {cabang} {nama}")
    print()
