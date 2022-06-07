/*
Package draw contains all procs and structs related to drawing and rendering 2d objects on screen
*/
package draw

import "vendor:sdl2"
import "../core"
<<<<<<< Updated upstream

=======
import "core:strings"
import "core:fmt"
import "../../../engine"
import "../math"
Texture :: struct { //TODO: Get working! children field causes errors to occur
    using Texture: ^sdl2.Texture,
    size: math.Size,
    //children: []Texture,
}
Rectangle :: struct {
    using Rect: ^sdl2.Rect,
    size: math.Size,
    pos: math.Vector2,
}
NewRectangle :: proc(x, y, w, h: f32) -> Rectangle {
    rec := sdl2.Rect{cast(i32)x, cast(i32)y, cast(i32)w, cast(i32)h}
    r := Rectangle{&rec, math.Size{w, h}, math.Vector2{x, y}}
    return r
}
>>>>>>> Stashed changes
clearWindow :: proc(ren: ^core.renderer, r, g, b, a: u8) {
    sdl2.SetRenderDrawColor(ren, r, g, b, a)
    sdl2.RenderClear(ren)
}
showRenderer :: proc(ren: ^core.renderer) {
    sdl2.RenderPresent(ren)
<<<<<<< Updated upstream
=======
}
clearAndShowRenderer :: proc(ren: ^core.renderer, r, g, b, a: u8) {
    clearWindow(ren, r, g, b, a)
    showRenderer(ren)
}

LoadTexture :: proc(ren: ^core.renderer, file: string) -> ^Texture {
    i := img.LoadTexture(ren, strings.clone_to_cstring(file))
    w, h, c: i32
    stb.info(strings.clone_to_cstring(file), &w, &h, &c)
    tex := Texture{
        Texture = i,
        size = math.Size{cast(f32)w, cast(f32)h},
        //children = {},
    }
    fmt.printf("loaded texture: {}\n", file)
    return &tex
}

DestroyTexture :: proc(tex: ^Texture) {
    sdl2.DestroyTexture(tex)
}

RenderTexture :: proc(ren: ^core.renderer, tex: ^Texture, rec: ^Rectangle = &Rectangle{}) { //TODO: Fix error
    fmt.print(engine.GetError())
    sdl2.RenderCopy(ren, tex, &Rectangle{}, rec)
    fmt.print(engine.GetError())
>>>>>>> Stashed changes
}