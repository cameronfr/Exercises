(car ''abracadabra)
;prints back quote
;this is because the ' mark is syntactic sugar for (quote <object>) (e.g. 'a is equal to (quote a).
;thus the interpreter evaluates (car '(quote abracadabra)), which returns the first symbol in the list, quote
