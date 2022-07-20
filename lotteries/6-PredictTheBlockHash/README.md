## Challenge

The difference between this and the previous challenge is that now we need to
guess the hash of the block number `block.number + 1`. Since the hash is of 32
bytes of length, then we would need to settle 2^256 times on average to get the
correct answer, which is impossible to do.

## Solution

To solve this, we take advantage of an Ethereum limitation: the function
`blockhash` returns the correct hash for the last 256 blocks and returns 0 for
all other blocks. So, the idea is to lock 0 as the guess and then wait until
256 blocks have been mined, and call settle in that moment. This guarantees
that the value returned by the `blockhash` function will be 0. Ethereum has a
block time of 12 to 14 seconds on average, so we will need to wait about an
hour to call the settle function. Here we use the same Solver contract used in
the previous challenge.
