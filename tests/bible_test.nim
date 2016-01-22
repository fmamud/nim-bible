import unittest, unicode, books/book

const totalBooks = 66

test "test setup":
  check true

test "check total bible books":
  let all = book.all()
  check totalBooks == all.len

test "get Genesis book":
  let b =  book.at 1
  check b["number"] == $1
