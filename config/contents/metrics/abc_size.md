# ABC Size

ABC Size is a measure of complexity that counts the number of Assignments, Branches (method calls), and Conditionals in your code. It is related to Cyclomatic complexity, which has its origins in the earliest research on static analysis and remains a useful metric of complexity to this day. Cyclomatic complexity correlates the number of potential pathways through a given unit of code with complexity - a unit of code with a lot of potential pathways will have a high cyclomatic complexity score.

Branches -- code that causes decisions to be made -- are the central source of complexity according to cyclomatic complexity. `if` statements, `for` loops, and the predicates in these statements all create execution paths and increase complexity.

Functions with high cyclomatic complexity are harder to test and understand, leading to bugs and higher maintenance costs. Refactor at will.

#### Solutions

* Simplify any branching logic that isn't necessary in your function - collapse redundant branches.
* Extract blocks of logic to private methods where possible.
* Document and follow the pathways through the function and see if you can group functionality to ease in refactoring.

#### Further Reading

* [C2 Wiki: AbcMetric](http://c2.com/cgi/wiki?AbcMetric)
* [SOLID: Part 1 - The Single Responsibility Principle](http://code.tutsplus.com/tutorials/solid-part-1-the-single-responsibility-principle--net-36074) 
* ["Clean Code: A Handbook of Agile Software Craftsmanship"](http://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882) - Robert C. Martin
* ["Refactoring: Improving the Design of Existing Code"](http://www.amazon.com/gp/product/0201485672/) - Martin Fowler et. al.
* ["The Single Responsibility Principle"](http://programmer.97things.oreilly.com/wiki/index.php/The_Single_Responsibility_Principle) - Robert C. Martin
* [Your code sucks, let’s fix it (Video)](https://www.youtube.com/watch?v=GtB5DAfOWMQ) — Rafael Dohms
