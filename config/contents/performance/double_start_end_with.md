This cop checks for double `#start_with?` or `#end_with?` calls
separated by `||`. In some cases such calls can be replaced
with an single `#start_with?`/`#end_with?` call.

### Example:
    # bad
    str.start_with?("a") || str.start_with?(Some::CONST)
    str.start_with?("a", "b") || str.start_with?("c")
    str.end_with?(var1) || str.end_with?(var2)

    # good
    str.start_with?("a", Some::CONST)
    str.start_with?("a", "b", "c")
    str.end_with?(var1, var2)