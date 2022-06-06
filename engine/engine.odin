/*
Package engine contains the most common functions for making any game, such as Exit(), CreateWindow(), and CreateRenderContext()
*/
package engine

import "internal/assets"
import "internal/ui"
import "internal/core"
import "core:strings"
import "vendor:sdl2"
import img "vendor:sdl2/image"
///Exits the application, running the core.ExitProc and destroying the given windows and renderers in the process.
Exit :: proc(w: []^core.window, r: []^core.renderer) {
    core.ExitProc()
    for win in w {
        DestroyWindow(win)
    }
    for ren in r {
        DestroyRenderer(ren)
    }
    sdl2.Quit()
    img.Quit()
}
///Returns any error that is encountered, as a string
GetError :: proc() -> string{
    return sdl2.GetErrorString()
}
///Creates a window with the given title, size and flags
CreateWindow :: proc(title: string, x, y, width, height: int, renderer: core.window_context = .opengl, extraFlags: []core.extra_window_flags = {core.extra_window_flags.resizable}) -> core.window {
    r: sdl2.WindowFlags
    switch renderer {
        case .opengl:
            r = sdl2.WINDOW_OPENGL
        case .metal:
            r = sdl2.WINDOW_METAL
        case .vulkan:
            r = sdl2.WINDOW_VULKAN
    }
    if len(extraFlags) > 0 {
        for f in extraFlags {
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
    return {x}

}
///Creates a renderer for the given core.window
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
    return {x}

}
///Creates both a window and a renderer for the window
CreateWindowAndRenderer :: proc(title: string, x, y, width, height: int, renderer: core.window_context = .opengl, extraWindowFlags: []core.extra_window_flags = {core.extra_window_flags.resizable}, renderFlags: []core.renderer_flags = {core.renderer_flags.accelerated}, renderIndex: i32 = -1) -> (core.window, core.renderer) {
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
    return {w}, {r}
}
///Initialize SDL2 and the game engine
Initialize :: proc() {
    x := sdl2.Init(sdl2.INIT_EVERYTHING)
    if (x != 0) { panic("Failed to init SDL2") }
    i := img.Init(img.INIT_PNG | img.INIT_JPG)
    if (x != 0) { panic("Failed to init SDL2/image") }
    return
}
///Destroys the given core.renderer
DestroyRenderer :: proc(r: ^core.renderer) {
    sdl2.DestroyRenderer(r)
    return
}
///Destroys the given core.window
DestroyWindow :: proc(r: ^core.window) {
    sdl2.DestroyWindow(r)
    return
}
///Polls events to core.DefaultEvent
UpdateEvents :: proc(event: ^core.Event) {
    sdl2.PollEvent(event)
    return
}
///Set a proc to run when the app exits
SetQuitProc :: proc(p: proc()) {
    core.ExitProc = p
}
///Similar to WindowShouldClose() in GLFW, use this for the main game loop
Exiting :: proc() -> bool {
    #partial switch core.DefaultEvent.type {
        case core.events.Quit:
            return true
    }
    UpdateEvents(&core.DefaultEvent)
    return false
}
///Not necessary for the almost the entirety of games, just to be safe because event handling procs use core.DefaultEvent
SetDefaultEvent :: proc(e: core.Event) {
    core.DefaultEvent = e
}