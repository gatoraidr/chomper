/*
*Addition to the storyline:
    *Chomper: Origin of Gatoraid's protagonist
    */
package main

import "engine"
import "engine/internal/core"
import "engine/internal/draw"
import "core:fmt"
main :: proc() {
    engine.Initialize()
    w, r := engine.CreateWindow("Hello World", core.centeredWindowPos, core.centeredWindowPos, 1000, 900)
    t := draw.LoadTexture(&r, "/home/sharpcdf/Pictures/dark-minimal-mountains.png")
    rec := draw.NewRectangle(0, 0, 1000, 900)
    fmt.printf(" w: {}, h: {}, tex: {}, rec: {}", t.size.Width, t.size.Height, t, rec)
    defer engine.Exit(core.AllWindows, core.AllRenderers)
    //fmt.print(engine.GetError())
    for !engine.Exiting() {
        draw.clearAndShowRenderer(&r, 255, 255, 255, 255)
        if core.KeyPressed(core.Key.t) {
            fmt.print("t pressed\n")
        }
        fmt.printf("{}\n", engine.GetError())
        draw.RenderTexture(&r, t) //*this is the error
    }
}