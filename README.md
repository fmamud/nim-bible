# nim-bible
Read the Bible using Nim

## How to build

```sh
nimble -d:ssl build
```

## How to run

```
bible --book=<string> --verse=<string>
```

Examples:

```sh
bin/bible --book=salmos --verse=23:1

# Output:
#
# Salmos 23:1
# O Senhor é o meu pastor; nada me faltará.

bin/bible --book=joao --verse=3:16

# Output:
#
# João 3:16
# Porque Deus amou o mundo de tal maneira que deu o seu Filho unigênito, para que todo aquele que nele crê não pereça, mas tenha a vida eterna.
```