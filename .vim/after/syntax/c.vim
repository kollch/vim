" Vim syntax file
" Language:	C Additions
" Maintainer:	Mikhail Wolfson <mywolfson@gmail.com>
" URL: http://web.mit.edu/wolfsonm
" Last Change:	2010 Dec. 3
" Version: 0.4
"
" Changelog:
"   0.4 - updates and fixes to cDelimiter to fix break with foldmethod=syntax,
"         entirely suggested and solved by Ivan Freitas
"         <ivansichfreitas@gmail.com>
"   0.3 - updates and fixes to cUserFunctionPointer, thanks to
"         Alexei <lxmzhv@gmail.com>
"   0.2 - change [] to operator
"   0.1 - initial upload, modification from vimscript#1201, Extended c.vim


" Common ANSI-standard functions ----------------------------------------- {{{
syntax keyword cAnsiFunction MULU_ DIVU_ MODU_ MUL_ DIV_ MOD_
syntax keyword cAnsiFunction main typeof
syntax keyword cAnsiFunction open close read write lseek dup dup2
syntax keyword cAnsiFunction fcntl ioctl
syntax keyword cAnsiFunction wctrans towctrans towupper
syntax keyword cAnsiFunction towlower wctype iswctype
syntax keyword cAnsiFunction iswxdigit iswupper iswspace
syntax keyword cAnsiFunction iswpunct iswprint iswlower
syntax keyword cAnsiFunction iswgraph iswdigit iswcntrl
syntax keyword cAnsiFunction iswalpha iswalnum wcsrtombs
syntax keyword cAnsiFunction mbsrtowcs wcrtomb mbrtowc
syntax keyword cAnsiFunction mbrlen mbsinit wctob
syntax keyword cAnsiFunction btowc wcsfxtime wcsftime
syntax keyword cAnsiFunction wmemset wmemmove wmemcpy
syntax keyword cAnsiFunction wmemcmp wmemchr wcstok
syntax keyword cAnsiFunction wcsstr wcsspn wcsrchr
syntax keyword cAnsiFunction wcspbrk wcslen wcscspn
syntax keyword cAnsiFunction wcschr wcsxfrm wcsncmp
syntax keyword cAnsiFunction wcscoll wcscmp wcsncat
syntax keyword cAnsiFunction wcscat wcsncpy wcscpy
syntax keyword cAnsiFunction wcstoull wcstoul wcstoll
syntax keyword cAnsiFunction wcstol wcstold wcstof
syntax keyword cAnsiFunction wcstod ungetwc putwchar
syntax keyword cAnsiFunction putwc getwchar getwc
syntax keyword cAnsiFunction fwide fputws fputwc
syntax keyword cAnsiFunction fgetws fgetwc wscanf
syntax keyword cAnsiFunction wprintf vwscanf vwprintf
syntax keyword cAnsiFunction vswscanf vswprintf vfwscanf
syntax keyword cAnsiFunction vfwprintf swscanf swprintf
syntax keyword cAnsiFunction fwscanf fwprintf zonetime
syntax keyword cAnsiFunction strfxtime strftime localtime
syntax keyword cAnsiFunction gmtime ctime asctime
syntax keyword cAnsiFunction time mkxtime mktime
syntax keyword cAnsiFunction difftime clock strlen
syntax keyword cAnsiFunction strerror memset strtok
syntax keyword cAnsiFunction strstr strspn strrchr
syntax keyword cAnsiFunction strpbrk strcspn strchr
syntax keyword cAnsiFunction memchr strxfrm strncmp
syntax keyword cAnsiFunction strcoll strcmp memcmp
syntax keyword cAnsiFunction strncat strcat strncpy
syntax keyword cAnsiFunction strcpy memmove memcpy
syntax keyword cAnsiFunction wcstombs mbstowcs wctomb
syntax keyword cAnsiFunction mbtowc mblen lldiv
syntax keyword cAnsiFunction ldiv div llabs
syntax keyword cAnsiFunction labs abs qsort
syntax keyword cAnsiFunction bsearch system getenv
syntax keyword cAnsiFunction exit atexit abort
syntax keyword cAnsiFunction realloc malloc free
syntax keyword cAnsiFunction calloc srand rand
syntax keyword cAnsiFunction strtoull strtoul strtoll
syntax keyword cAnsiFunction strtol strtold strtof
syntax keyword cAnsiFunction strtod atoll atol
syntax keyword cAnsiFunction atoi atof perror
syntax keyword cAnsiFunction ferror feof clearerr
syntax keyword cAnsiFunction rewind ftell fsetpos
syntax keyword cAnsiFunction fseek fgetpos fwrite
syntax keyword cAnsiFunction fread ungetc puts
syntax keyword cAnsiFunction putchar putc gets
syntax keyword cAnsiFunction getchar getc fputs
syntax keyword cAnsiFunction fputc fgets fgetc
syntax keyword cAnsiFunction vsscanf vsprintf vsnprintf
syntax keyword cAnsiFunction vscanf vprintf vfscanf
syntax keyword cAnsiFunction vfprintf sscanf sprintf
syntax keyword cAnsiFunction snprintf scanf printf
syntax keyword cAnsiFunction fscanf fprintf setvbuf
syntax keyword cAnsiFunction setbuf freopen fopen
syntax keyword cAnsiFunction fflush fclose tmpnam
syntax keyword cAnsiFunction tmpfile rename remove
syntax keyword cAnsiFunction offsetof va_start va_end
syntax keyword cAnsiFunction va_copy va_arg raise signal
syntax keyword cAnsiFunction longjmp setjmp isunordered
syntax keyword cAnsiFunction islessgreater islessequal isless
syntax keyword cAnsiFunction isgreaterequal isgreater fmal
syntax keyword cAnsiFunction fmaf fma fminl
syntax keyword cAnsiFunction fminf fmin fmaxl
syntax keyword cAnsiFunction fmaxf fmax fdiml
syntax keyword cAnsiFunction fdimf fdim nextafterxl
syntax keyword cAnsiFunction nextafterxf nextafterx nextafterl
syntax keyword cAnsiFunction nextafterf nextafter nanl
syntax keyword cAnsiFunction nanf nan copysignl
syntax keyword cAnsiFunction copysignf copysign remquol
syntax keyword cAnsiFunction remquof remquo remainderl
syntax keyword cAnsiFunction remainderf remainder fmodl
syntax keyword cAnsiFunction fmodf fmod truncl
syntax keyword cAnsiFunction truncf trunc llroundl
syntax keyword cAnsiFunction llroundf llround lroundl
syntax keyword cAnsiFunction lroundf lround roundl
syntax keyword cAnsiFunction roundf round llrintl
syntax keyword cAnsiFunction llrintf llrint lrintl
syntax keyword cAnsiFunction lrintf lrint rintl
syntax keyword cAnsiFunction rintf rint nearbyintl
syntax keyword cAnsiFunction nearbyintf nearbyint floorl
syntax keyword cAnsiFunction floorf floor ceill
syntax keyword cAnsiFunction ceilf ceil tgammal
syntax keyword cAnsiFunction tgammaf tgamma lgammal
syntax keyword cAnsiFunction lgammaf lgamma erfcl
syntax keyword cAnsiFunction erfcf erfc erfl
syntax keyword cAnsiFunction erff erf sqrtl
syntax keyword cAnsiFunction sqrtf sqrt powl
syntax keyword cAnsiFunction powf pow hypotl
syntax keyword cAnsiFunction hypotf hypot fabsl
syntax keyword cAnsiFunction fabsf fabs cbrtl
syntax keyword cAnsiFunction cbrtf cbrt scalblnl
syntax keyword cAnsiFunction scalblnf scalbln scalbnl
syntax keyword cAnsiFunction scalbnf scalbn modfl
syntax keyword cAnsiFunction modff modf logbl
syntax keyword cAnsiFunction logbf logb log2l
syntax keyword cAnsiFunction log2f log2 log1pl
syntax keyword cAnsiFunction log1pf log1p log10l
syntax keyword cAnsiFunction log10f log10 logl
syntax keyword cAnsiFunction logf log ldexpl
syntax keyword cAnsiFunction ldexpf ldexp ilogbl
syntax keyword cAnsiFunction ilogbf ilogb frexpl
syntax keyword cAnsiFunction frexpf frexp expm1l
syntax keyword cAnsiFunction expm1f expm1 exp2l
syntax keyword cAnsiFunction exp2f exp2 expl
syntax keyword cAnsiFunction expf exp tanhl
syntax keyword cAnsiFunction tanhf tanh sinhl
syntax keyword cAnsiFunction sinhf sinh coshl
syntax keyword cAnsiFunction coshf cosh atanhl
syntax keyword cAnsiFunction atanhf atanh asinhl
syntax keyword cAnsiFunction asinhf asinh acoshl
syntax keyword cAnsiFunction acoshf acosh tanl
syntax keyword cAnsiFunction tanf tan sinl
syntax keyword cAnsiFunction sinf sin cosl
syntax keyword cAnsiFunction cosf cos atan2l
syntax keyword cAnsiFunction atan2f atan2 atanl
syntax keyword cAnsiFunction atanf atan asinl
syntax keyword cAnsiFunction asinf asin acosl
syntax keyword cAnsiFunction acosf acos signbit
syntax keyword cAnsiFunction isnormal isnan isinf
syntax keyword cAnsiFunction isfinite fpclassify localeconv
syntax keyword cAnsiFunction setlocale wcstoumax wcstoimax
syntax keyword cAnsiFunction strtoumax strtoimax feupdateenv
syntax keyword cAnsiFunction fesetenv feholdexcept fegetenv
syntax keyword cAnsiFunction fesetround fegetround fetestexcept
syntax keyword cAnsiFunction fesetexceptflag feraiseexcept fegetexceptflag
syntax keyword cAnsiFunction feclearexcept toupper tolower
syntax keyword cAnsiFunction isxdigit isupper isspace
syntax keyword cAnsiFunction ispunct isprint islower
syntax keyword cAnsiFunction isgraph isdigit iscntrl
syntax keyword cAnsiFunction isalpha isalnum creall
syntax keyword cAnsiFunction crealf creal cprojl
syntax keyword cAnsiFunction cprojf cproj conjl
syntax keyword cAnsiFunction conjf conj cimagl
syntax keyword cAnsiFunction cimagf cimag cargl
syntax keyword cAnsiFunction cargf carg csqrtl
syntax keyword cAnsiFunction csqrtf csqrt cpowl
syntax keyword cAnsiFunction cpowf cpow cabsl
syntax keyword cAnsiFunction cabsf cabs clogl
syntax keyword cAnsiFunction clogf clog cexpl
syntax keyword cAnsiFunction cexpf cexp ctanhl
syntax keyword cAnsiFunction ctanhf ctanh csinhl
syntax keyword cAnsiFunction csinhf csinh ccoshl
syntax keyword cAnsiFunction ccoshf ccosh catanhl
syntax keyword cAnsiFunction catanhf catanh casinhl
syntax keyword cAnsiFunction casinhf casinh cacoshl
syntax keyword cAnsiFunction cacoshf cacosh ctanl
syntax keyword cAnsiFunction ctanf ctan csinl
syntax keyword cAnsiFunction csinf csin ccosl
syntax keyword cAnsiFunction ccosf ccos catanl
syntax keyword cAnsiFunction catanf catan casinl
syntax keyword cAnsiFunction casinf casin cacosl
syntax keyword cAnsiFunction cacosf cacos assert
syntax keyword cAnsiFunction UINTMAX_C INTMAX_C UINT64_C
syntax keyword cAnsiFunction UINT32_C UINT16_C UINT8_C
syntax keyword cAnsiFunction INT64_C INT32_C INT16_C INT8_C
" ------------------------------------------------------ }}}

