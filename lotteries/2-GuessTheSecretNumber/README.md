## Challenge

This challenge differs from the previous in that now to find the answer we have
to reverse a hash.

## Solution

The key observation here is that the guess is of type `uint8`, which means
there are only 256 possible values to check. So, the solution is create a for
loop with i from 0 to 255 and check if the hash of i is equal to the given
hash. Here we find that the guess is equal to 170.
