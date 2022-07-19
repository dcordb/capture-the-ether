## Challenge

The difference from the previous challenge is that now the `answer` is
calculated on demand. That is, we can not simply query the blockchain to obtain
the hash of the parent block and its timestamp.

## Solution

To solve it, we need to note that if we have a contract `C`, with a function that
calls the `guess` function from the challenge contract, then both functions
will be included in the same block. This is because a call to a function of a
contract from another contract does not create a new transaction.

So we need to create a contract to interact with the challenge's one. We create
a solve function in which we calculate the hash of the parent of the current
block and the timestamp of the current block. Then we perform an external call
to the `guess` function of the challenge contract (we send 1 ether there).
After this call completes, the challenge contract sends ether to this contract,
so we need to have a receive function declared, and also after the call we need
to transfer the received ethers to our account.
