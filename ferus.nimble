# Package

version       = "0.1.0"
author        = "xTrayambak"
description   = "A fast, independent and (hopefully) secure web browser written in Nim"
license       = "MIT"
srcDir        = "src"
bin           = @["ferus", "libferuscli"]
binDir        = "bin"

# Dependencies

requires "nim >= 1.6.10"

# Chronicles -- logger
requires "chronicles"

# Jsony -- JSON encode/decode for IPC layer
requires "jsony"

# Netty -- low latency reliable UDP implementation
requires "netty"

# Urlly -- URL parser (I have no clue if it's 100% WHATWG compliant)
requires "urlly"

# Weave -- threading abstraction (ringabout's fork)
requires "https://github.com/ringabout/weave"

# opengl -- OpenGL bindings for Nim
requires "opengl"

# windy -- Windowing system
requires "windy"

# boxy -- using pixie to render to an OpenGL context
requires "boxy"

# urlly -- URL parser
requires "urlly"

# nim-taskpools -- Thread task pools
requires "taskpools"

# ferushtml/2html5you -- next gen Ferus HTML parser (will put it on Nimble later)
requires "https://github.com/xTrayambak/ferushtml"

# Linux-specific modules
when defined(linux):
  requires "seccomp"

# Debug build (ferus + libferuscli)
task debugBuild, "Build Ferus as a production package (debug)":
  exec "nim c -o:bin/ferus src/ferus.nim && nim c -o:bin/libferuscli src/libferuscli.nim"

# Production build (ferus + libferuscli)
task productionBuild, "Build Ferus as a production package":
  exec "nim c -o:bin/ferus -d:release src/ferus.nim && nim c -o:bin/libferuscli -d:release src/libferuscli.nim"

task quickdebug, "Build and run debug version of Ferus":
  exec "nim c -o:bin/ferus src/ferus.nim && nim c -o:bin/libferuscli src/libferuscli.nim"
  withDir "bin":
    exec "./ferus"