" Common ANSI-standard Names ------------------------------ {{{
syntax keyword cAnsiName PRId8 PRIi16 PRIo32 PRIu64
syntax keyword cAnsiName PRId16 PRIi32 PRIo64 PRIuLEAST8
syntax keyword cAnsiName PRId32 PRIi64 PRIoLEAST8 PRIuLEAST16
syntax keyword cAnsiName PRId64 PRIiLEAST8 PRIoLEAST16 PRIuLEAST32
syntax keyword cAnsiName PRIdLEAST8 PRIiLEAST16 PRIoLEAST32 PRIuLEAST64
syntax keyword cAnsiName PRIdLEAST16 PRIiLEAST32 PRIoLEAST64 PRIuFAST8
syntax keyword cAnsiName PRIdLEAST32 PRIiLEAST64 PRIoFAST8 PRIuFAST16
syntax keyword cAnsiName PRIdLEAST64 PRIiFAST8 PRIoFAST16 PRIuFAST32
syntax keyword cAnsiName PRIdFAST8 PRIiFAST16 PRIoFAST32 PRIuFAST64
syntax keyword cAnsiName PRIdFAST16 PRIiFAST32 PRIoFAST64 PRIuMAX
syntax keyword cAnsiName PRIdFAST32 PRIiFAST64 PRIoMAX PRIuPTR
syntax keyword cAnsiName PRIdFAST64 PRIiMAX PRIoPTR PRIx8
syntax keyword cAnsiName PRIdMAX PRIiPTR PRIu8 PRIx16
syntax keyword cAnsiName PRIdPTR PRIo8 PRIu16 PRIx32
syntax keyword cAnsiName PRIi8 PRIo16 PRIu32 PRIx64

