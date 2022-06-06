# chomper
A game engine for Odin


## Thoughts

Alright, so I basically have no experience making game engines, but I thought it would be nice to learn by making one, similar to my gatoraider project.

Possible languages:
- Zig. This is essentially a modern C, and lets you import basically any C library without making bindings, and because it can build to a library, more languages could possibly be supported.
- Odin. Odin has many official bindings for the main graphics APIs such as DirectX, OpenGL, SDL2, etc. The only problem is that there aren't nearly as many libraries for game math or something similar
- D. Huge. That's about it. It can also build to a library but it isn't as popular.
- All three. Hear me out, I find all three languages great, and super useful for specific scenarios. Zig could be the glue, Odin could be the graphics guy, and D could be everything else- math, management, saving, etc.. Not sure how these three would interact with each other well enough to not impede performance, but might as well think about trying it. I probably won't go with this approach, but just saying :)

The main reason I even thought about all three is that I would prefer if this engine had multi language support through an API, which would be *amazing*. This is probably my most ambitious project ever, and it'll probably take a long time, but I'm fine with that. I've thought up some ambitious stuff, some have worked out and been created successfully, others I stopped working on, or gave up before I even started, but I'm sure this won't make me want to give up. *Not immediately, anyways*