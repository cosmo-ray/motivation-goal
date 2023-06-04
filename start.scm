;           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
;                   Version 2, December 2004
;
; Copyright (C) 2023 Matthias Gatto <uso.cosmo.ray@gmail.com>
;
; Everyone is permitted to copy and distribute verbatim or modified
; copies of this license document, and changing it is allowed as long
; as the name is changed.
;
;            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
;   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
;
;  0. You just DO WHAT THE FUCK YOU WANT TO.

(begin

  (define mod_init
    (lambda (mod)
      (begin
	(display "motivation INIT\n")
	(ygAddModule Y_MOD_YIRL mod "amap")
	(yaeString "rgba: 255 255 255 255"
		   (yaeString "lvl31"
			      (yaeString "amap" (yeCreateArray mod "starting_widget") "<type>")
			      "map")
		   "background")
	)
      )
    )
  )
