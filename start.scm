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

  (define talk
    (lambda (wid _ txt)
      (begin
	(display "hello text !!!!\n")
	(yePrint txt)
	(let (
	      (pos (yeGet (yeGet wid "_pc") 0))
	      )
	    (y_stop_head wid (- (ywPosX pos) 32) (- (ywPosY pos) 100) (yeGetString txt))
	  )
	)
      )
    )

  (define lvl0_start
    (lambda (wid _)
      (begin
	(display "hello lvl0 !!!!\n")
	(y_stop_head wid 0 0 "HELLO, and welcom to motivation GOAL\nI will be you guide during this game !!")
	)
      )
    )

  (define pillow
    (lambda (wid tuple distance)
      (let (
	    (mver (yeGet (yeGet tuple 0) 2))
	    (o (yeGet (yeGet tuple 0) 3))
	    (tt (yeGetIntAt tuple 1))
	    )

	(y_move_set_xspeed mver -20)
	(y_move_obj o mver tt)

	)
      )
    )

  (define boss
    (lambda (wid tuple)
      (let (
	    (mob (yeGet tuple 0))
	    (tt (yeGetIntAt tuple 1))
	    (mver (yeGet (yeGet tuple 0) 1))
	    (monsters (yeGet wid "_monsters"))
	    )
	(begin
	  (if (null? (yeGet mob 10))
	      (begin
		(yeCreateIntAt 0 mob "acc" 10)
		(yeCreateIntAt 0 mob "acc2" 11)
		(y_move_set_yspeed mver -20)
		)
	      (begin
		(yeAddAt mob 10 tt)
		(yeAddAt mob 11 tt)
		)
	      )

	  (if (> (yeGetIntAt mob 11) 400000)
	      (let ((mon (yeCreateArrayAt monsters "m" (yeLen monsters)))
		    (textures (yeGet wid "textures"))
		    (monster_info (yeGet (yeGet wid "_mi") "monsters"))
		    )
                (yeCreateString "p" mon "lol") ; MONSTER_STR_KEY 0
                (ywPosCreate 770 (modulo (yuiRand) 400) mon "pos") ; MONSTER_POS 1
		(y_mover_new mon "mover") ; MONSTER_MOVER 2
		(yamap_generate_monster_canvasobj wid textures mon monster_info
						  (- (yeLen monsters) 1))
		(yeCreateIntAt 0 mob "acc" 11)
		)
	      )

	  (if (> (yeGetIntAt mob 10) 2000000)
	      (begin
		(y_move_set_yspeed mver (- (y_move_y_speed mver)))
		(yeCreateIntAt 0 mob "acc" 10)
		)
	      )
	  (y_move_obj (yeGet mob 0) mver tt)
	  )
	)
      )
    )

  (define mod_init
    (lambda (mod)
      (begin
	(display "motivation INIT\n")
	(ygAddModule Y_MOD_YIRL mod "amap")
	(yeCreateFunction "lvl0_start" mod "lvl0_start")
	(yeCreateFunction "talk" mod "talk")
	(yeCreateFunction "boss" mod "boss")
	(yeCreateFunction "pillow" mod "pillow")
	(yaeString "rgba: 255 255 255 255"
		   (yaeString "lvl0"
			      (yaeString "amap" (yeCreateArray mod "starting_widget") "<type>")
			      "map")
		   "background")
	)
      )
    )
  )
