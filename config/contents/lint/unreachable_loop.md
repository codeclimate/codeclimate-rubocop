This cop checks for loops that will have at most one iteration.

A loop that can never reach the second iteration is a possible error in the code.
In rare cases where only one iteration (or at most one iteration) is intended behavior,
the code should be refactored to use `if` conditionals.

### Example:
    # bad
    while node
      do_something(node)
      node = node.parent
      break
    end

    # good
    while node
      do_something(node)
      node = node.parent
    end

    # bad
    def verify_list(head)
      item = head
      begin
        if verify(item)
          return true
        else
          return false
        end
      end while(item)
    end

    # good
    def verify_list(head)
      item = head
      begin
        if verify(item)
          item = item.next
        else
          return false
        end
      end while(item)

      true
    end

    # bad
    def find_something(items)
      items.each do |item|
        if something?(item)
          return item
        else
          raise NotFoundError
        end
      end
    end

    # good
    def find_something(items)
      items.each do |item|
        if something?(item)
          return item
        end
      end
      raise NotFoundError
    end
