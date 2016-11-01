This cop enforces that 'exit' calls are not used within a rails app.
Valid options are instead to raise an error, break, return or some
other form of stopping execution of current request.

There are two obvious cases where 'exit' is particularly harmful:

- Usage in library code for your application. Even though rails will
rescue from a SystemExit and continue on, unit testing that library
code will result in specs exiting (potentially silently if exit(0)
is used.)
- Usage in application code outside of the web process could result in
the program exiting, which could result in the code failing to run and
do its job.