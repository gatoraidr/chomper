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
<<<<<<< Updated upstream
    fmt.println("init")
    w := engine.CreateWindow("Hello World", core.centeredWindowPos, core.centeredWindowPos, 700, 800)
    r := engine.CreateRenderContext(&w)
    defer engine.Exit(&w, &r)
    fmt.print(engine.GetError())
    for true {
        draw.clearWindow(&r, 255, 255, 255, 255)
        draw.showRenderer(&r)
=======
    w, r := engine.CreateWindow("Hello World", core.centeredWindowPos, core.centeredWindowPos, 1000, 900)
    t := draw.LoadTexture(&r, "/home/sharpcdf/Pictures/dark-minimal-mountains.png")
    //fmt.printf("x: {}, y: {}, w: {}, h: {}, tex: {}", t.x, t.y, t.width, t.height, t.Texture)
    defer engine.Exit(core.AllWindows, core.AllRenderers)
    //fmt.print(engine.GetError())
    for !engine.Exiting() {
        draw.clearAndShowRenderer(&r, 255, 255, 255, 255)
        if core.KeyPressed(core.Key.t) {
            fmt.print("t pressed\n")
        }
        fmt.printf("{}\n", engine.GetError())
        draw.RenderTexture(&r, t) //*this is the error
>>>>>>> Stashed changes
    }
}