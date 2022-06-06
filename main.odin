package main

import "engine"
import "engine/internal/core"
import "engine/internal/draw"
import "core:fmt"
main :: proc() {
    engine.Initialize()
    fmt.println("init")
    w := engine.CreateWindow("Hello World", core.centeredWindowPos, core.centeredWindowPos, 700, 800)
    r := engine.CreateRenderContext(&w)
    defer engine.Exit(&w, &r)
    fmt.print(engine.GetError())
    for true {
        draw.clearWindow(&r, 255, 255, 255, 255)
        draw.showRenderer(&r)
    }
}