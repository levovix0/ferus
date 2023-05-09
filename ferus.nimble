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

# Linux-specific modules
when defined(linux):
  requires "seccomp"

# Debug build (ferus + libferuscli)
task debugBuild, "Build Ferus as a production package (debug)":
  exec "echo Building the Ferus web engine with debug symbols"

  exec "nim c src/ferus.nim"
  exec "echo Successfully built main Ferus binary"
  exec "nim c src/libferuscli.nim"
  exec "echo Successfully built libferuscli binary"

  # TODO: This is a hacky fix. But I am too lazy to find a proper fix for this!
  exec "mv src/ferus bin/ferus"
  exec "mv src/libferuscli bin/libferuscli"

# Production build (ferus + libferuscli)
task productionBuild, "Build Ferus as a production package":
  exec "echo Building the Ferus web engine"
  exec "nim c src/ferus.nim -d:release"
  exec "nim c src/libferuscli.nim -d:release"

  exec "mv src/ferus bin/ferus"
  exec "mv src/libferuscli bin/libferuscli"
