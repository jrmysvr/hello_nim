# Package

version       = "0.1.0"
author        = "Jeremy Savor"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
bin           = @["hello"]


# Dependencies
requires "nim >= 1.4.0"


task rpi, "Build for the raspberry pi zero":
  exec "nim c src/hello.nim"

task local, "Build for local environment":
  exec "nim c src/hello.nim"

task clean, "Clean up":
  exec "rm -rf build*/ dist*/ "

before rpi:
  exec "cp raspberry0.cfg nim.cfg"
after rpi:
  exec "rm nim.cfg"

before local:
  exec "cp local.cfg nim.cfg"
after local:
  exec "rm nim.cfg"