syntax keyword cAnsiName PRIxLEAST8 SCNd8 SCNiFAST32 SCNuLEAST32
syntax keyword cAnsiName PRIxLEAST16 SCNd16 SCNiFAST64 SCNuLEAST64
syntax keyword cAnsiName PRIxLEAST32 SCNd32 SCNiMAX SCNuFAST8
syntax keyword cAnsiName PRIxLEAST64 SCNd64 SCNiPTR SCNuFAST16
syntax keyword cAnsiName PRIxFAST8 SCNdLEAST8 SCNo8 SCNuFAST32
syntax keyword cAnsiName PRIxFAST16 SCNdLEAST16 SCNo16 SCNuFAST64
syntax keyword cAnsiName PRIxFAST32 SCNdLEAST32 SCNo32 SCNuMAX
syntax keyword cAnsiName PRIxFAST64 SCNdLEAST64 SCNo64 SCNuPTR
syntax keyword cAnsiName PRIxMAX SCNdFAST8 SCNoLEAST8 SCNx8
syntax keyword cAnsiName PRIxPTR SCNdFAST16 SCNoLEAST16 SCNx16
syntax keyword cAnsiName PRIX8 SCNdFAST32 SCNoLEAST32 SCNx32
syntax keyword cAnsiName PRIX16 SCNdFAST64 SCNoLEAST64 SCNx64
syntax keyword cAnsiName PRIX32 SCNdMAX SCNoFAST8 SCNxLEAST8
syntax keyword cAnsiName PRIX64 SCNdPTR SCNoFAST16 SCNxLEAST16
syntax keyword cAnsiName PRIXLEAST8 SCNi8 SCNoFAST32 SCNxLEAST32
syntax keyword cAnsiName PRIXLEAST16 SCNi16 SCNoFAST64 SCNxLEAST64
syntax keyword cAnsiName PRIXLEAST32 SCNi32 SCNoMAX SCNxFAST8
syntax keyword cAnsiName PRIXLEAST64 SCNi64 SCNoPTR SCNxFAST16
syntax keyword cAnsiName PRIXFAST8 SCNiLEAST8 SCNu8 SCNxFAST32
syntax keyword cAnsiName PRIXFAST16 SCNiLEAST16 SCNu16 SCNxFAST64
syntax keyword cAnsiName PRIXFAST32 SCNiLEAST32 SCNu32 SCNxMAX
syntax keyword cAnsiName PRIXFAST64 SCNiLEAST64 SCNu64 SCNxPTR
syntax keyword cAnsiName PRIXMAX SCNiFAST8 SCNuLEAST8
syntax keyword cAnsiName PRIXPTR SCNiFAST16 SCNuLEAST16

