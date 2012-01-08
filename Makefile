# Makefile -- Blink program makefile
# Copyright 2000 Free Software Foundation, Inc.
# Written by Stephane Carrez (stcarrez@worldnet.fr)
# 
# This file is part of GTAM.
# 
# GTAM is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.
# 
# GTAM is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with GTAM; see the file COPYING.  If not, write to
# the Free Software Foundation, 59 Temple Place - Suite 330,
# Boston, MA 02111-1307, USA.  */
#
SRCDIR=c:/gel

GEL_BASEDIR=$(SRCDIR)

# Use the cme11 board configuration files (compilation flags
# and specific includes).
override TARGET_BOARD=m68hc11-corey

include $(GEL_BASEDIR)/config/make.defs

LDFLAGS += -Wl,-defsym,_io_ports=0x1000

CSRCS=blink.c

OBJS=$(CSRCS:.c=.o)

PROGS=blink.elf

all::	$(PROGS) blink.s19

blink.elf:	$(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS)

install::	$(PROGS)
	$(INSTALL) $(PROGS) $(GEL_INSTALL_BIN)
