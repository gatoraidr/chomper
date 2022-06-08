/*
Package draw contains all procs and structs related to drawing and rendering 2d objects on screen
*/
package draw

import "vendor:sdl2"
import img "vendor:sdl2/image"
import stb "vendor:stb/image"
import "../core"
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
NewRectangle :: proc(x, y, w, h: int) -> Rectangle {
    rec := sdl2.Rect{cast(i32)x, cast(i32)y, cast(i32)w, cast(i32)h}
    r := Rectangle{&rec, math.Size{w, h}, math.Vector2{cast(f32)x, cast(f32)y}}
    return r
}
clearWindowWithColor :: proc(ren: ^core.renderer, r, g, b, a: u8) {
    sdl2.SetRenderDrawColor(ren, r, g, b, a)
    sdl2.RenderClear(ren)
}
clearWindow :: proc(ren: ^core.renderer) {
    sdl2.RenderClear(ren)
}
showRenderer :: proc(ren: ^core.renderer) {
    sdl2.RenderPresent(ren)
}
clearWithColorAndShowRenderer :: proc(ren: ^core.renderer, r, g, b, a: u8) {
    clearWindowWithColor(ren, r, g, b, a)
    showRenderer(ren)
}
clearAndShowRenderer :: proc(ren: ^core.renderer) {
    clearWindow(ren)
    showRenderer(ren)
}
LoadTexture :: proc(ren: ^core.renderer, file: string) -> Texture {
    i := img.LoadTexture(ren, strings.clone_to_cstring(file))
    w, h, c: i32
    stb.info(strings.clone_to_cstring(file), &w, &h, &c)
    tex := Texture{
        Texture = i,
        size = math.Size{cast(int)w, cast(int)h},
        //children = {},
    }
    fmt.printf("loaded texture: {}, w: {}, h: {}\n", file, w , h)
    return tex
}
LoadBareTexture :: proc(ren: ^core.renderer, file: string) -> ^sdl2.Texture {
    i := img.LoadTexture(ren, strings.clone_to_cstring(file))
    return i
}
DestroyTexture :: proc(tex: ^Texture) {
    sdl2.DestroyTexture(tex)
}

RenderTexture :: proc(ren: ^core.renderer, tex: Texture, rec: ^Rectangle = nil) { //TODO: Fix error
    sdl2.RenderCopy(ren, tex.Texture, nil, rec)
    //fmt.printf("{}\n", engine.GetError())
}
RenderBareTexture :: proc(ren: ^core.renderer, tex: ^sdl2.Texture, rec: ^Rectangle = nil) {
    sdl2.RenderCopy(ren, tex, nil, rec)
}