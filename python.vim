" Keywords lovingly stolen from https://github.com/hdima/python-syntax

function! s:Enabled(name)
  return exists(a:name) && {a:name}
endfunction

" Is it Python 2 syntax?
function! s:Python2Syntax()
  if exists("b:python_version_2")
      return b:python_version_2
  endif
  return s:Enabled("g:python_version_2")
endfunction

"
" Keywords
"

syn keyword pythonStatement     break continue del
syn keyword pythonStatement     exec return
syn keyword pythonStatement     pass raise
syn keyword pythonStatement     global assert
syn keyword pythonStatement     lambda
syn keyword pythonStatement     with
syn keyword pythonStatement     def class nextgroup=pythonFunction skipwhite
syn keyword pythonRepeat        for while
syn keyword pythonConditional   if elif else
" The standard pyrex.vim unconditionally removes the pythonInclude group, so
" we provide a dummy group here to avoid crashing pyrex.vim.
syn keyword pythonInclude       import
syn keyword pythonImport        import
syn keyword pythonException     try except finally
syn keyword pythonOperator      and in is not or

syn keyword pythonStatement   yield
syn keyword pythonImport      from

if s:Python2Syntax()
  syn keyword pythonStatement  print
  syn keyword pythonImport      as
  syn match   pythonFunction    "[a-zA-Z_][a-zA-Z0-9_]*" display contained
else
  syn keyword pythonStatement   as nonlocal None
  syn match   pythonStatement   "\<yield\s\+from\>" display
  syn keyword pythonBoolean     True False
  syn match   pythonFunction    "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
  syn keyword pythonStatement   await
  syn match   pythonStatement   "\<async\s\+def\>" nextgroup=pythonFunction skipwhite
  syn match   pythonStatement   "\<async\s\+with\>" display
  syn match   pythonStatement   "\<async\s\+for\>" display
endif

"
" Builtin functions
"

if s:Python2Syntax()
  syn keyword pythonBuiltinFunc	apply basestring buffer callable coerce
  syn keyword pythonBuiltinFunc	execfile file help intern long raw_input
  syn keyword pythonBuiltinFunc	reduce reload unichr unicode xrange
  if s:Enabled("g:python_print_as_function")
    syn keyword pythonBuiltinFunc	print
  endif
else
  syn keyword pythonBuiltinFunc	ascii exec memoryview print
endif
syn keyword pythonBuiltinFunc	__import__ abs all any
syn keyword pythonBuiltinFunc	bin bool bytearray bytes
syn keyword pythonBuiltinFunc	chr classmethod cmp compile complex
syn keyword pythonBuiltinFunc	delattr dict dir divmod enumerate eval
syn keyword pythonBuiltinFunc	filter float format frozenset getattr
syn keyword pythonBuiltinFunc	globals hasattr hash hex id
syn keyword pythonBuiltinFunc	input int isinstance
syn keyword pythonBuiltinFunc	issubclass iter len list locals map max
syn keyword pythonBuiltinFunc	min next object oct open ord
syn keyword pythonBuiltinFunc	pow property range
syn keyword pythonBuiltinFunc	repr reversed round set setattr
syn keyword pythonBuiltinFunc	slice sorted staticmethod str sum super tuple
syn keyword pythonBuiltinFunc	type vars zip

"
" Builtin exceptions and warnings
"

if s:Python2Syntax()
  syn keyword pythonExClass	StandardError
else
  syn keyword pythonExClass	BlockingIOError ChildProcessError
  syn keyword pythonExClass	ConnectionError BrokenPipeError
  syn keyword pythonExClass	ConnectionAbortedError ConnectionRefusedError
  syn keyword pythonExClass	ConnectionResetError FileExistsError
  syn keyword pythonExClass	FileNotFoundError InterruptedError
  syn keyword pythonExClass	IsADirectoryError NotADirectoryError
  syn keyword pythonExClass	PermissionError ProcessLookupError TimeoutError

  syn keyword pythonExClass	ResourceWarning
endif
syn keyword pythonExClass	BaseException
syn keyword pythonExClass	Exception ArithmeticError
syn keyword pythonExClass	LookupError EnvironmentError

syn keyword pythonExClass	AssertionError AttributeError BufferError EOFError
syn keyword pythonExClass	FloatingPointError GeneratorExit IOError
syn keyword pythonExClass	ImportError IndexError KeyError
syn keyword pythonExClass	KeyboardInterrupt MemoryError NameError
syn keyword pythonExClass	NotImplementedError OSError OverflowError
syn keyword pythonExClass	ReferenceError RuntimeError StopIteration
syn keyword pythonExClass	SyntaxError IndentationError TabError
syn keyword pythonExClass	SystemError SystemExit TypeError
syn keyword pythonExClass	UnboundLocalError UnicodeError
syn keyword pythonExClass	UnicodeEncodeError UnicodeDecodeError
syn keyword pythonExClass	UnicodeTranslateError ValueError VMSError
syn keyword pythonExClass	WindowsError ZeroDivisionError

syn keyword pythonExClass	Warning UserWarning BytesWarning DeprecationWarning
syn keyword pythonExClass	PendingDepricationWarning SyntaxWarning
syn keyword pythonExClass	RuntimeWarning FutureWarning
syn keyword pythonExClass	ImportWarning UnicodeWarning

highlight Normal ctermbg=black
hi redacted guifg=Black ctermfg=Black

hi link pythonBoolean redacted
hi link pythonBuiltinFunc redacted
hi link pythonConditional redacted
hi link pythonException redacted
hi link pythonExClass redacted
hi link pythonImport redacted
hi link pythonOperator redacted
hi link pythonStatement redacted

