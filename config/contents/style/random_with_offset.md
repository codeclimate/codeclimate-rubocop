Checks for the use of randomly generated numbers,
added/subtracted with integer literals, as well as those with
Integer#succ and Integer#pred methods. Prefer using ranges instead,
as it clearly states the intentions.

### Example:
    # bad
    rand(6) + 1
    1 + rand(6)
    rand(6) - 1
    1 - rand(6)
    rand(6).succ
    rand(6).pred
    Random.rand(6) + 1
    Kernel.rand(6) + 1
    rand(0..5) + 1

    # good
    rand(1..6)
    rand(1...7)