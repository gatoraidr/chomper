package draw

import "vendor:sdl2"
import "../math"
import "../../../engine"
AnimationTexture :: struct {
    using Texture: Texture,
    frames: int,
    currentFrame: int,
    frameWidth: int,
    frameTime: f64,
}
runAnimation :: proc(animation: ^AnimationTexture, speed: int = 1) { //make deltaTime first
    if animation.frameTime >= 0.1 { //animation speed
        animation.frameTime = 0
        animation.currentFrame += 1
    } else {
        animation.frameTime += engine.deltaTime
    }
    animation.currentFrame += 1
}

newAnimation :: proc(tex: Texture, frames: int, frameTime: f64 = 0.1) {
    return AnimationTexture {
        tex,
        frames,
        0,
        tex.width / frames,
        frameTime,
    }
}