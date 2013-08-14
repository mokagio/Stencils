Some notes on the Font Metrics
===

Either Aple is the only one doing things properly, or they're doing the font things diffrently from every other company or group in the world of people who work with fonts on screens. No matter how things are, fact is that using custom fonts on iOS applications is always a pain in the ass.

Here's what I found out after half an hour or so of "R&D" on the font from [IcoMoon](http://icomoon.io/app/) used for the icons in the example.

The font needs tuning using the `ftxdumperfuser` cli util, from the [Apple Font Tool Suite](https://developer.apple.com/fonts/).

To do so run:

	ftxdumperfuser -t hhea -A d font-icon.ttf

It will generate a `xxx.hhea.xml`, open it and change the ascender and descender values:

	ascender="512"
	descender="0"
	
Finally update the `.ttf` with the new settings

 	ftxdumperfuser -t hhea -A f font-icon.ttf
 	
 I got all this from [here](http://stackoverflow.com/questions/7535498/uibutton-custom-font-vertical-alignment/#8314197).

This won't be enough though, we need to add a little bit of offset, I found that a **-1 vertical offset** and a **0.95 scale for the font size** avoid cropping the borders of the icon.

###Final note

I'm really disappointed by having to do this kind of stuff to handle the font icons. I would be very happy if someone with nore experience about it than I have could help with this big issue.