; INITIAL RULE
(defrule Start-info "Getting info about work and time"
	=>
	(printout t crlf "You are going to have an exam very soon. Let's check your time." crlf)
	(printout t crlf "Please, enter in how many days there will be an exam: ")
	(bind ?days (read))
	(assert (days ?days))
	(printout t crlf "Please, enter the amount of works to be made for exam (from 0% to 100%): ")
	(bind ?works (read))
	(assert (works ?works))
	(printout t crlf "Please, enter the temperature outside (in Celsium): ")
	(bind ?temperature (read))
	(assert (temperature ?temperature))
	(printout t crlf "Please, tell me, is there any precipitation outside? (1 - yes, 0 - no): ")
	(bind ?rain (read))
	(assert (rain ?rain))
)

;; INFO ;;
; freetime = 0 (no freetime), = 1 (a few of freetime), = 2 (a lot of freetime).
; rain = 0 (it's sunny), = 1 (it's raining/snowing).
; weather = 0 (bad), = 1 (normal), = 2 (good)
; act = 0 (study), = 1 (walk a bit and study), = 2 (rest)
;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DAYS AND WORK RULES GROUP ;;

; works = 0
(defrule R0
	(days ?days)
	(works ?works)
	(test (and (= ?days 1) (= ?works 0)))
	=>
	(printout t crlf crlf "There is a lot of time!" crlf)
	(assert (freetime 2))
)

(defrule R1
	(days ?days)
	(works ?works)
	(test (and (= ?days 2) (= ?works 0)))
	=>
	(printout t crlf crlf "There is a lot of time!" crlf)
	(assert (freetime 2))
)

(defrule R2
	(days ?days)
	(works ?works)
	(test (and (= ?days 3) (= ?works 0)))
	=>
	(printout t crlf crlf "There is a lot of time!" crlf)
	(assert (freetime 2))
)

(defrule R3
	(days ?days)
	(works ?works)
	(test (and (= ?days 4) (= ?works 0)))
	=>
	(printout t crlf crlf "There is a lot of time!" crlf)
	(assert (freetime 2))
)

(defrule R4
	(days ?days)
	(works ?works)
	(test (and (= ?days 5) (= ?works 0)))
	=>
	(printout t crlf crlf "There is a lot of time!" crlf)
	(assert (freetime 2))
)

(defrule R5
	(days ?days)
	(works ?works)
	(test (and (> ?days 5) (= ?works 0)))
	=>
	(printout t crlf crlf "There is a lot of time!" crlf)
	(assert (freetime 2))
)


; works = 0 - 10
(defrule R6
	(days ?days)
	(works ?works)
	(test (and (= ?days 1) (and (> ?works 0) (<= ?works 10))))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)

(defrule R7
	(days ?days)
	(works ?works)
	(test (and (= ?days 2) (and (> ?works 0) (<= ?works 10))))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)

(defrule R8
	(days ?days)
	(works ?works)
	(test (and (= ?days 3) (and (> ?works 0) (<= ?works 10))))
	=>
	(printout t crlf crlf "There is only a few of time!" crlf)
	(assert (freetime 1))
)

(defrule R9
	(days ?days)
	(works ?works)
	(test (and (= ?days 4) (and (> ?works 0) (<= ?works 10))))
	=>
	(printout t crlf crlf "There is only a few of time!" crlf)
	(assert (freetime 1))
)

(defrule R10
	(days ?days)
	(works ?works)
	(test (and (= ?days 5) (and (> ?works 0) (<= ?works 10))))
	=>
	(printout t crlf crlf "There is a lot of time!" crlf)
	(assert (freetime 2))
)

(defrule R11
	(days ?days)
	(works ?works)
	(test (and (> ?days 5) (and (> ?works 0) (<= ?works 10))))
	=>
	(printout t crlf crlf "There is a lot of time!" crlf)
	(assert (freetime 2))
)


; works = 10 - 25
(defrule R12
	(days ?days)
	(works ?works)
	(test (and (= ?days 1) (and (> ?works 10) (<= ?works 25))))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)

(defrule R13
	(days ?days)
	(works ?works)
	(test (and (= ?days 2) (and (> ?works 10) (<= ?works 25))))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)

