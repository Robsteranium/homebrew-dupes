require 'formula'

class Zlib < Formula
  homepage 'http://www.zlib.net/'
  url 'http://zlib.net/zlib-1.2.7.tar.gz'
  md5 '60df6a37c56e7c1366cca812414f7b85'

  keg_only :provided_by_osx

  def patches; DATA end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end

# /usr/bin/libtool is no use to CLT-less rigs
__END__
diff --git a/configure b/configure
index 36c7d8e..0c97d7b 100755
--- a/configure
+++ b/configure
@@ -231,7 +231,7 @@ if test "$gcc" -eq 1 && ($cc -c $cflags $test.c) >> configure.log 2>&1; then
              SHAREDLIBV=libz.$VER$shared_ext
              SHAREDLIBM=libz.$VER1$shared_ext
              LDSHARED=${LDSHARED-"$cc -dynamiclib -install_name $libdir/$SHAREDLIBM -compatibility_version $VER1 -current_version $VER3"}
-             AR="/usr/bin/libtool"
+             AR="libtool"
              ARFLAGS="-o" ;;
   *)             LDSHARED=${LDSHARED-"$cc -shared"} ;;
   esac
