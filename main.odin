package main

import "engine"
import "engine/internal/core"
import "engine/internal/draw"
import "core:fmt"
main :: proc() {
    engine.Initialize()
    w, r := engine.CreateWindowAndRenderer("Hello World", core.centeredWindowPos, core.centeredWindowPos, 1000, 900)
    defer engine.Exit(&w, &r)
    fmt.print(engine.GetError())
    for !engine.Exiting() {
        draw.clearWindow(&r, 255, 255, 255, 255)
        draw.showRenderer(&r)
    }
}