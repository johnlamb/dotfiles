def FlagsForFile( filename, **kwargs ):
  return {
    'flags': [ '-x', 'c++', '-std=c++11', '-Iinclude', '-Isrc', '-I/usr/local/include/', '-Wall', '-Wextra', '-Wpedantic' ],
  }
