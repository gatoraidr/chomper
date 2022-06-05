package main

import "engine"
import "engine/internal/core"
import "engine/internal/draw"
main :: proc() {
    engine.Initialize()
    w := engine.CreateWindow("Hello World", 500, 500, 600, 800)
    r := engine.CreateRenderContext(&w, {core.renderer_flags.accelerated})
    defer engine.Exit()
    defer engine.DestroyWindow(&w)
    defer engine.DestroyRenderer(&r)
    for true {
        draw.clearWindow(&r, 255, 255, 255, 255)
        draw.showRenderer(&r)
    }
}