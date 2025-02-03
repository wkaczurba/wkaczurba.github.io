# Regex

## Changing multiple spaces in Java into single ones

## Java - `+` vs `*`

This is where `+` and `*` characters matters:
 - `replaceAll("[ ]+", " ")`

This will mess things up:
 - `replaceAll("[ ]*", " ")`

## Sed `-e` vs `-E`

This does not work (-e) -> it is to add scripts one after another

 - `echo "This is   some input     HAHA" | sed -e 's/[ \t]+/ /g'`

This works though (-E) -> thi is for **-E, -r, --regexp-extended**

 - `echo "This is   some input     HAHA" | sed -e 's/[ \t]+/ /g'`

With -E the following will work:
 - `echo "Abbbba" | sed -E 's/[b]{2}//'` and will produce `Abba` (changing exactly `bb` into ``)

