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