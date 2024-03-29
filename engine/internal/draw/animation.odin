package draw

import "vendor:sdl2"
import "../math"
import "../../../engine"
import "../core"
import "core:fmt"
AnimationTexture :: struct {
    using Texture: Texture,
    frames: int,
    currentFrame: int,
    frameWidth: int,
    frameTime: f64,
}
RunAnimation :: proc(ren: core.renderer, anim: ^AnimationTexture, x, y: int, speed: f64 = 1, reverse := false) {
    if anim.frameTime >= speed { //animation speed
        anim.frameTime = 0
        if reverse {
            Last(anim)
        } else {
            Next(anim)
        }
    }
    anim.frameTime += engine.deltaTime
    src := NewRectangle(anim.currentFrame * anim.frameWidth, 0, anim.frameWidth, anim.size.Height)
    dst := NewRectangle(x, y, anim.frameWidth, anim.size.Height)
    RenderTextureRecs(ren, anim, &src, &dst)
    //fmt.printf("animation continuing:\nft = %d\ncf = %d\n\n", anim.frameTime, anim.currentFrame)
}
RunAnimationEx :: proc(ren: core.renderer, anim: ^AnimationTexture, x, y: int, speed: f64 = 1, scale: f64 = 1, reverse := false) {
    if anim.frameTime >= speed { //animation speed
        anim.frameTime = 0
        if reverse {
            Last(anim)
        } else {
            Next(anim)
        }
    }
    anim.frameTime += engine.deltaTime
    src := NewRectangle(anim.currentFrame * anim.frameWidth, 0, anim.frameWidth, anim.size.Height)
    dst := NewRectangle(x, y, cast(int)(cast(f64)anim.frameWidth * scale), cast(int)(cast(f64)anim.size.Height * scale))
    RenderTextureRecs(ren, anim, &src, &dst)
}
Pause :: proc(ren: core.renderer, anim: ^AnimationTexture, x, y: int) {
    src := NewRectangle(anim.currentFrame * anim.frameWidth, 0, anim.frameWidth, anim.size.Height)
    dst := NewRectangle(x, y, anim.frameWidth, anim.size.Height)
    RenderTextureRecs(ren, anim, &src, &dst)
}
Next :: proc(anim: ^AnimationTexture) {
    if anim.currentFrame < anim.frames-1 {
        anim.currentFrame += 1
    } else {
        anim.currentFrame = 0
    }
    anim.currentFrame = clamp(anim.currentFrame, 0, anim.frames)
}

Last :: proc(anim: ^AnimationTexture) {
    anim.currentFrame -= 1
    if anim.currentFrame < 0 {
        anim.currentFrame = anim.frames
    }
}
NewSpritesheetFromTexture :: proc(tex: Texture, frames: int) -> AnimationTexture{
    return AnimationTexture {
        tex,
        frames,
        0,
        tex.size.Width / frames,
        0,
    }
}
NewSpritesheet :: proc(ren: core.renderer, file: string, frames: int) -> AnimationTexture {
    tex := LoadTexture(ren, file)
    return NewSpritesheetFromTexture(tex, frames)
}