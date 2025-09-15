package main

import sdl "vendor:sdl2"
import "backend"
import "editor"


main :: proc () {
	
	editor.from_editor()

	ctx :=	backend.Init()
	defer backend.De_Init( &ctx )

	main_loop:
	for {
		for sdl.PollEvent(&ctx.Event) {
			#partial switch ctx.Event.type {
			case .KEYDOWN:
				break main_loop 
			}
		}
	}

}