(defrule R14
	(days ?days)
	(works ?works)
	(test (and (= ?days 3) (and (> ?works 10) (<= ?works 25))))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)

(defrule R15
	(days ?days)
	(works ?works)
	(test (and (= ?days 4) (and (> ?works 10) (<= ?works 25))))
	=>
	(printout t crlf crlf "There is only a few of time!" crlf)
	(assert (freetime 1))
)

(defrule R16
	(days ?days)
	(works ?works)
	(test (and (= ?days 5) (and (> ?works 10) (<= ?works 25))))
	=>
	(printout t crlf crlf "There is only a few of time!" crlf)
	(assert (freetime 1))
)

(defrule R17
	(days ?days)
	(works ?works)
	(test (and (> ?days 5) (and (> ?works 10) (<= ?works 25))))
	=>
	(printout t crlf crlf "There is a lot of time!" crlf)
	(assert (freetime 2))
)


; works = 25 - 60
(defrule R18
	(days ?days)
	(works ?works)
	(test (and (= ?days 1) (and (> ?works 25) (<= ?works 60))))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)

(defrule R19
	(days ?days)
	(works ?works)
	(test (and (= ?days 2) (and (> ?works 25) (<= ?works 60))))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)

(defrule R20
	(days ?days)
	(works ?works)
	(test (and (= ?days 3) (and (> ?works 25) (<= ?works 60))))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)

(defrule R21
	(days ?days)
	(works ?works)
	(test (and (= ?days 4) (and (> ?works 25) (<= ?works 60))))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)

(defrule R22
	(days ?days)
	(works ?works)
	(test (and (= ?days 5) (and (> ?works 25) (<= ?works 60))))
	=>
	(printout t crlf crlf "There is only a few of time!" crlf)
	(assert (freetime 1))
)

(defrule R23
	(days ?days)
	(works ?works)
	(test (and (> ?days 5) (and (> ?works 25) (<= ?works 60))))
	=>
	(printout t crlf crlf "There is only a few of time!" crlf)
	(assert (freetime 1))
)


; works = 60 - 90
(defrule R24
	(days ?days)
	(works ?works)
	(test (and (= ?days 1) (and (> ?works 60) (<= ?works 90))))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)

(defrule R25
	(days ?days)
	(works ?works)
	(test (and (= ?days 2) (and (> ?works 60) (<= ?works 90))))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)

(defrule R26
	(days ?days)
	(works ?works)
	(test (and (= ?days 3) (and (> ?works 60) (<= ?works 90))))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)

(defrule R27
	(days ?days)
	(works ?works)
	(test (and (= ?days 4) (and (> ?works 60) (<= ?works 90))))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)

(defrule R28
	(days ?days)
	(works ?works)
	(test (and (= ?days 5) (and (> ?works 60) (<= ?works 90))))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)

(defrule R29
	(days ?days)
	(works ?works)
	(test (and (> ?days 5) (and (> ?works 60) (<= ?works 90))))
	=>
	(printout t crlf crlf "There is only a few of time!" crlf)
	(assert (freetime 1))
)


; works > 90
(defrule R30
	(days ?days)
	(works ?works)
	(test (and (= ?days 1) (> ?works 90)))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)

(defrule R31
	(days ?days)
	(works ?works)
	(test (and (= ?days 2) (> ?works 90)))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)

(defrule R32
	(days ?days)
	(works ?works)
	(test (and (= ?days 3) (> ?works 90)))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)

(defrule R33
	(days ?days)
	(works ?works)
	(test (and (= ?days 4) (> ?works 90)))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)

(defrule R34
	(days ?days)
	(works ?works)
	(test (and (= ?days 5) (> ?works 90)))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)

