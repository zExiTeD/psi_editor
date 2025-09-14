all : src/main.odin
	odin build src/ -out:build/editor.bin

run : build/editor.bin
	./build/editor.bin
