/*
Package core contains most general constants, structs and enums that are needed for procs
*/
package core

import "core:fmt"
import "core:os"

import "vendor:sdl2"

undefinedWindowPos :: sdl2.WINDOWPOS_UNDEFINED
centeredWindowPos :: sdl2.WINDOWPOS_CENTERED
window :: struct {
    using Window: ^sdl2.Window,
}
renderer :: struct {
    using Renderer: ^sdl2.Renderer,
}
window_context :: enum {
    opengl,
    vulkan,
    metal,
}
extra_window_flags :: enum {
    fullscreen,
    hidden,
    borderless,
    resizable,
    minimized,
    maximized,
}
renderer_flags :: enum {
    software,
    accelerated,
    vsync,
    targetTexture,
}
