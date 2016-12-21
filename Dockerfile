FROM teaci/wine-staging
MAINTAINER Qian Hong <qhong@codeweavers.com>
# Work around https://bugs.wine-staging.com/show_bug.cgi?id=682
RUN wget http://security.ubuntu.com/ubuntu/pool/main/f/freetype/libfreetype6_2.5.2-1ubuntu2_i386.deb && wget http://security.ubuntu.com/ubuntu/pool/main/f/freetype/libfreetype6_2.5.2-1ubuntu2_amd64.deb && dpkg -i libfreetype6_2.5.2-1ubuntu2_amd64.deb libfreetype6_2.5.2-1ubuntu2_i386.deb
# Work around https://bugs.wine-staging.com/show_bug.cgi?id=626
ENV WINPTY_SHOW_CONSOLE 1

COPY msys2-env /etc/
COPY msys2-shell /usr/bin/
COPY msys2-rebase /usr/bin/
COPY msys2-init /usr/bin/
COPY msys32 /usr/bin/
COPY msys64 /usr/bin/
COPY mingw32 /usr/bin/
COPY mingw64 /usr/bin/

ENV MSYS_ARCH 32
RUN msys2-init
