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
    anim := draw.NewSpritesheet(r, "pacman.png", 4)
    defer draw.RemoveTexture(anim)
    defer engine.Exit({&w}, {&r})
    for !engine.Exiting() {
        draw.ClearWindow(r)
        engine.GetError()
        if core.KeyPressed(core.Key.t) {
            fmt.printf("deltaTime: {}\n", engine.deltaTime)
            fmt.print("t pressed\n")
        }
        draw.RunAnimationEx(r, &anim, 0, 0, 0.2, 3)
        //draw.RenderTextureEx(r, t, math.Vector2{0, 0}, 2)
        draw.ShowRenderer(r)
    }
}