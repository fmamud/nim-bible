import httpclient, json, macros

const booksUrl = "https://www.bibliaonline.com.br/_data/v2/books/pt.json"

type
  Book*     = JsonNode
  Books*    = seq[Book]

proc `$`*(b: Book): string =
  b.pretty

proc all*(): Books =
  let resp = parseJson(getContent(booksUrl))
  newSeq(result, resp.len)
  for node in 0..len(resp)-1: result[node] = resp[node]

proc `[]`*(b: Book, name:string): string =
  for v in b.getFields:
    if v.key == name:
      result = $v.val
      break

template at*(number: expr): Book =
  let resp = parseJson(getContent(booksUrl))
  let book = number-1
  if book > len(resp): raise newException(Exception, "Chapter not found")
  resp[book]
