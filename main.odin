/*
*Addition to the storyline:
    *Chomper: Origin of Gatoraid's protagonist
    */
package main

import "engine"
import "engine/internal/core"
import "engine/internal/draw"
import "core:fmt"
import "vendor:sdl2"

WHEIGHT :: 600
WWIDTH :: 500
main :: proc() {
    engine.Initialize()
    w, r := engine.CreateWindow("Hello World", core.centeredWindowPos, core.centeredWindowPos, WWIDTH, WHEIGHT)
    t := draw.LoadTexture(&r, "toad.png")
    //rec := draw.NewRectangle(WWIDTH/2, WHEIGHT/2, t.size.Width*2, t.size.Height*2)
    //fmt.printf(" w: {}, h: {}, tex: {}", t.size.Width, t.size.Height, t)
    defer engine.Exit(core.AllWindows, core.AllRenderers)
    //fmt.print(engine.GetError())
    for !engine.Exiting() {
        if core.KeyPressed(core.Key.t) {
            fmt.print("t pressed\n")
        }
        //fmt.printf("{}\n", engine.GetError())
        draw.clearWindow(&r)
        draw.RenderTexture(&r, t)
        draw.showRenderer(&r)
    }
}