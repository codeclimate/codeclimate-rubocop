This cop enforces the use of consistent method names
from the Enumerable module.

Unfortunately we cannot actually know if a method is from
Enumerable or not (static analysis limitation), so this cop
can yield some false positives.