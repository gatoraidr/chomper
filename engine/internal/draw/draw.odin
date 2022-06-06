/*
Package draw contains all procs and structs related to drawing and rendering 2d objects on screen
*/
package draw

import "vendor:sdl2"
import img "vendor:sdl2/image"
import stb "vendor:stb/image"
import "../core"
import "core:strings"

Rectangle :: sdl2.Rect
Texture :: struct { //TODO: Get working! children field causes errors to occur
    using Texture: ^sdl2.Texture,
    width, height: f32,
    //children: []Texture,
}
clearWindow :: proc(ren: ^core.renderer, r, g, b, a: u8) {
    sdl2.SetRenderDrawColor(ren, r, g, b, a)
    sdl2.RenderClear(ren)
}
showRenderer :: proc(ren: ^core.renderer) {
    sdl2.RenderPresent(ren)
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
        width = cast(f32)w,
        height = cast(f32)h,
        //children = {},
    }
    return &tex
}