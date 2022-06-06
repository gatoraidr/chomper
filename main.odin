package main

import "engine"
import "engine/internal/core"
import "engine/internal/draw"
import "core:fmt"
main :: proc() {
    engine.Initialize()
    w, r := engine.CreateWindowAndRenderer("Hello World", core.centeredWindowPos, core.centeredWindowPos, 1000, 900)
    defer engine.Exit({&w}, {&r})
    for !engine.Exiting() {
        draw.clearAndShowRenderer(&r, 255, 255, 255, 255)
        if core.KeyPressed(core.Key.t) {
            fmt.print("t pressed\n")
        }
        fmt.print(engine.GetError())
    }
}