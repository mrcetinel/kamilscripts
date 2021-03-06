" Kamil Cukrowski C syntax file

if 0
" List extracted from https://port70.net/~nsz/c/c11/n1570.html#7.3.9.3
" From Annex by
let standardcfuns = [
	\ 'assert', 'cacos', 'cacosf', 'cacosl', 'casin', 'casinf', 'casinl', 'catan', 'catanf', 'catanl', 'ccos', 'ccosf', 'ccosl', 'csin', 'csinf',
	\ 'csinl', 'ctan', 'ctanf', 'ctanl', 'cacosh', 'cacoshf', 'cacoshl', 'casinh', 'casinhf', 'casinhl', 'catanh', 'catanhf', 'catanhl', 'ccosh',
	\ 'ccoshf', 'ccoshl', 'csinh', 'csinhf', 'csinhl', 'ctanh', 'ctanhf', 'ctanhl', 'cexp', 'cexpf', 'cexpl', 'clog', 'clogf', 'clogl', 'cabs',
	\ 'cabsf', 'cabsl', 'cpow', 'cpowf', 'cpowl', 'csqrt', 'csqrtf', 'csqrtl', 'carg', 'cargf', 'cargl', 'cimag', 'cimagf', 'cimagl', 'CMPLX',
	\ 'CMPLXF', 'CMPLXL', 'conj', 'conjf', 'conjl', 'cproj', 'cprojf', 'cprojl', 'creal', 'crealf', 'creall', 'isalnum', 'isalpha', 'isblank',
	\ 'iscntrl', 'isdigit', 'isgraph', 'islower', 'isprint', 'ispunct', 'isspace', 'isupper', 'isxdigit', 'tolower', 'toupper', 'feclearexcept',
	\ 'fegetexceptflag', 'feraiseexcept', 'fesetexceptflag', 'fetestexcept', 'fegetround', 'fesetround', 'fegetenv', 'feholdexcept',
	\ 'fesetenv', 'feupdateenv', 'imaxabs', 'imaxdiv', 'strtoimax', 'strtoumax', 'wcstoimax', 'wcstoumax', 'setlocale', 'localeconv',
	\ 'fpclassify', 'isfinite', 'isinf', 'isnan', 'isnormal', 'signbit', 'acos', 'acosf', 'acosl', 'asin', 'asinf', 'asinl', 'atan', 'atanf',
	\ 'atanl', 'atan2', 'atan2f', 'atan2l', 'cos', 'cosf', 'cosl', 'sin', 'sinf', 'sinl', 'tan', 'tanf', 'tanl', 'acosh', 'acoshf', 'acoshl', 'asinh',
	\ 'asinhf', 'asinhl', 'atanh', 'atanhf', 'atanhl', 'cosh', 'coshf', 'coshl', 'sinh', 'sinhf', 'sinhl', 'tanh', 'tanhf', 'tanhl', 'exp', 'expf',
	\ 'expl', 'exp2', 'exp2f', 'exp2l', 'expm1', 'expm1f', 'expm1l', 'frexp', 'frexpf', 'frexpl', 'ilogb', 'ilogbf', 'ilogbl', 'ldexp', 'ldexpf',
	\ 'ldexpl', 'log', 'logf', 'logl', 'log10', 'log10f', 'log10l', 'log1p', 'log1pf', 'log1pl', 'log2', 'log2f', 'log2l', 'logb', 'logbf', 'logbl',
	\ 'modf', 'modff', 'modfl', 'scalbn', 'scalbnf', 'scalbnl', 'scalbln', 'scalblnf', 'scalblnl', 'cbrt', 'cbrtf', 'cbrtl', 'fabs', 'fabsf',
	\ 'fabsl', 'hypot', 'hypotf', 'hypotl', 'pow', 'powf', 'powl', 'sqrt', 'sqrtf', 'sqrtl', 'erf', 'erff', 'erfl', 'erfc', 'erfcf', 'erfcl', 'lgamma',
	\ 'lgammaf', 'lgammal', 'tgamma', 'tgammaf', 'tgammal', 'ceil', 'ceilf', 'ceill', 'floor', 'floorf', 'floorl', 'nearbyint', 'nearbyintf',
	\ 'nearbyintl', 'rint', 'rintf', 'rintl', 'lrint', 'lrintf', 'lrintl', 'llrint', 'llrintf', 'llrintl', 'round', 'roundf', 'roundl', 'lround',
	\ 'lroundf', 'lroundl', 'llround', 'llroundf', 'llroundl', 'trunc', 'truncf', 'truncl', 'fmod', 'fmodf', 'fmodl', 'remainder', 'remainderf',
	\ 'remainderl', 'remquo', 'remquof', 'remquol', 'copysign', 'copysignf', 'copysignl', 'nan', 'nanf', 'nanl', 'nextafter', 'nextafterf',
	\ 'nextafterl', 'nexttoward', 'nexttowardf', 'nexttowardl', 'fdim', 'fdimf', 'fdiml', 'fmax', 'fmaxf', 'fmaxl', 'fmin', 'fminf', 'fminl', 'fma',
	\ 'fmaf', 'fmal', 'isgreater', 'isgreaterequal', 'isless', 'islessequal', 'islessgreater', 'isunordered', 'setjmp', 'longjmp', 'signal',
	\ 'raise', 'va_arg', 'va_copy', 'va_end', 'va_start', 'ATOMIC_VAR_INIT', 'atomic_init', 'kill_dependency', 'atomic_thread_fence',
	\ 'atomic_signal_fence', 'atomic_is_lock_free', 'atomic_store', 'atomic_store_explicit', 'atomic_load', 'atomic_load_explicit',
	\ 'atomic_exchange', 'atomic_exchange_explicit', 'atomic_compare_exchange_strong', 'atomic_compare_exchange_strong_explicit',
	\ 'atomic_compare_exchange_weak', 'atomic_compare_exchange_weak_explicit', 'atomic_fetch_key', 'atomic_fetch_key_explicit',
	\ 'atomic_flag_test_and_set', 'atomic_flag_test_and_set_explicit', 'atomic_flag_clear', 'atomic_flag_clear_explicit',
	\ 'offsetof', 'INT8_C', 'UINT8_C', 'INT16_C', 'UINT16_C', 'INT32_C', 'UINT32_C', 'INT64_C', 'UINT64_C', 
	\ 'INTMAX_C', 'UINTMAX_C', 'remove', 'rename', 'tmpfile', 'tmpnam', 'fclose', 'fflush', 'fopen', 'freopen',
	\ 'setbuf', 'setvbuf', 'fprintf', 'fscanf', 'printf', 'scanf', 'snprintf', 'sprintf', 'sscanf', 'vfprintf', 'vfscanf', 'vprintf', 'vscanf',
	\ 'vsnprintf', 'vsprintf', 'vsscanf', 'fgetc', 'fgets', 'fputc', 'fputs', 'getc', 'getchar', 'putc', 'putchar', 'puts', 'ungetc', 'fread', 'fwrite',
	\ 'fgetpos', 'fseek', 'fsetpos', 'ftell', 'rewind', 'clearerr', 'feof', 'ferror', 'perror', 'tmpfile_s', 'tmpnam_s', 'fopen_s', 'freopen_s',
	\ 'fprintf_s', 'fscanf_s', 'printf_s', 'scanf_s', 'snprintf_s', 'sprintf_s', 'sscanf_s', 'vfprintf_s', 'vfscanf_s', 'vprintf_s', 'vscanf_s',
	\ 'vsnprintf_s', 'vsprintf_s', 'vsscanf_s', 'gets_s', 'atof', 'atoi', 'atol', 'atoll', 'strtod', 'strtof', 'strtold', 'strtol', 'strtoll',
	\ 'strtoul', 'strtoull', 'rand', 'srand', 'aligned_alloc', 'calloc', 'free', 'malloc', 'realloc', 'abort', 'atexit', 'at_quick_exit', 'exit',
	\ '_Exit', 'getenv', 'quick_exit', 'system', 'bsearch', 'qsort', 'abs', 'labs', 'llabs', 'div', 'ldiv', 'lldiv', 'mblen', 'mbtowc', 'wctomb',
	\ 'mbstowcs', 'wcstombs', 'set_constraint_handler_s', 'abort_handler_s', 'ignore_handler_s', 'getenv_s', 'bsearch_s', 'qsort_s',
	\ 'wctomb_s', 'mbstowcs_s', 'wcstombs_s', 'memcpy', 'memmove', 'strcpy', 'strncpy', 'strcat', 'strncat', 'memcmp', 'strcmp', 'strcoll',
	\ 'strncmp', 'strxfrm', 'memchr', 'strchr', 'strcspn', 'strpbrk', 'strrchr', 'strspn', 'strstr', 'strtok', 'memset', 'strerror', 'strlen',
	\ 'memcpy_s', 'memmove_s', 'strcpy_s', 'strncpy_s', 'strcat_s', 'strncat_s', 'strtok_s', 'memset_s', 'strerror_s', 'strerrorlen_s',
	\ 'strnlen_s', 'call_once', 'cnd_broadcast', 'cnd_destroy', 'cnd_init', 'cnd_signal', 'cnd_timedwait', 'cnd_wait', 'mtx_destroy',
	\ 'mtx_init', 'mtx_lock', 'mtx_timedlock', 'mtx_trylock', 'mtx_unlock', 'thrd_create', 'thrd_current', 'thrd_detach', 'thrd_equal',
	\ 'thrd_exit', 'thrd_join', 'thrd_sleep', 'thrd_yield', 'tss_create', 'tss_delete', 'tss_get', 'tss_set', 'clock', 'difftime', 'mktime',
	\ 'time', 'timespec_get', 'asctime', 'ctime', 'gmtime', 'localtime', 'strftime', 'asctime_s', 'ctime_s', 'gmtime_s', 'localtime_s', 'mbrtoc16',
	\ 'c16rtomb', 'mbrtoc32', 'c32rtomb', 'fwprintf', 'fwscanf', 'swprintf', 'swscanf', 'vfwprintf', 'vfwscanf', 'vswprintf', 'vswscanf', 'vwprintf',
	\ 'vwscanf', 'wprintf', 'wscanf', 'fgetwc', 'fgetws', 'fputwc', 'fputws', 'fwide', 'getwc', 'getwchar', 'putwc', 'putwchar', 'ungetwc', 'wcstod',
	\ 'wcstof', 'wcstold', 'wcstol', 'wcstoll', 'wcstoul', 'wcstoull', 'wcscpy', 'wcsncpy', 'wmemcpy', 'wmemmove', 'wcscat', 'wcsncat', 'wcscmp',
	\ 'wcscoll', 'wcsncmp', 'wcsxfrm', 'wmemcmp', 'wcschr', 'wcscspn', 'wcspbrk', 'wcsrchr', 'wcsspn', 'wcsstr', 'wcstok', 'wmemchr', 'wcslen',
	\ 'wmemset', 'wcsftime', 'btowc', 'wctob', 'mbsinit', 'mbrlen', 'mbrtowc', 'wcrtomb', 'mbsrtowcs', 'wcsrtombs', 'fwprintf_s', 'fwscanf_s',
	\ 'snwprintf_s', 'swprintf_s', 'swscanf_s', 'vfwprintf_s', 'vfwscanf_s', 'vsnwprintf_s', 'vswprintf_s', 'vswscanf_s', 'vwprintf_s',
	\ 'vwscanf_s', 'wprintf_s', 'wscanf_s', 'wcscpy_s', 'wcsncpy_s', 'wmemcpy_s', 'wmemmove_s', 'wcscat_s', 'wcsncat_s', 'wcstok_s', 'wcsnlen_s',
	\ 'wcrtomb_s', 'mbsrtowcs_s', 'wcsrtombs_s', 'iswalnum', 'iswalpha', 'iswblank', 'iswcntrl', 'iswdigit', 'iswgraph', 'iswlower', 'iswprint',
	\ 'iswpunct', 'iswspace', 'iswupper', 'iswxdigit', 'iswctype', 'wctype', 'towlower', 'towupper', 'towctrans', 'wctrans',
	\ ]

