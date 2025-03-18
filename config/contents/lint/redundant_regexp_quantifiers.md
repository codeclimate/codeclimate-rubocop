Checks for redundant quantifiers inside `Regexp` literals.

It is always allowed when interpolation is used in a regexp literal,
because it's unknown what kind of string will be expanded as a result:

```ruby
/(?:a*#{interpolation})?/x
```

### Example:
    # bad
    /(?:x+)+/

    # good
    /(?:x)+/

    # good
    /(?:x+)/

    # bad
    /(?:x+)?/

    # good
    /(?:x)*/

    # good
    /(?:x*)/