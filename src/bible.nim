from books/book import Result, get
import parseopt, tables

proc main() =
  var values = initTable[string, string]()
  
  for kind, key, val in getopt():
    case kind
      of cmdShortOption, cmdLongOption:
        values[key] = val
      of cmdArgument:
        values[key] = key
      of cmdEnd:
        discard

  if not values.hasKey("book") or not values.hasKey("verse"):
    quit("ERROR: bible --book=<string> --verse=<string>")
  
  var r : Result = book.get(values["book"], values["verse"])
  echo r.reference
  for verse in r.verses:
    echo verse.text

when isMainModule:
    main()