" List extracted from POSIX 2018 pdf by smart grepping and sed"
" and removing elements from standard C functions
let posixcfuns = [
	\ 'FD_CLR', 'FD_ISSET', 'FD_SET', 'FD_ZERO', '_exit', '_longjmp', '_setjmp', '_tolower', '_toupper', 'a64l', 'accept', 'access', 'aio_cancel',
	\ 'aio_error', 'aio_fsync', 'aio_read', 'aio_return', 'aio_suspend', 'aio_write', 'alarm', 'alphasort', 'asctime_r', 'basename',
	\ 'bind', 'catclose', 'catgets', 'catopen', 'cfgetispeed', 'cfgetospeed', 'cfsetispeed', 'cfsetospeed', 'chdir', 'chmod', 'chown',
	\ 'clock_getcpuclockid', 'clock_getres', 'clock_gettime', 'clock_nanosleep', 'clock_settime', 'close', 'closedir', 'closelog', 'confstr',
	\ 'connect', 'creat', 'crypt', 'ctermid', 'ctime_r', 'dbm_clearerr', 'dbm_close', 'dbm_delete', 'dbm_error', 'dbm_fetch', 'dbm_firstkey',
	\ 'dbm_nextkey', 'dbm_open', 'dbm_store', 'dirfd', 'dirname', 'dlclose', 'dlerror', 'dlopen', 'dlsym', 'dprintf', 'drand48', 'dup', 'dup2',
	\ 'duplocale', 'encrypt', 'endgrent', 'endhostent', 'endnetent', 'endprotoent', 'endpwent', 'endservent', 'endutxent', 'erand48',
	\ 'execl', 'execle', 'execlp', 'execv', 'execve', 'execvp', 'faccessat', 'fattach', 'fchdir', 'fchmod', 'fchmodat', 'fchown', 'fchownat',
	\ 'fcntl', 'fdatasync', 'fdetach', 'fdopen', 'fdopendir', 'fexecve', 'ffs', 'fileno', 'flockfile', 'fmemopen', 'fmtmsg', 'fnmatch',
	\ 'fork', 'fpathconf', 'freeaddrinfo', 'freelocale', 'fseeko', 'fstat', 'fstatat', 'fstatvfs', 'fsync', 'ftello', 'ftok', 'ftruncate',
	\ 'ftrylockfile', 'ftw', 'funlockfile', 'futimens', 'gai_strerror', 'getaddrinfo', 'getc_unlocked', 'getchar_unlocked', 'getcwd',
	\ 'getdate', 'getdelim', 'getegid', 'geteuid', 'getgid', 'getgrent', 'getgrgid', 'getgrgid_r', 'getgrnam', 'getgrnam_r', 'getgroups',
	\ 'gethostent', 'gethostid', 'gethostname', 'getitimer', 'getline', 'getlogin', 'getlogin_r', 'getmsg', 'getnameinfo', 'getnetbyaddr',
	\ 'getnetbyname', 'getnetent', 'getopt', 'getpeername', 'getpgid', 'getpgrp', 'getpid', 'getpmsg', 'getppid', 'getpriority', 'getprotobyname',
	\ 'getprotobynumber', 'getprotoent', 'getpwent', 'getpwnam', 'getpwnam_r', 'getpwuid', 'getpwuid_r', 'getrlimit', 'getrusage', 'gets',
	\ 'getservbyname', 'getservbyport', 'getservent', 'getsid', 'getsockname', 'getsockopt', 'getsubopt', 'gettimeofday', 'getuid',
	\ 'getutxent', 'getutxid', 'getutxline', 'glob', 'globfree', 'gmtime_r', 'grantpt', 'hcreate', 'hdestroy', 'hsearch', 'htonl', 'htons',
	\ 'iconv', 'iconv_close', 'iconv_open', 'if_freenameindex', 'if_indextoname', 'if_nameindex', 'if_nametoindex', 'inet_addr',
	\ 'inet_ntoa', 'inet_ntop', 'inet_pton', 'initstate', 'insque', 'int', 'ioctl', 'isalnum_l', 'isalpha_l', 'isascii', 'isastream',
	\ 'isatty', 'isblank_l', 'iscntrl_l', 'isdigit_l', 'isgraph_l', 'islower_l', 'isprint_l', 'ispunct_l', 'isspace_l', 'isupper_l',
	\ 'iswalnum_l', 'iswalpha_l', 'iswblank_l', 'iswcntrl_l', 'iswctype_l', 'iswdigit_l', 'iswgraph_l', 'iswlower_l', 'iswprint_l',
	\ 'iswpunct_l', 'iswspace_l', 'iswupper_l', 'iswxdigit_l', 'isxdigit_l', 'j0', 'j1', 'jn', 'jrand48', 'kill', 'killpg', 'l64a', 'lchown',
	\ 'lcong48', 'lfind', 'link', 'linkat', 'lio_listio', 'listen', 'lockf', 'lrand48', 'lsearch', 'lseek', 'lstat', 'mbsnrtowcs', 'memccpy',
	\ 'mkdir', 'mkdirat', 'mkdtemp', 'mkfifo', 'mkfifoat', 'mknod', 'mknodat', 'mkstemp', 'mlock', 'mlockall', 'mmap', 'mprotect', 'mq_close',
	\ 'mq_getattr', 'mq_notify', 'mq_open', 'mq_receive', 'mq_send', 'mq_setattr', 'mq_timedreceive', 'mq_timedsend', 'mq_unlink',
	\ 'mrand48', 'msgctl', 'msgget', 'msgrcv', 'msgsnd', 'msync', 'munlock', 'munlockall', 'munmap', 'nanosleep', 'newlocale', 'nftw', 'nice',
	\ 'nl_langinfo', 'nl_langinfo_l', 'nrand48', 'ntohl', 'ntohs', 'open', 'open_memstream', 'open_wmemstream', 'openat', 'opendir', 'openlog',
	\ 'pathconf', 'pause', 'pclose', 'pipe', 'poll', 'popen', 'posix_fadvise', 'posix_fallocate', 'posix_madvise', 'posix_mem_offset',
	\ 'posix_memalign', 'posix_openpt', 'posix_spawn', 'posix_spawn_file_actions_addclose', 'posix_spawn_file_actions_adddup2',
	\ 'posix_spawn_file_actions_addopen', 'posix_spawn_file_actions_destroy', 'posix_spawn_file_actions_init',
	\ 'posix_spawnattr_destroy', 'posix_spawnattr_getflags', 'posix_spawnattr_getpgroup', 'posix_spawnattr_getschedparam',
	\ 'posix_spawnattr_getschedpolicy', 'posix_spawnattr_getsigdefault', 'posix_spawnattr_getsigmask', 'posix_spawnattr_init',
	\ 'posix_spawnattr_setflags', 'posix_spawnattr_setpgroup', 'posix_spawnattr_setschedparam', 'posix_spawnattr_setschedpolicy',
	\ 'posix_spawnattr_setsigdefault', 'posix_spawnattr_setsigmask', 'posix_spawnp', 'posix_trace_attr_destroy',
	\ 'posix_trace_attr_getclockres', 'posix_trace_attr_getcreatetime', 'posix_trace_attr_getgenversion',
	\ 'posix_trace_attr_getinherited', 'posix_trace_attr_getlogfullpolicy', 'posix_trace_attr_getlogsize',
	\ 'posix_trace_attr_getmaxdatasize', 'posix_trace_attr_getmaxsystemeventsize', 'posix_trace_attr_getmaxusereventsize',
	\ 'posix_trace_attr_getname', 'posix_trace_attr_getstreamfullpolicy', 'posix_trace_attr_getstreamsize', 'posix_trace_attr_init',
	\ 'posix_trace_attr_setinherited', 'posix_trace_attr_setlogfullpolicy', 'posix_trace_attr_setlogsize',
	\ 'posix_trace_attr_setmaxdatasize', 'posix_trace_attr_setname', 'posix_trace_attr_setstreamfullpolicy',
	\ 'posix_trace_attr_setstreamsize', 'posix_trace_clear', 'posix_trace_close', 'posix_trace_create', 'posix_trace_create_withlog',
	\ 'posix_trace_event', 'posix_trace_eventid_equal', 'posix_trace_eventid_get_name', 'posix_trace_eventid_open',
	\ 'posix_trace_eventset_add', 'posix_trace_eventset_del', 'posix_trace_eventset_empty', 'posix_trace_eventset_fill',
	\ 'posix_trace_eventset_ismember', 'posix_trace_eventtypelist_getnext_id', 'posix_trace_eventtypelist_rewind',
	\ 'posix_trace_flush', 'posix_trace_get_attr', 'posix_trace_get_filter', 'posix_trace_get_status', 'posix_trace_getnext_event',
	\ 'posix_trace_open', 'posix_trace_rewind', 'posix_trace_set_filter', 'posix_trace_shutdown', 'posix_trace_start',
	\ 'posix_trace_stop', 'posix_trace_timedgetnext_event', 'posix_trace_trid_eventid_open', 'posix_trace_trygetnext_event',
	\ 'posix_typed_mem_get_info', 'posix_typed_mem_open', 'pread', 'pselect', 'psiginfo', 'psignal', 'pthread_atfork',
	\ 'pthread_attr_destroy', 'pthread_attr_getdetachstate', 'pthread_attr_getguardsize', 'pthread_attr_getinheritsched',
	\ 'pthread_attr_getschedparam', 'pthread_attr_getschedpolicy', 'pthread_attr_getscope', 'pthread_attr_getstack',
	\ 'pthread_attr_getstacksize', 'pthread_attr_init', 'pthread_attr_setdetachstate', 'pthread_attr_setguardsize',
	\ 'pthread_attr_setinheritsched', 'pthread_attr_setschedparam', 'pthread_attr_setschedpolicy', 'pthread_attr_setscope',
	\ 'pthread_attr_setstack', 'pthread_attr_setstacksize', 'pthread_barrier_destroy', 'pthread_barrier_init',
	\ 'pthread_barrier_wait', 'pthread_barrierattr_destroy', 'pthread_barrierattr_getpshared', 'pthread_barrierattr_init',
	\ 'pthread_barrierattr_setpshared', 'pthread_cancel', 'pthread_cleanup_pop', 'pthread_cleanup_push', 'pthread_cond_broadcast',
	\ 'pthread_cond_destroy', 'pthread_cond_init', 'pthread_cond_signal', 'pthread_cond_timedwait', 'pthread_cond_wait',
	\ 'pthread_condattr_destroy', 'pthread_condattr_getclock', 'pthread_condattr_getpshared', 'pthread_condattr_init',
	\ 'pthread_condattr_setclock', 'pthread_condattr_setpshared', 'pthread_create', 'pthread_detach', 'pthread_equal', 'pthread_exit',
	\ 'pthread_getconcurrency', 'pthread_getcpuclockid', 'pthread_getschedparam', 'pthread_getspecific', 'pthread_join',
	\ 'pthread_key_create', 'pthread_key_delete', 'pthread_kill', 'pthread_mutex_consistent', 'pthread_mutex_destroy',
	\ 'pthread_mutex_getprioceiling', 'pthread_mutex_init', 'pthread_mutex_lock', 'pthread_mutex_setprioceiling',
	\ 'pthread_mutex_timedlock', 'pthread_mutex_trylock', 'pthread_mutex_unlock', 'pthread_mutexattr_destroy',
	\ 'pthread_mutexattr_getprioceiling', 'pthread_mutexattr_getprotocol', 'pthread_mutexattr_getpshared',
	\ 'pthread_mutexattr_getrobust', 'pthread_mutexattr_gettype', 'pthread_mutexattr_init', 'pthread_mutexattr_setprioceiling',
	\ 'pthread_mutexattr_setprotocol', 'pthread_mutexattr_setpshared', 'pthread_mutexattr_setrobust', 'pthread_mutexattr_settype',
	\ 'pthread_once', 'pthread_rwlock_destroy', 'pthread_rwlock_init', 'pthread_rwlock_rdlock', 'pthread_rwlock_timedrdlock',
	\ 'pthread_rwlock_timedwrlock', 'pthread_rwlock_tryrdlock', 'pthread_rwlock_trywrlock', 'pthread_rwlock_unlock',
	\ 'pthread_rwlock_wrlock', 'pthread_rwlockattr_destroy', 'pthread_rwlockattr_getpshared', 'pthread_rwlockattr_init',
	\ 'pthread_rwlockattr_setpshared', 'pthread_self', 'pthread_setcancelstate', 'pthread_setcanceltype', 'pthread_setconcurrency',
	\ 'pthread_setschedparam', 'pthread_setschedprio', 'pthread_setspecific', 'pthread_sigmask', 'pthread_spin_destroy',
	\ 'pthread_spin_init', 'pthread_spin_lock', 'pthread_spin_trylock', 'pthread_spin_unlock', 'pthread_testcancel', 'ptsname',
	\ 'putc_unlocked', 'putchar_unlocked', 'putenv', 'putmsg', 'putpmsg', 'pututxline', 'pwrite', 'rand_r', 'random', 'read', 'readdir',
	\ 'readdir_r', 'readlink', 'readlinkat', 'readv', 'realpath', 'recv', 'recvfrom', 'recvmsg', 'regcomp', 'regerror', 'regexec', 'regfree',
	\ 'remque', 'renameat', 'rewinddir', 'rmdir', 'scandir', 'sched_get_priority_max', 'sched_get_priority_min', 'sched_getparam',
	\ 'sched_getscheduler', 'sched_rr_get_interval', 'sched_setparam', 'sched_setscheduler', 'sched_yield', 'seed48', 'seekdir', 'select',
	\ 'sem_close', 'sem_destroy', 'sem_getvalue', 'sem_init', 'sem_open', 'sem_post', 'sem_timedwait', 'sem_trywait', 'sem_unlink', 'sem_wait',
	\ 'semctl', 'semget', 'semop', 'send', 'sendmsg', 'sendto', 'setegid', 'setenv', 'seteuid', 'setgid', 'setgrent', 'sethostent', 'setitimer',
	\ 'setkey', 'setlogmask', 'setnetent', 'setpgid', 'setpgrp', 'setpriority', 'setprotoent', 'setpwent', 'setregid', 'setreuid', 'setrlimit',
	\ 'setservent', 'setsid', 'setsockopt', 'setstate', 'setuid', 'setutxent', 'shm_open', 'shm_unlink', 'shmat', 'shmctl', 'shmdt', 'shmget',
	\ 'shutdown', 'sigaction', 'sigaddset', 'sigaltstack', 'sigdelset', 'sigemptyset', 'sigfillset', 'sighold', 'sigignore', 'siginterrupt',
	\ 'sigismember', 'siglongjmp', 'sigpause', 'sigpending', 'sigprocmask', 'sigqueue', 'sigrelse', 'sigset', 'sigsetjmp', 'sigsuspend',
	\ 'sigtimedwait', 'sigwait', 'sigwaitinfo', 'sleep', 'sockatmark', 'socket', 'socketpair', 'srand48', 'srandom', 'stat', 'statvfs', 'stpcpy',
	\ 'stpncpy', 'strcasecmp', 'strcasecmp_l', 'strcoll_l', 'strdup', 'strerror_l', 'strerror_r', 'strfmon', 'strfmon_l', 'strftime_l',
	\ 'strncasecmp', 'strncasecmp_l', 'strndup', 'strnlen', 'strptime', 'strsignal', 'strxfrm_l', 'swab', 'symlink', 'symlinkat', 'sync',
	\ 'sysconf', 'syslog', 'tcdrain', 'tcflow', 'tcflush', 'tcgetattr', 'tcgetpgrp', 'tcgetsid', 'tcsendbreak', 'tcsetattr', 'tcsetpgrp',
	\ 'tdelete', 'telldir', 'tempnam', 'tfind', 'timer_create', 'timer_delete', 'timer_getoverrun', 'timer_gettime', 'timer_settime',
	\ 'times', 'toascii', 'tolower_l', 'toupper_l', 'towctrans_l', 'towlower_l', 'towupper_l', 'truncate', 'tsearch', 'ttyname', 'ttyname_r',
	\ 'twalk', 'tzset', 'ulimit', 'umask', 'uname', 'unlink', 'unlinkat', 'unlockpt', 'unsetenv', 'uselocale', 'utime', 'utimensat', 'utimes',
	\ 'wait', 'waitid', 'waitpid', 'wcpcpy', 'wcpncpy', 'wcscasecmp', 'wcscasecmp_l', 'wcscoll_l', 'wcsdup', 'wcsncasecmp', 'wcsncasecmp_l',
	\ 'wcsnlen', 'wcsnrtombs', 'wcswidth', 'wcsxfrm_l', 'wctrans_l', 'wctype_l', 'wcwidth', 'wordexp', 'wordfree', 'write', 'writev',
	\ 'y0', 'y1', 'yn',
	\ ]

" Apply special matching for standard functions
" matchadd is used because vim-lsp-cxx-highlight also uses matchadd, and I
" want KcStandardCFuncs to match _above_ vim-lsp
for i in standardcfuns
	call matchadd('KcStandardCFuncs', '\<'.i.'\>', 1)
endfor
for i in posixcfuns
	call matchadd('KcStandardCFuncs', '\<'.i.'\>', 1)
endfor
unlet i standardcfuns posixcfuns
endif

" Match only #define string
syn match KcDefine "^\s*\zs\(%:\|#\)\s*\(define\|undef\)\>" containedin=@cDefine
" Match only the \ continuation within a define
syn match KcDefineSlash display "\\" containedin=@cDefine

