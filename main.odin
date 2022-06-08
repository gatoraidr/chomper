/*
*Addition to the storyline:
    *Chomper: Origin of Gatoraid's protagonist
    */
package main

import "engine"
import "engine/internal/core"
import "engine/internal/draw"
import "core:fmt"

WHEIGHT :: 1100
WWIDTH :: 1200
main :: proc() {
    engine.Initialize()
    w, r := engine.CreateWindow("Hello World", core.centeredWindowPos, core.centeredWindowPos, WWIDTH, WHEIGHT)
    t := draw.LoadBareTexture(&r, "toad.png")
    //rec := draw.NewRectangle(WWIDTH/2, WHEIGHT/2, t.size.Width*2, t.size.Height*2)
    //fmt.printf(" w: {}, h: {}, tex: {}", t.size.Width, t.size.Height, t)
    defer engine.Exit(core.AllWindows, core.AllRenderers)
    //fmt.print(engine.GetError())
    for !engine.Exiting() {
        draw.clearAndShowRenderer(&r)
        if core.KeyPressed(core.Key.t) {
            fmt.print("t pressed\n")
        }
        //fmt.printf("{}\n", engine.GetError())
        //fmt.printf("{}\n", engine.GetError())
        draw.RenderBareTexture(&r, t)
    }
}