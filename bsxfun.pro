function  bsxfun, op, arg1, arg2
  ; Hacky replacement for bsxfun for old Matlab that doesn't have it.
  ; See: http://www.mathworks.com/access/helpdesk/help/techdoc/ref/bsxfun.html

  ; Iain Murray, January 2008

compile_opt idl2

trans = 0 ;default is not to transpose

sz1 = size(arg1,/dimen);
sz2 = size(arg2,/dimen);
; Workarounds for the stupid Matlab behaviour where final singleton dimensions
; are tossed out:
l1 = n_elements(sz1);
l2 = n_elements(sz2);
if l1 eq l2 then begin ;find the dim that matches
  if sz1[0] eq sz2[0] then stop
  if sz1[1] eq sz2[1] then begin
    rep1 = [sz1[1],1]
    rep2 = [1,1]
  endif
endif
if l1 gt l2 then begin
  if sz1[0] eq sz2[0] then begin
    rep1 = [1,1]
    rep2 = [1,sz1[1]]
  endif else if sz1[1] eq sz2[0] then begin
    rep1 = [1,1]
    rep2 = [sz1[0],1]
    trans = 1
    arg2 = transpose(arg2)
  endif
endif

if l2 gt l1 then begin
  if sz1[0] ne sz2[0] then stop
  rep2 = [1,1]
  rep1 = [1,sz1[0]]
endif

case op of
'plus' :answer = repmat(arg1, rep1[0], rep1[1]) + repmat(arg2, rep2[0], rep2[1])
'minus' :answer = repmat(arg1, rep1[0], rep1[1]) - repmat(arg2, rep2[0], rep2[1])
'times' :answer = repmat(arg1, rep1[0], rep1[1]) * repmat(arg2, rep2[0], rep2[1])
else :
endcase

;return it back
if trans eq 1 then arg2 = transpose(arg2)

return, answer
end