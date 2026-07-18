from web3 import Web3

RPC_URL = "http://127.0.0.1:8545"
CONTRACT_ADDRESS = "0x5FbDB2315678afecb367f032d93F642f64180aa3"

ABI = [
    {
        "inputs": [
            {"internalType": "string", "name": "_namaPertemuan", "type": "string"},
            {"internalType": "string", "name": "_namaPeserta", "type": "string"}
        ],
        "name": "absen",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "inputs": [{"internalType": "string", "name": "_namaPertemuan", "type": "string"}],
        "name": "getPesertaPertemuan",
        "outputs": [{"internalType": "string[]", "name": "namaPeserta", "type": "string[]"}],
        "stateMutability": "view",
        "type": "function"
    }
]

w3 = Web3(Web3.HTTPProvider(RPC_URL))
contract = w3.eth.contract(address=Web3.to_checksum_address(CONTRACT_ADDRESS), abi=ABI)
