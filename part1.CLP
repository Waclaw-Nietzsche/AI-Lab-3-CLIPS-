(deffacts smartphone "Searching for Smartphone by Info"
	(imodel Samsung)
	(iprice 50000)
	(icolor black)
)

(defrule Smartphone-info-input "Getting info"
	=>
	(printout t crlf "You are holding a smartphone, please describe it." crlf)
	(printout t crlf "Please, enter the phone's model: ")
	(bind ?model (read))
	(assert (model ?model))
	(printout t crlf "Please, enter the phone's price: ")
	(bind ?price (read))
	(assert (price ?price))
	(printout t crlf "Please, enter the phone's color: ")
	(bind ?color (read))
	(assert (color ?color))
)

(defrule Info "Info"
	(imodel ?imodel)
	(icolor ?icolor)
	(iprice ?iprice)
	=>
	(printout t crlf "So we are looking for " ?icolor " " ?imodel " which maximal price is " ?iprice "." crlf)
)

(defrule XY "Check model and price"
	(model ?model)
	(price ?price)
	(imodel ?imodel)
	(iprice ?iprice)
	=>
	(if (and (<= ?price ?iprice) (eq ?model ?imodel))
		then
		(printout t crlf "It is " ?model " and the price is " ?price ".")
		(assert (V 1))
		else
		(printout t crlf "It is " ?model " and the price is " ?price ".")
		(assert (V 0))
	)
)

(defrule YZ "Check price and color"
	(price ?price)
	(color ?color)
	(iprice ?iprice)
	(icolor ?icolor)
	=>
	(printout t crlf ?color ?icolor crlf)
	(if (and (<= ?price ?iprice) (eq ?color ?icolor))
		then
		(printout t crlf "It is " ?color " and the price is " ?price ".")
		(assert (W 1))
		else
		(printout t crlf "It is " ?color " and the price is " ?price ".")
		(assert (W 0))
	)
)

(defrule VW "Check for buying"
	(V ?V)
	(W ?W)
	=>
	(if (and (= ?V 1) (= ?W 1))
		then
		(assert (U 1))
		else
		(assert (U 0))
	)
)

(defrule Final "Buy or not"
	(model ?model)
	(color ?color)
	(price ?price)
	(U ?U)
	=>
	(if (= ?U 1)
		then
		(printout t crlf "Great! You can buy this smartphone, cause it is " ?model " with a good price which is " ?price "! And the color is also good, it is " ?color ".")
		else
		(printout t crlf "Well, you shoudn't buy this smartphone, cause it is " ?model " with a price which is " ?price ", and the color is " ?color ".")
	)
)