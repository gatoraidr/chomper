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
    t := draw.LoadTexture(&r, "pacman.png")
    anim := draw.newAnimation(t, 4)
    defer draw.RemoveTexture(&t)
    defer engine.Exit({&w}, {&r})
    for !engine.Exiting() {
        engine.GetError()
        if core.KeyPressed(core.Key.t) {
            fmt.printf("deltaTime: {}\n", engine.deltaTime)
            fmt.print("t pressed\n")
        }
        draw.runAnimation(&r, &anim, 0, 0)
        draw.showRenderer(&r)
    }
}