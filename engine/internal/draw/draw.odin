/*
Package draw contains all procs and structs related to drawing and rendering 2d objects on screen
*/
package draw

import "vendor:sdl2"
import "../core"

clearWindow :: proc(ren: ^core.renderer, r, g, b, a: u8) {
    sdl2.SetRenderDrawColor(ren, r, g, b, a)
    sdl2.RenderClear(ren)
}
showRenderer :: proc(ren: ^core.renderer) {
    sdl2.RenderPresent(ren)
}