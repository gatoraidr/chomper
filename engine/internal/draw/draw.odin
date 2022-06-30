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

Flip :: sdl2.RendererFlip
Texture :: struct {
    using texture: ^sdl2.Texture,
    size: math.Size,
    pos: math.Vector2,
    children: []Texture,
}
Rectangle :: struct {
    using Rect: sdl2.Rect,
    size: math.Size,
    pos: math.Vector2,
}
NewRectangle :: proc(x, y, w, h: int) -> Rectangle {
    //*i wonder why i have to init the sdl2.Rect struct directly in the Rectangle struct instead of defining it in a seperate variable
    r := Rectangle{sdl2.Rect{cast(i32)x, cast(i32)y, cast(i32)w, cast(i32)h}, math.Size{w, h}, math.Vector2{x, y}}
    return r
}
ClearWindowWithColor :: proc(ren: core.renderer, r, g, b, a: u8) {
    sdl2.SetRenderDrawColor(ren, r, g, b, a)
    sdl2.RenderClear(ren)
}
ClearWindow :: proc(ren: core.renderer) {
    sdl2.RenderClear(ren)
}
ShowRenderer :: proc(ren: core.renderer) {
    sdl2.RenderPresent(ren)
}
ClearWithColorAndShowRenderer :: proc(ren: core.renderer, r, g, b, a: u8) {
    ClearWindowWithColor(ren, r, g, b, a)
    ShowRenderer(ren)
}
ClearAndShowRenderer :: proc(ren: core.renderer) {
    ClearWindow(ren)
    ShowRenderer(ren)
}
LoadTexture :: proc(ren: core.renderer, file: string) -> Texture {
    i := img.LoadTexture(ren, strings.clone_to_cstring(file, context.temp_allocator))
    w, h, c: i32
    stb.info(strings.clone_to_cstring(file, context.temp_allocator), &w, &h, &c) //? might want to switch to core:image for getting width and height
    tex := Texture{
        texture = i,
        size = math.Size{cast(int)w, cast(int)h},
        children = {},
    }
    fmt.printf("loaded texture: {}, w: {}, h: {}\n", file, w , h)
    return tex
}
RemoveTexture :: proc(tex: Texture) {
    sdl2.DestroyTexture(tex)
}

RenderTexture :: proc(ren: core.renderer, tex: Texture, pos: math.Vector2 = {0, 0}) {
    //fmt.println(cast(int)pos.X)
    //rec := Rectangle{&sdl2.Rect{cast(i32)pos.X, cast(i32)pos.Y, cast(i32)tex.size.Width, cast(i32)tex.size.Height}, tex.size, pos}
    rec := NewRectangle(pos.X, pos.Y, tex.size.Width, tex.size.Height)
    sdl2.RenderCopy(ren, tex, nil, &rec)
    //fmt.printf("{}\n", engine.GetError())
}
RenderTextureEx :: proc(ren: core.renderer, tex: Texture, pos: math.Vector2 = {0,0}, Scale: f64) {
    //fmt.println((tex.size.Width * Scale))
    rec := NewRectangle(pos.X, pos.Y, cast(int)(cast(f64)tex.size.Width * Scale), cast(int)(cast(f64)tex.size.Height * Scale))
    sdl2.RenderCopy(ren, tex, nil, &rec)
}
RenderTextureRecs :: proc(ren: core.renderer, tex: Texture, SrcRec: ^Rectangle, DestRec: ^Rectangle) {
    sdl2.RenderCopy(ren, tex, SrcRec, DestRec)
}