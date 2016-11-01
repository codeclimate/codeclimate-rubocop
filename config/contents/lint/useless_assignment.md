This cop checks for every useless assignment to local variable in every
scope.
The basic idea for this cop was from the warning of `ruby -cw`:

    assigned but unused variable - foo

Currently this cop has advanced logic that detects unreferenced
reassignments and properly handles varied cases such as branch, loop,
rescue, ensure, etc.