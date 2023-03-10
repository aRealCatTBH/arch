arch = "$(uname -m)";
if["$arch" = "x86_64"];
then arch = "amd64";
elif["$arch" = "armv7l"];
then arch = "arm";
elif["$arch" = "aarch64"];
then arch = "arm64";
else
echo "Unsupported arch: $arch" > &2;
fi;
if getconf
  GNU_LIBC_VERSION > /dev / null;
then libc_postfix = "";
elif["$(ldd 2>&1|head -c 9)" = "musl libc"];
then libc_postfix = "-musl";
elif["$(find /lib/libc.musl*|wc -l)"];
then libc_postfix = "-musl";
else
echo "Unsupported libc" > &2;
fi;
echo "$arch$libc_postfix"
