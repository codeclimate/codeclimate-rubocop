# Class Length

The longer a class is, the harder it is to break down, test, and adequately express with a great name. Classes that are long will grow over time and become harder to manage, so it is usually a worthwhile investment to simplify classes by refactoring into smaller, more discrete units of functionality.

Classes that are too long tend to have too many responsibilities. Though there isn't always a direct correlation between *length* and *number of responsibilities*, it is still a good guideline to "keep it small". From "Clean Code" by Robert "Uncle Bob" Martin:

> "The Single Responsibility Principle (SRP) states that a class or module should have one,
and only one, reason to change. This principle gives us both a definition of responsibility,
and a guidelines for class size. Classes should have one responsibility—one reason to
change." - Robert "Uncle Bob" Martin, "Clean Code"

Seek to create classes with as close to one responsibility as possible and plan to work on those that don’t.

#### Solutions

* Document - What does this class do? Count its responsibilities
* Test - Make sure that your class is tested, and that all of the lines in the explanation above are accounted for.
* Refactor - Take small pieces of the class and pull them out into other collaborator classes. Simplify and clarify the intent of the class by repeating this process until the class has as few responsibilities as possible.
* As you go through this process, think deliberately about the names of your classes: do each of them indicate a clear, single responsibility?

#### Further Reading

* [SOLID: Part 1 - The Single Responsibility Principle](http://code.tutsplus.com/tutorials/solid-part-1-the-single-responsibility-principle--net-36074) 
* ["Clean Code: A Handbook of Agile Software Craftsmanship"](http://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882) - Robert C. Martin
* ["Refactoring: Improving the Design of Existing Code"](http://www.amazon.com/gp/product/0201485672/) - Martin Fowler et. al. 
* ["The Rule of 30: When is a method, class or subsystem too big?"](http://swreflections.blogspot.com/2012/12/rule-of-30-when-is-method-class-or.html) - Jim Bird
* ["The Single Responsibility Principle"](http://programmer.97things.oreilly.com/wiki/index.php/The_Single_Responsibility_Principle) - Robert C. Martin
