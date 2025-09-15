package backend

import sdl "vendor:sdl2"
import "core:fmt"

main_window_title :: "~ psi_editor ~"
initial_width 	:: 800
initial_height 	:: 600

state_context :: struct {
	Window	: ^sdl.Window,
	Event		: sdl.Event,
}

Init :: proc() -> state_context {
	ctx : state_context

	sdl.Init({.VIDEO ,.EVENTS })

	ctx.Window = sdl.CreateWindow(
		main_window_title,
		sdl.WINDOWPOS_UNDEFINED,
		sdl.WINDOWPOS_UNDEFINED,
		initial_width,
		initial_height,
		{ .SHOWN , .RESIZABLE}
	)
	if  ctx.Window == nil  {
		error : string = sdl.GetErrorString()
		fmt.println("ERROR : %s", error)
		return ctx
	}
	return ctx 
}

De_Init :: proc ( ctx : ^state_context ) {
	sdl.DestroyWindow( ctx^.Window )
	sdl.Quit()
}
