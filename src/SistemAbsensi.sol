// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SistemAbsensi {
    struct Peserta {
        address alamat;
        string nama;
        uint256 waktuAbsen;
    }

    mapping(bytes32 => Peserta[]) private daftarPeserta;
    mapping(bytes32 => mapping(address => bool)) private sudahAbsen;

    event AbsensiTercatat(bytes32 indexed pertemuanId, string namaPertemuan, address indexed peserta, string namaPeserta, uint256 waktuAbsen);

    function pertemuanId(string memory _namaPertemuan) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_namaPertemuan));
    }

    function absen(string memory _namaPertemuan, string memory _namaPeserta) public {
        bytes32 id = pertemuanId(_namaPertemuan);
        require(!sudahAbsen[id][msg.sender], "Sudah absen untuk pertemuan ini");
        daftarPeserta[id].push(Peserta(msg.sender, _namaPeserta, block.timestamp));
        sudahAbsen[id][msg.sender] = true;
        emit AbsensiTercatat(id, _namaPertemuan, msg.sender, _namaPeserta, block.timestamp);
    }

    function getPesertaPertemuan(string memory _namaPertemuan) public view returns (string[] memory namaPeserta) {
        bytes32 id = pertemuanId(_namaPertemuan);
        Peserta[] memory list = daftarPeserta[id];
        namaPeserta = new string[](list.length);
        for (uint256 i = 0; i < list.length; i++) {
            namaPeserta[i] = list[i].nama;
        }
    }
}