syntax keyword cAnsiName errno environ

syntax keyword cAnsiName STDC CX_LIMITED_RANGE
syntax keyword cAnsiName STDC FENV_ACCESS
syntax keyword cAnsiName STDC FP_CONTRACT

syntax keyword cAnsiName and bitor not_eq xor
syntax keyword cAnsiName and_eq compl or xor_eq
syntax keyword cAnsiName bitand not or_eq
" -------------------------------------------------- }}}

highlight default link cAnsiFunction cFunction
highlight default link cAnsiName cIdentifier

" Operators
syntax match cPointer  "*"
syntax match cOperator "\(<<\|>>\|[-+*/%&^|<>!=]\)="
syntax match cOperator "<<\|>>\|&&\|||\|++\|--\|->"
syntax match cOperator "[.!~&%<>^|=,+-]"
syntax match cOperator "/[^/*=]"me=e-1
syntax match cOperator "/$"
syntax match cOperator "&&\|||"
syntax match cBrackets "[][]"
syntax match cNotOprtr "!=\|!"
syntax match cAddress  "&[a-zA-Z]"me=e-1

syntax match cMultiply "\([a-zA-Z0-9]\)\@<=\*\ze[a-zA-Z0-9]\|\s\zs\*\ze\s"
highlight default link cMultiply cOperator

" Preprocs
syntax keyword cDefined defined contained containedin=cDefine
highlight default link cDefined cDefine

" Functions
syntax match cUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=cType,cDelimiter,cDefine
syntax match cUserFunctionPointer "(\s*\*\s*\h\w*\s*)\(\s\|\n\)*(" contains=cDelimiter,cOperator

highlight default link cUserFunction cFunction
highlight default link cUserFunctionPointer cFunction

" Delimiters
syntax match cDelimiter "[();\\]"
" foldmethod=syntax fix, courtesy of Ivan Freitas
syntax match cBraces display "[{}]"


" Booleans
syntax keyword cBoolean true false TRUE FALSE

" Structs
syntax match cStructName "\(struct\s\)\@<=\h\w*"


" Links
highlight default link cFunction Function
highlight default link cIdentifier Identifier
highlight default link cDelimiter Delimiter
" foldmethod=syntax fix, courtesy of Ivan Freitas
highlight default link cBraces Delimiter
highlight default link cBoolean Boolean
