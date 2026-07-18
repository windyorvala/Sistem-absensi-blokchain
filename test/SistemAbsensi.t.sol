// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/SistemAbsensi.sol";

contract SistemAbsensiTest is Test {
    SistemAbsensi absensi;

    function setUp() public {
        absensi = new SistemAbsensi();
    }

    function testAbsenTercatat() public {
        absensi.absen("Pertemuan 1", "Budi");
        string[] memory peserta = absensi.getPesertaPertemuan("Pertemuan 1");

        assertEq(peserta.length, 1);
        assertEq(peserta[0], "Budi");
    }

    function testTidakBisaAbsenDobel() public {
        absensi.absen("Pertemuan 1", "Budi");

        vm.expectRevert("Sudah absen untuk pertemuan ini");
        absensi.absen("Pertemuan 1", "Budi");
    }
}