(defrule R35
	(days ?days)
	(works ?works)
	(test (and (> ?days 5) (> ?works 90)))
	=>
	(printout t crlf crlf "There is no free time!" crlf)
	(assert (freetime 0))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TEMPERATURE AND RAIN RULES GROUP ;;
(defrule R36
	(temperature ?temperature)
	(rain ?rain)
	(test (and (= ?rain 0) (< ?temperature 0)))
	=>
	(printout t crlf crlf "It's frosty outside! It's not snowing." crlf)
	(assert (weather 0))
)

(defrule R37
	(temperature ?temperature)
	(rain ?rain)
	(test (and (= ?rain 1) (< ?temperature 0)))
	=>
	(printout t crlf crlf "It's frosty outside! It's snowing." crlf)
	(assert (weather 0))
)

(defrule R38
	(temperature ?temperature)
	(rain ?rain)
	(test (and (= ?rain 0) (and (>= ?temperature 0) (< ?temperature 10))))
	=>
	(printout t crlf crlf "It's cold outside! It's not raining." crlf)
	(assert (weather 0))
)

(defrule R39
	(temperature ?temperature)
	(rain ?rain)
	(test (and (= ?rain 1) (and (>= ?temperature 0) (< ?temperature 10))))
	=>
	(printout t crlf crlf "It's cold outside! It's raining." crlf)
	(assert (weather 0))
)

(defrule R40
	(temperature ?temperature)
	(rain ?rain)
	(test (and (= ?rain 0) (and (>= ?temperature 10) (< ?temperature 20))))
	=>
	(printout t crlf crlf "It's a bit cold outside! It's not raining." crlf)
	(assert (weather 1))
)

(defrule R41
	(temperature ?temperature)
	(rain ?rain)
	(test (and (= ?rain 1) (and (>= ?temperature 10) (< ?temperature 20))))
	=>
	(printout t crlf crlf "It's a bit cold outside! It's raining." crlf)
	(assert (weather 1))
)

(defrule R42
	(temperature ?temperature)
	(rain ?rain)
	(test (and (= ?rain 0) (>= ?temperature 20)))
	=>
	(printout t crlf crlf "It's warm outside! It's not raining." crlf)
	(assert (weather 2))
)

(defrule R43
	(temperature ?temperature)
	(rain ?rain)
	(test (and (= ?rain 1) (>= ?temperature 20)))
	=>
	(printout t crlf crlf "It's warm outside! It's raining." crlf)
	(assert (weather 2))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; WEATHER AND FREETIME RULES GROUP ;;
(defrule R44
	(freetime ?freetime)
	(weather ?weather)
	(test (= ?freetime 0))
	=>
	(printout t crlf crlf "You shoud study in any case!" crlf)
	(assert (act 0))
)

(defrule R45
	(freetime ?freetime)
	(weather ?weather)
	(test (and (= ?freetime 1) (or (= ?weather 0) (= ?weather 1))))
	=>
	(printout t crlf crlf "You shoud study until the weather will be better!" crlf)
	(assert (act 0))
)

(defrule R46
	(freetime ?freetime)
	(weather ?weather)
	(test (and (= ?freetime 1) (= ?weather 2)))
	=>
	(printout t crlf crlf "You can walk for a bit and study after that!" crlf)
	(assert (act 1))
)

(defrule R47
	(freetime ?freetime)
	(weather ?weather)
	(test (and (= ?freetime 2) (= ?weather 0)))
	=>
	(printout t crlf crlf "You shoud rest at home, but you can go outside when the weather will be better!" crlf)
	(assert (act 2))
)

(defrule R48
	(freetime ?freetime)
	(weather ?weather)
	(test (and (= ?freetime 2) (= ?weather 1)))
	=>
	(printout t crlf crlf "You can go outside for a while, but don't catch a cold!" crlf)
	(assert (act 2))
)

(defrule R49
	(freetime ?freetime)
	(weather ?weather)
	(test (and (= ?freetime 2) (= ?weather 2)))
	=>
	(printout t crlf crlf "You be outside all day long, enjoy!" crlf)
	(assert (act 2))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;
;; ACT RULES GROUP ;;
(defrule R50
	(freetime ?act)
	=>
	(if (= ?act 0)
		then
		(printout t crlf crlf "Good luck in your study! Be well prepared!" crlf)
	)
	(if (= ?act 1)
		then
		(printout t crlf crlf "You may get a little of freetime, if you finish works quickly!" crlf)
	)
	(if (= ?act 2)
		then
		(printout t crlf crlf "Well done with all the works! You are a real hard worker!" crlf)
	)
)
;;;;;;;;;;;;;;;;;;;;;






















































;;
