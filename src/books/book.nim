import httpclient, json, strformat

const booksUrl = "https://bible-api.com"

type
  Translation* {.pure} = enum 
    KingJamesVersion = "kjv", 
    JoaoFerreiraDeAlmeida = "almeida"

type Verse* = object
  book_id: string
  book_name: string
  chapter: int
  verse: int
  text*: string

type Result* = object
  reference*: string
  verses*: seq[Verse]
  text*: string


let client = newHttpClient(timeout = 1000)

proc get*(book: string, verse: string, translation: Translation = JoaoFerreiraDeAlmeida): Result =
  let response = client.request(&"{booksUrl}/{book}+{verse}?translation={translation}")

  case response.code
    of Http200:
      result = to(parseJson(response.body), Result)
    else:
      result = Result(reference: &"Book '{book}' with verse(s) {verse} not found")