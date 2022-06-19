/*
*Addition to the storyline:
    *Chomper: Origin of Gatoraid's protagonist
    */
package main

import "engine"
import "engine/internal/core"
import "engine/internal/draw"
import "engine/internal/math"
import "core:fmt"
import "vendor:sdl2"

WHEIGHT :: 800
WWIDTH :: 700
main :: proc() {
    engine.Initialize()
    w, r := engine.NewWindow("Hello World", core.centeredWindowPos, core.centeredWindowPos, WWIDTH, WHEIGHT)
    t := draw.LoadTexture(&r, "toad.png")
    defer draw.RemoveTexture(&t)
    defer engine.Exit({&w}, {&r})
    for !engine.Exiting() {
        engine.GetError()
        draw.clearWindow(&r)
        if core.KeyPressed(core.Key.t) {
            fmt.printf("deltaTime: {}\n", engine.deltaTime)
            fmt.print("t pressed\n")
        }
        draw.RenderTextureEx(r, t, math.Vector2{0, 0}, 1)
        draw.showRenderer(&r)
    }
}