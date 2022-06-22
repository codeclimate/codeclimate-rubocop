Checks for non-atomic file operation.
And then replace it with a nearly equivalent and atomic method.

These can cause problems that are difficult to reproduce,
especially in cases of frequent file operations in parallel,
such as test runs with parallel_rspec.

For examples: creating a directory if there is none, has the following problems

An exception occurs when the directory didn't exist at the time of `exist?`,
but someone else created it before `mkdir` was executed.

Subsequent processes are executed without the directory that should be there
when the directory existed at the time of `exist?`,
but someone else deleted it shortly afterwards.

### Safety:

This cop is unsafe, because autocorrection change to atomic processing.
The atomic processing of the replacement destination is not guaranteed
to be strictly equivalent to that before the replacement.

### Example:
    # bad
    unless FileTest.exist?(path)
      FileUtils.makedirs(path)
    end

    if FileTest.exist?(path)
      FileUtils.remove(path)
    end

    # good
    FileUtils.mkdir_p(path)

    FileUtils.rm_rf(path)
