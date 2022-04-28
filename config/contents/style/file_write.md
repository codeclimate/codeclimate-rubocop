Favor `File.(bin)write` convenience methods.

NOTE: There are different method signatures between `File.write` (class method)
and `File#write` (instance method). The following case will be allowed because
static analysis does not know the contents of the splat argument:

```ruby
File.open(filename, 'w') do |f|
  f.write(*objects)
end
```

### Example:
    ## text mode
    # bad
    File.open(filename, 'w').write(content)
    File.open(filename, 'w') do |f|
      f.write(content)
    end

    # good
    File.write(filename, content)

### Example:
    ## binary mode
    # bad
    File.open(filename, 'wb').write(content)
    File.open(filename, 'wb') do |f|
      f.write(content)
    end

    # good
    File.binwrite(filename, content)
