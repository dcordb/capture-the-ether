// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract Solver {
    uint256 private timestamp = 1658268132;
    bytes32 private parentHash =
        0x21a22161dc75b44df5510e0f68890c730e4674ee6f49e9ec3b286ca95b880c62;

    function solve() public view returns (uint8 ans) {
        ans = uint8(
            uint256(keccak256(abi.encodePacked(parentHash, timestamp)))
        );
    }
}
