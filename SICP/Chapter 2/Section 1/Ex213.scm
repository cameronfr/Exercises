;interval 1: center c1, tolerance p1: i1 = [c1 - p1c1, c1 + p1c1]
;interval 2: center c2, tolerance p2: i2 = [c2 - p2c2, c2 + p2c2]

;assuming all positive (praise the lisp gods):
; 
; i1*i2 = [c1c2 - c1c2p1 - c1c2p2 + c1c2p1p2, c1c2 + c1c2p1 + c1c2p2 + c1c2p1p2]
;       = [c1c2 (1-p1-p2+p1p2) , c1c2 (1+p1+p2+p1p2) ]
;
; center((a+b)/2): c1c2 (2 + p1p2) / 2 = c1c2 when p1 & p2 are small
; tolerance((b-a)/(b+a)): (c1c2 (2p1 + 2p2))/(c1c2 (2+p1p2)) = (2p1 + 2p2) / (2 + p1p2) = p1 + p2 when p1 & p2 are small 
; 
; summary: we can neglect p1*p2 when both are small, giving the formula of:
; c' = c1c2
; p' = p1 + p2
