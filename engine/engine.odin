/*
Package engine contains the most common functions for making any game, such as Exit(), CreateWindow(), and CreateRenderContext()
*/
package engine

import "internal/assets"
import "internal/ui"
import "internal/core"
import "core:strings"
import "vendor:sdl2"
<<<<<<< Updated upstream

Exit :: proc(w: ^core.window, r: ^core.renderer) {
    DestroyRenderer(r)
    DestroyWindow(w)
=======
import img "vendor:sdl2/image"
///Exits the application, running the core.ExitProc and destroying the given windows and renderers in the process.
Exit :: proc(w: [dynamic]^core.window, r: [dynamic]^core.renderer) {
    core.ExitProc()
    for win in w {
        DestroyWindow(win)
    }
    for ren in r {
        DestroyRenderer(ren)
    }
>>>>>>> Stashed changes
    sdl2.Quit()
}
GetError :: proc() -> string{
    return sdl2.GetErrorString()
}
<<<<<<< Updated upstream
CreateWindow :: proc(title: string, x, y, width, height: int, renderer: core.window_context = .opengl, extra_flags: []core.extra_window_flags = {core.extra_window_flags.resizable}) -> core.window {
=======
///Creates a window with the given title, size and flags
CreateWindowNoRenderer :: proc(title: string, x, y, width, height: int, renderer: core.window_context = .opengl, extraFlags: []core.extra_window_flags = {core.extra_window_flags.resizable}) -> core.window {
>>>>>>> Stashed changes
    r: sdl2.WindowFlags
    switch renderer {
        case .opengl:
            r = sdl2.WINDOW_OPENGL
        case .metal:
            r = sdl2.WINDOW_METAL
        case .vulkan:
            r = sdl2.WINDOW_VULKAN
    }
    if len(extra_flags) > 0 {
        for f in extra_flags {
            switch f {
                case .fullscreen:
                    r = r | sdl2.WINDOW_FULLSCREEN
                case .hidden:
                    r = r | sdl2.WINDOW_HIDDEN
                case .borderless:
                    r = r | sdl2.WINDOW_BORDERLESS
                case .resizable:
                    r = r | sdl2.WINDOW_RESIZABLE
                case .minimized:
                    r = r | sdl2.WINDOW_MINIMIZED
                case .maximized:
                    r = r | sdl2.WINDOW_MAXIMIZED
            }
        }
    }
    x := sdl2.CreateWindow(strings.clone_to_cstring(title), cast(i32)x, cast(i32)y, cast(i32)width, cast(i32)height, r)
    if x == nil {
        panic("Failed to create window")
    }
    win := core.window{x, len(core.AllWindows)+1}
    append(&core.AllWindows, &win)
    return win

}

CreateRenderContext :: proc(w: ^core.window, flags: []core.renderer_flags = {core.renderer_flags.accelerated}, index: i32 = -1) -> core.renderer {
    r: sdl2.RendererFlags
    if len(flags) > 0 {
        for f in flags {
            switch f {
                case .software:
                    r = r | sdl2.RENDERER_SOFTWARE
                case .accelerated:
                    r = r | sdl2.RENDERER_ACCELERATED
                case .vsync:
                    r = r | sdl2.RENDERER_PRESENTVSYNC
                case .targetTexture:
                    r = r | sdl2.RENDERER_TARGETTEXTURE
            }
        }
    }
    x := sdl2.CreateRenderer(w, index, r)
    if x == nil {
        panic("Failed to create renderer")
    }
    ren := core.renderer{x, len(core.AllRenderers)+1}
    append(&core.AllRenderers, &ren)
    return ren

}
<<<<<<< Updated upstream
=======
///Creates both a window and implicitly a renderer for the window
CreateWindow :: proc(title: string, x, y, width, height: int, renderer: core.window_context = .opengl, extraWindowFlags: []core.extra_window_flags = {core.extra_window_flags.resizable}, renderFlags: []core.renderer_flags = {core.renderer_flags.accelerated}, renderIndex: i32 = -1) -> (core.window, core.renderer) {
    wf: sdl2.WindowFlags
    switch renderer {
        case .opengl:
            wf = sdl2.WINDOW_OPENGL
        case .metal:
            wf = sdl2.WINDOW_METAL
        case .vulkan:
            wf = sdl2.WINDOW_VULKAN
    }
    if len(extraWindowFlags) > 0 {
        for f in extraWindowFlags {
            switch f {
                case .fullscreen:
                    wf = wf | sdl2.WINDOW_FULLSCREEN
                case .hidden:
                    wf = wf | sdl2.WINDOW_HIDDEN
                case .borderless:
                    wf = wf | sdl2.WINDOW_BORDERLESS
                case .resizable:
                    wf = wf | sdl2.WINDOW_RESIZABLE
                case .minimized:
                    wf = wf | sdl2.WINDOW_MINIMIZED
                case .maximized:
                    wf = wf | sdl2.WINDOW_MAXIMIZED
            }
        }
    }
    w := sdl2.CreateWindow(strings.clone_to_cstring(title), cast(i32)x, cast(i32)y, cast(i32)width, cast(i32)height, wf)
    if w == nil {
        panic("Failed to create window")
    }
    win := core.window{w, len(core.AllWindows)+1}
    append(&core.AllWindows, &win)
    rf: sdl2.RendererFlags
    if len(renderFlags) > 0 {
        for f in renderFlags {
            switch f {
                case .software:
                    rf = rf | sdl2.RENDERER_SOFTWARE
                case .accelerated:
                    rf = rf | sdl2.RENDERER_ACCELERATED
                case .vsync:
                    rf = rf | sdl2.RENDERER_PRESENTVSYNC
                case .targetTexture:
                    rf = rf | sdl2.RENDERER_TARGETTEXTURE
            }
        }
    }
    r := sdl2.CreateRenderer(w, renderIndex, rf)
    if r == nil {
        panic("Failed to create renderer")
    }
    ren := core.renderer{r, len(core.AllRenderers)+1}
    append(&core.AllRenderers, &ren)
    return win, ren
}
///Initialize SDL2 and the game engine
>>>>>>> Stashed changes
Initialize :: proc() {
    x := sdl2.Init(sdl2.INIT_EVERYTHING)
    if (x != 0) { panic("Failed to init SDL2") }
    return
}

DestroyRenderer :: proc(r: ^core.renderer) {
    sdl2.DestroyRenderer(r)
    ordered_remove(&core.AllRenderers, r.AllRendererIndex) 
    return
}
<<<<<<< Updated upstream
DestroyWindow :: proc(r: ^core.window) {
    sdl2.DestroyWindow(r)
=======
///Destroys the given core.window
DestroyWindow :: proc(w: ^core.window) {
    sdl2.DestroyWindow(w)
    ordered_remove(&core.AllWindows, w.AllWindowIndex)
>>>>>>> Stashed changes
    return
}