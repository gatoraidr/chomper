/*
Package core/input provides procs and structs for interfacing with the device input system.
*/
//TODO: Add controller input struct
package core

import "vendor:sdl2"

keycode :: sdl2.Keycode
Key :: _Key{
    Unknown = 0, 
	Return = 13, 
	Escape = 27, 
	Backspace = 8, 
	Tab = 9, 
	Space = 32, 
	ExlamationMark = 33, 
	Quote = 34, 
	Hashtag = 35, 
	Percent = 37, 
	Dollar = 36, 
	Ampersand = 38, 
	Apostrophe = 39, 
	LeftParenthesis = 40, 
	RightParenthesis = 41, 
	Asterisk = 42, 
	Plus = 43, 
	Comma = 44, 
	Minus = 45, 
	Period = 46, 
	Slash = 47, 
	Num0 = 48, 
	Num1 = 49, 
	Num2 = 50, 
	Num3 = 51, 
	Num4 = 52, 
	Num5 = 53, 
	Num6 = 54, 
	Num7 = 55, 
	Num8 = 56, 
	Num9 = 57, 
	Colon = 58, 
	Semicolon = 59, 
	Less = 60, 
	Equals = 61, 
	Greater = 62, 
	QuestionMark = 63, 
	At = 64, 
	LeftBracket = 91, 
	Backslash = 92, 
	RightBracket = 93, 
	Caret = 94, 
	Underscore = 95, 
	Backquote = 96, 
	a = 97, 
	b = 98, 
	c = 99, 
	d = 100, 
	e = 101, 
	f = 102, 
	g = 103, 
	h = 104, 
	i = 105, 
	j = 106, 
	k = 107, 
	l = 108, 
	m = 109, 
	n = 110, 
	o = 111, 
	p = 112, 
	q = 113, 
	r = 114, 
	s = 115, 
	t = 116, 
	u = 117, 
	v = 118, 
	w = 119, 
	x = 120, 
	y = 121, 
	z = 122, 
	A = 97, 
	B = 98, 
	C = 99, 
	D = 100, 
	E = 101, 
	F = 102, 
	G = 103, 
	H = 104, 
	I = 105, 
	J = 106, 
	K = 107, 
	L = 108, 
	M = 109, 
	N = 110, 
	O = 111, 
	P = 112, 
	Q = 113, 
	R = 114, 
	S = 115, 
	T = 116, 
	U = 117, 
	V = 118, 
	W = 119, 
	X = 120, 
	Y = 121, 
	Z = 122, 
	Capslock = 1073741881, 
	F1 = 1073741882, 
	F2 = 1073741883, 
	F3 = 1073741884, 
	F4 = 1073741885, 
	F5 = 1073741886, 
	F6 = 1073741887, 
	F7 = 1073741888, 
	F8 = 1073741889, 
	F9 = 1073741890, 
	F10 = 1073741891, 
	F11 = 1073741892, 
	F12 = 1073741893, 
	Printscreen = 1073741894, 
	ScrollLock = 1073741895, 
	Pause = 1073741896, 
	Insert = 1073741897, 
	Home = 1073741898, 
	PageUp = 1073741899, 
	Delete = 127, 
	End = 1073741901, 
	PageDown = 1073741902, 
	Right = 1073741903, 
	Left = 1073741904, 
	Down = 1073741905, 
	Up = 1073741906, 
	NumlockClear = 1073741907, 
	KeyPad_Divide = 1073741908, 
	KeyPad_Multiply = 1073741909, 
	KeyPad_Minus = 1073741910, 
	KeyPad_Plus = 1073741911, 
	KeyPad_Return = 1073741912, 
	KeyPad_1 = 1073741913, 
	KeyPad_2 = 1073741914, 
	KeyPad_3 = 1073741915, 
	KeyPad_4 = 1073741916, 
	KeyPad_5 = 1073741917, 
	KeyPad_6 = 1073741918, 
	KeyPad_7 = 1073741919, 
	KeyPad_8 = 1073741920, 
	KeyPad_9 = 1073741921, 
	KeyPad_0 = 1073741922, 
	KeyPad_Period = 1073741923, 
	Application = 1073741925, 
	Power = 1073741926, 
	KeyPad_Equals = 1073741927, 
	F13 = 1073741928, 
	F14 = 1073741929, 
	F15 = 1073741930, 
	F16 = 1073741931, 
	F17 = 1073741932, 
	F18 = 1073741933, 
	F19 = 1073741934, 
	F20 = 1073741935, 
	F21 = 1073741936, 
	F22 = 1073741937, 
	F23 = 1073741938, 
	F24 = 1073741939, 
	Execute = 1073741940, 
	Help = 1073741941, 
	Menu = 1073741942, 
	Select = 1073741943, 
	Stop = 1073741944, 
	Again = 1073741945, 
	Undo = 1073741946, 
	Cut = 1073741947, 
	Copy = 1073741948, 
	Paste = 1073741949, 
	Find = 1073741950, 
	Mute = 1073741951, 
	VolumeUp = 1073741952, 
	VolumeDown = 1073741953, 
	LCtrl = 1073742048, 
	LShift = 1073742049, 
	LAlt = 1073742050, 
	LGui = 1073742051, 
	RCtrl = 1073742052, 
	RShift = 1073742053,
	RAlt = 1073742054, 
	RGui = 1073742055, 
	Mode = 1073742081, 
	AudioNext = 1073742082, 
	AudioPrev = 1073742083, 
	AudioStop = 1073742084, 
	AudioPlay = 1073742085, 
	AudioMute = 1073742086, 
	MediaSelect = 1073742087, 
	BrightnessDown = 1073742099, 
	BrightnessUp = 1073742100, 
	DisplaySwitch = 1073742101, 
	KeyboardIllumToggle = 1073742102, 
	KeyboardIllumDown = 1073742103, 
	KeyboardIllumUp = 1073742104, 
	Eject = 1073742105, 
	Sleep = 1073742106,
}
KeyPressed :: proc(key: i32) -> bool {
  #partial switch DefaultEvent.type {
  case events.KeyUp:
    if (DefaultEvent.key.keysym.sym == cast(keycode)key) {
      return true
    } else {
        return false
    }
  }
  return false
}
KeyHeld :: proc(key: i32) -> bool {
	  #partial switch DefaultEvent.type {
  case events.KeyDown:
	if (DefaultEvent.key.keysym.sym == cast(keycode)key) {
	  return true
	} else {
		return false
	}
  }
  return false
}
_Key :: struct{
    Unknown: i32, 
	Return: i32, 
	Escape: i32, 
	Backspace: i32, 
	Tab: i32, 
	Space: i32, 
	ExlamationMark: i32, 
	Quote: i32, 
	Hashtag: i32, 
	Percent: i32, 
	Dollar: i32, 
	Ampersand: i32, 
	Apostrophe: i32, 
	LeftParenthesis: i32, 
	RightParenthesis: i32, 
	Asterisk: i32, 
	Plus: i32, 
	Comma: i32, 
	Minus: i32, 
	Period: i32, 
	Slash: i32, 
	Num0: i32, 
	Num1: i32, 
	Num2: i32, 
	Num3: i32, 
	Num4: i32, 
	Num5: i32, 
	Num6: i32, 
	Num7: i32, 
	Num8: i32, 
	Num9: i32, 
	Colon: i32, 
	Semicolon: i32, 
	Less: i32, 
	Equals: i32, 
	Greater: i32, 
	QuestionMark: i32, 
	At: i32, 
	LeftBracket: i32, 
	Backslash: i32, 
	RightBracket: i32, 
	Caret: i32, 
	Underscore: i32, 
	Backquote: i32, 
	a: i32, 
	b: i32, 
	c: i32, 
	d: i32, 
	e: i32, 
	f: i32, 
	g: i32, 
	h: i32, 
	i: i32, 
	j: i32, 
	k: i32, 
	l: i32, 
	m: i32, 
	n: i32, 
	o: i32, 
	p: i32, 
	q: i32, 
	r: i32, 
	s: i32, 
	t: i32, 
	u: i32, 
	v: i32, 
	w: i32, 
	x: i32, 
	y: i32, 
	z: i32, 
	A: i32, 
	B: i32, 
	C: i32, 
	D: i32, 
	E: i32, 
	F: i32, 
	G: i32, 
	H: i32, 
	I: i32, 
	J: i32, 
	K: i32, 
	L: i32, 
	M: i32, 
	N: i32, 
	O: i32, 
	P: i32, 
	Q: i32, 
	R: i32, 
	S: i32, 
	T: i32, 
	U: i32, 
	V: i32, 
	W: i32, 
	X: i32, 
	Y: i32, 
	Z: i32, 
	Capslock: i32, 
	F1: i32, 
	F2: i32, 
	F3: i32, 
	F4: i32, 
	F5: i32, 
	F6: i32, 
	F7: i32, 
	F8: i32, 
	F9: i32, 
	F10: i32, 
	F11: i32, 
	F12: i32, 
	Printscreen: i32, 
	ScrollLock: i32, 
	Pause: i32, 
	Insert: i32, 
	Home: i32, 
	PageUp: i32, 
	Delete: i32, 
	End: i32, 
	PageDown: i32, 
	Right: i32, 
	Left: i32, 
	Down: i32, 
	Up: i32, 
	NumlockClear: i32, 
	KeyPad_Divide: i32, 
	KeyPad_Multiply: i32, 
	KeyPad_Minus: i32, 
	KeyPad_Plus: i32, 
	KeyPad_Return: i32, 
	KeyPad_1: i32, 
	KeyPad_2: i32, 
	KeyPad_3: i32, 
	KeyPad_4: i32, 
	KeyPad_5: i32, 
	KeyPad_6: i32, 
	KeyPad_7: i32, 
	KeyPad_8: i32, 
	KeyPad_9: i32, 
	KeyPad_0: i32, 
	KeyPad_Period: i32, 
	Application: i32, 
	Power: i32, 
	KeyPad_Equals: i32, 
	F13: i32, 
	F14: i32, 
	F15: i32, 
	F16: i32, 
	F17: i32, 
	F18: i32, 
	F19: i32, 
	F20: i32, 
	F21: i32, 
	F22: i32, 
	F23: i32, 
	F24: i32, 
	Execute: i32, 
	Help: i32, 
	Menu: i32, 
	Select: i32, 
	Stop: i32, 
	Again: i32, 
	Undo: i32, 
	Cut: i32, 
	Copy: i32, 
	Paste: i32, 
	Find: i32, 
	Mute: i32, 
	VolumeUp: i32, 
	VolumeDown: i32, 
	LCtrl: i32, 
	LShift: i32, 
	LAlt: i32, 
	LGui: i32, 
	RCtrl: i32, 
	RShift: i32, 
	RAlt: i32, 
	RGui: i32 , 
	Mode: i32, 
	AudioNext: i32, 
	AudioPrev: i32, 
	AudioStop: i32, 
	AudioPlay: i32, 
	AudioMute: i32, 
	MediaSelect: i32, 
	BrightnessDown : i32, 
	BrightnessUp: i32, 
	DisplaySwitch: i32, 
	KeyboardIllumToggle: i32, 
	KeyboardIllumDown: i32, 
	KeyboardIllumUp: i32, 
	Eject: i32, 
	Sleep: i32,
}
