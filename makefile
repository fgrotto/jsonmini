CFLAGS := -std=c2x \
	-O2 \
	-Wall \
	-Wextra \
	-Werror \
	-fdiagnostics-color=always \
	-fsanitize=address,undefined \
	-fno-common \
	-Winit-self \
	-Wfloat-equal \
	-Wundef \
	-Wshadow \
	-Wpointer-arith \
	-Wcast-align \
	-Wstrict-prototypes \
	-Wstrict-overflow=5 \
	-Wwrite-strings \
	-Waggregate-return \
	-Wcast-qual \
	-Wswitch-default \
	-Wno-discarded-qualifiers \
	-Wno-aggregate-return

FILES := $(shell find . -name "*.c")
FORMAT_FILES := $(shell find . -name "*.c" -o -name "*.h")

build:
	$(CC) $(CFLAGS) $(FILES) -o jsonmini

format:
	clang-format -i $(FORMAT_FILES)

analyze:
	clang-tidy $(FILES) -- $(CFLAGS)

test:
	./jsonmini

clean:
	rm -f jsonmini
