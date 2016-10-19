; .
;/ \
;512.
;  / \
;256  .
;    / \
;  128  .
;      / \
;     64  .
;        / \
;       32  .
;          / \
;         16  .
;            / \
;           8   .
;              / \
;             4   .
;                / \
;               2   1
;
;Here the numbers represent the weight on a leaf and the .'s are non leaf nodes.
;In general, one bit is needed for the least frequent symbol while n-1 bits are needed for the most frequent
; so with these kinds of weights we get an average required bits of around n/2, while with a normal encoding we would need an average of log_2 n bits







