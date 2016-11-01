This cop finds uses of `alias` where `alias_method` would be more
appropriate (or is simply preferred due to configuration), and vice
versa.
It also finds uses of `alias :symbol` rather than `alias bareword`.