TARGET       := arm-unknown-linux-uclibcgnueabi

all:rtspd

rtspd: rtspd.c librtsp.h
	$(TARGET)-gcc                       \
		-DLOG_USE_COLOR                 \
		-Wall                           \
		-Igm_lib/inc                    \
		-Lgm_lib/lib                    \
		-lpthread -lm -lrt -lgm         \
		-o $@                           \
                rtspd.c librtsp.a
	$(TARGET)-strip $@
