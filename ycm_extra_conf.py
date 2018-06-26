def FlagsForFile( filename, **kwargs ):
  return {
    'flags': [ '-x', 'c', '-ansi', '-Wall', '-Wextra', '-Werror', '-Wpedantic'],
  }
