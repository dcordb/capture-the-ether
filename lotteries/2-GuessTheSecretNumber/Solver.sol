// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract Solver {
    bytes32 hash =
        0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365;

    function calculate() public view returns (uint8 ans) {
        for (uint8 i = 0; i < 256; i++) {
            if (keccak256(abi.encodePacked(i)) == hash) {
                ans = i;
                break;
            }
        }
    }
}
