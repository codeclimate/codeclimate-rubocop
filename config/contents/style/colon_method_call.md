Checks for methods invoked via the `::` operator instead
of the `.` operator (like `FileUtils::rmdir` instead of `FileUtils.rmdir`).

### Example:
    # bad
    Timeout::timeout(500) { do_something }
    FileUtils::rmdir(dir)
    Marshal::dump(obj)

    # good
    Timeout.timeout(500) { do_something }
    FileUtils.rmdir(dir)
    Marshal.dump(obj)
