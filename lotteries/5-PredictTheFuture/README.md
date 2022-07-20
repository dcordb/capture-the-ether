## Challenge

This challenge is significantly harder than the previous one. This is because
now we have to lock the guess first and then (and only then) discover
whether our guess is right or not. The good thing is that the answer is
modulated by 10, so we have only 10 possibilities of a guess. Note that here
the previous solution will not work, since there is no way for functions `lockInGuess` and
`settle` to be included in the same block (notice the second require in the `settle`
function).

## Solution

We have `uint8 answer = uint8(keccak256(block.blockhash(block.number - 1),
now)) % 10;`. It's reasonable to assume that answer is an uniformly random
number from 0 to 9, so the probability to guess the correct answer is 1/10.

Now, the observation to solve this is that there is a way that we can lock the
guess and settle many times, until we succeed. The idea is to create a function
in a new contract that interacts with the challenge. This function calls the
challenge's settle function, then it checks whether it succeed or not, if it
didn't the function will throw an error and revert, this will cause that the
`guesser` variable in the contract will not change and we can call `settle`
indefinitely!

```solidity
    function lockGuess() public payable {
        require(msg.value == 1 ether, "require 1 ether");
        // set 0 as guess
        challenge.lockInGuess{value: 1 ether}(0);
    }

    function settle() public {
        challenge.settle();
        // if we fail it will revert, and we can settle again!
        require(challenge.isComplete(), "not completed");
        payable(msg.sender).transfer(address(this).balance);
    }
```

After we succeed, we have to transfer the ether to our account, also
we need to define a receive function, since the challenge sends ether to our
contract.

So now, the only thing we have to do is to initially lock 0 (for example) as
the guess and call multiple times the settle function until we succeed. On
average the number of calls we have to do is 10, this is because the number of
tries to succeed has a geometric distribution and its mean is 1 over the
probability of succeed, so 1/(1/10) = 10.
