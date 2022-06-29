package draw

import "vendor:sdl2"
import "../math"
import "../../../engine"
import "../core"
AnimationTexture :: struct {
    using Texture: Texture,
    frames: int,
    currentFrame: int,
    frameWidth: int,
    frameTime: f64,
}
runAnimation :: proc(ren: ^core.renderer, animation: ^AnimationTexture, x: int, y: int, speed: int = 1) { //make deltaTime first
    if animation.frameTime >= speed { //animation speed
        animation.frameTime = 0
        if animation.currentFrame >= animation.frames {
            animation.currentFrame = 0
        } else {
            animation.currentFrame += 1
        }
    } else {
        animation.frameTime += engine.deltaTime
    }
    clamp(plr.currentFrame, 1, plr.frames)
    RenderTextureRecs(ren, animation, NewRectangle(0, 0, animation.frameWidth * animation.currentFrame, animation.size.Height), NewRectangle(x, y, animation.frameWidth * animation.currentFrame, animation.size.Height))
}

newAnimation :: proc(tex: Texture, frames: int, frameTime: f64 = 0.1) -> AnimationTexture{
    return AnimationTexture {
        tex,
        frames,
        0,
        cast(int)tex.size.Width / frames,
        frameTime,
    }
}