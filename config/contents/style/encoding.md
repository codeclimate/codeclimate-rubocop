This cop checks whether the source file has a utf-8 encoding
comment or not.
Setting this check to "always" and "when_needed" makes sense only
for code that should support Ruby 1.9, since in 2.0+ utf-8 is the
default source file encoding. There are three styles:

when_needed - only enforce an encoding comment if there are non ASCII
                characters, otherwise report an offense
always - enforce encoding comment in all files
never - enforce no encoding comment in all files