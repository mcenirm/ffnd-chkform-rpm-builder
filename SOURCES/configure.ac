AC_INIT([freeform-nd], [8.8.3])
AC_CONFIG_MACRO_DIR([m4])
LT_INIT
AM_INIT_AUTOMAKE

AC_PROG_CC

case "$host" in
    *linux*) CFLAGS="$CFLAGS -DLINUX" ;;
    *hp*)    CFLAGS="$CFLAGS -DHP9000" ;;
    *alpha*) CFLAGS="$CFLAGS -DDEC_ALPHA" ;;
    *sun*)   CFLAGS="$CFLAGS -DSUN" ;;
    *darwin*)   CFLAGS="$CFLAGS -DLINUX" ;;
    *sgi*)   if test $ac_cv_sizeof_long -eq 4
             then
                 CFLAGS="$CFLAGS -DIRIS4"
             else
                 CFLAGS="$CFLAGS -DIRIX"
             fi ;;
    *)       echo "Either this machine is not supported by FreeForm or"
             echo "the configure script needs to be fixed" ;;
esac

AC_OUTPUT([Makefile])
