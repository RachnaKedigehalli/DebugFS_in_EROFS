# SPDX-License-Identifier: GPL-2.0-only
obj-m += erofs.o
erofs-objs := super.o inode.o data.o namei.o dir.o utils.o pcpubuf.o sysfs.o
erofs-y += xattr.o
erofs-y += decompressor.o zmap.o zdata.o
PWD=$(shell pwd)
KERNEL=$(shell uname -r)

EXTRA_CFLAGS += -I'$(PWD)' -Werror -Wall \
                -Wno-missing-braces -Wno-error=unused-function
USER_LIBS= -lz

all:
	make CC=/usr/bin/x86_64-linux-gnu-gcc -C /usr/src/linux-headers-$(KERNEL)/ M=$(PWD) modules LDFLAGS="-L/lib/x86_64-linux-gnu" -lz

clean:
	make CC=/usr/bin/x86_64-linux-gnu-gcc -C /usr/src/linux-headers-$(KERNEL)/ M=$(PWD) clean
