Checks for Regexpes (both literals and via `Regexp.new` / `Regexp.compile`)
that contain unescaped `]` characters.

It emulates the following Ruby warning:

```ruby
$ ruby -e '/abc]123/'
-e:1: warning: regular expression has ']' without escape: /abc]123/
```

### Example:
    # bad
    /abc]123/
    %r{abc]123}
    Regexp.new('abc]123')
    Regexp.compile('abc]123')

    # good
    /abc\]123/
    %r{abc\]123}
    Regexp.new('abc\]123')
    Regexp.compile('abc\]123')
