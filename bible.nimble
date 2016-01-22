# Package

version       = "0.1.0"
author        = "Felipe Mamud"
description   = "Read the Bible using Nim."
license       = "MIT"

srcDir        = "src"

bin           = @["bible"]
binDir        = "bin"

# Dependencies

requires "nim >= 0.13.0"

# Tasks

task test, "run project tests":
  withDir "test":
    exec "nim c -r -d:ssl --hints:off --warnings:off --verbosity:0 bible"
