# Bash notes

## Tricks traps and pitfalls

Watch for spaces after breaking line character `\`.
They are mischevious, eg. █ is space:

```
> arr=("a" \█
   "b" \
   "c")


> echo ${#arr[@]}
4
```

We expected the 4 elements. In the case above we have 4: "a" " " "b" "c"... huh.

```
arr=("a" \
   "b" \
   "c")


echo ${#arr[@]}
3
```




**TODO: Import all notes from google drive!**


killing process by name:
```
pkill -f "java.*MyApplicationToKill"
```

## apt/dpkg

### Checking if package installed:

`dpkg -l <name-of-package>`

or better: `dpkg -l | grep`
`

## for loop

`for i in {0..20}; do echo $i; done`


# cat

Getting input from cat:
    
```bash
cat << EOF | wc
ala
ma
kota
123
EOF
```

And to output files:

```bash
cat << EOF > output.file2
> abc
> def
> EOF
```

