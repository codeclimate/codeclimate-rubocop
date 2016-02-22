This cop identifies places where `Hash#merge!` can be replaced by
`Hash#[]=`.

### Example:
    hash.merge!(a: 1)
    hash.merge!({'key' => 'value'})
    hash.merge!(a: 1, b: 2)