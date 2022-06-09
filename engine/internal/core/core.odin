/*
Package core contains most general constants, structs and enums that are needed for procs
*/
package core

import "core:fmt"
import "core:os"

import "vendor:sdl2"

Event :: sdl2.Event
DefaultEvent := Event{}
undefinedWindowPos :: sdl2.WINDOWPOS_UNDEFINED
centeredWindowPos :: sdl2.WINDOWPOS_CENTERED
ExitProc: proc()
AllWindows: [dynamic]^window
AllRenderers: [dynamic]^renderer
events :: _events{
    Quit = sdl2.EventType.QUIT,
    Terminating = sdl2.EventType.APP_TERMINATING,
    LowMemory = sdl2.EventType.APP_LOWMEMORY,
    EnteringBackground = sdl2.EventType.APP_WILLENTERBACKGROUND,
    EnteredBackground = sdl2.EventType.APP_DIDENTERBACKGROUND,
    EnteringForeground = sdl2.EventType.APP_WILLENTERFOREGROUND,
    EnteredForeground = sdl2.EventType.APP_DIDENTERFOREGROUND,
    DisplayEvent = sdl2.EventType.DISPLAYEVENT,
    WindowEvent = sdl2.EventType.WINDOWEVENT,
    SystemEvent = sdl2.EventType.SYSWMEVENT,
    UserEvent = sdl2.EventType.USEREVENT,
    AudioDeviceAdded = sdl2.EventType.AUDIODEVICEADDED,
    AudioDeviceRemoved = sdl2.EventType.AUDIODEVICEREMOVED,
    ClipboardUpdate = sdl2.EventType.CLIPBOARDUPDATE,
    DropFile = sdl2.EventType.DROPFILE,
    DropText = sdl2.EventType.DROPTEXT,
    DropBegin = sdl2.EventType.DROPBEGIN,
    DropComplete = sdl2.EventType.DROPCOMPLETE,
    KeyDown = sdl2.EventType.KEYDOWN,
    KeyUp = sdl2.EventType.KEYUP,
    TextEditing = sdl2.EventType.TEXTEDITING,
    TextInput = sdl2.EventType.TEXTINPUT,
}
window :: struct {
    using Window: ^sdl2.Window,
    AllWindowIndex: int,
}
renderer :: struct {
    using Renderer: ^sdl2.Renderer,
    AllRendererIndex: int,
}
window_context :: enum {
    opengl,
    vulkan,
    metal,
}
extra_window_flags :: enum {
    fullscreen,
    hidden,
    shown,
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

_events :: struct {
    Quit: sdl2.EventType,
    Terminating: sdl2.EventType,
    LowMemory: sdl2.EventType,
    EnteringBackground: sdl2.EventType,
    EnteredBackground: sdl2.EventType,
    EnteringForeground: sdl2.EventType,
    EnteredForeground: sdl2.EventType,
    DisplayEvent: sdl2.EventType,
    WindowEvent: sdl2.EventType,
    SystemEvent: sdl2.EventType,
    UserEvent: sdl2.EventType,
    AudioDeviceAdded: sdl2.EventType,
    AudioDeviceRemoved: sdl2.EventType,
    ClipboardUpdate: sdl2.EventType,
    DropFile: sdl2.EventType,
    DropText: sdl2.EventType,
    DropBegin: sdl2.EventType,
    DropComplete: sdl2.EventType,
    KeyDown: sdl2.EventType,
    KeyUp: sdl2.EventType,
    TextEditing: sdl2.EventType,
    TextInput: sdl2.EventType,
}