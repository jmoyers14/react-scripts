#react-create

## About

react-create is a perl script for creating common react-js files and classes.

## Basic Usage

```
perl react-create --args [ClassName]
```

## Arguments

```
--con: creates a new container class in the current working directory or in the containers/ directory if present.

--com: creates a new components class in the current working directory on in the components/ directory if present.
```

## Convenience

For convenient usage, add the script to a directory in your shell's PATH and create an alias.

Example:
```
alias rc=react-create.pl
```

convenient usage:
```
rc --args [ClassName]
```



