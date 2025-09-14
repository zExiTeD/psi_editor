package main

import "core:fmt"
import sdl "vendor:sdl2"

main :: proc () {

	sdl.Init({.VIDEO ,.EVENTS })
	defer sdl.Quit()

	Window : ^sdl.Window = sdl.CreateWindow(
		"~ MAIN ~",
		sdl.WINDOWPOS_UNDEFINED,
		sdl.WINDOWPOS_UNDEFINED,
		800,
		600,
		{ .SHOWN , .RESIZABLE}
	)
	if  Window == nil  {
		error : string = sdl.GetErrorString()
		fmt.println("ERROR : %s", error)
		return
	}
	defer sdl.DestroyWindow( Window )

	Event : sdl.Event
	main_loop:
	for {

		for sdl.PollEvent(&Event) {
			#partial switch Event.type {
			case .KEYDOWN:
				break main_loop 
			}
		}
	}

}
