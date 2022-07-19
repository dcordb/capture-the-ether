## Challenge

In this challenge the answer is calculated inside the constructor of the
contract, this is the main difference from the previous one. In particular we
have the following: `answer = uint8(keccak256(block.blockhash(block.number - 1), now));`.
`

## Solution

To solve it, we first need to find the block in which the creation of the
contract occurred, let's say this block is `x`. Then we need to obtain the hash
of the parent of `x` and the timestamp of `x`. We can do this easily by
querying the blockchain for the block `x`. To do this we use the `ethers`
library (the code is in the `findData.js` file). After we have this values, we
just need to compute the hash of those values as the challenge does.
