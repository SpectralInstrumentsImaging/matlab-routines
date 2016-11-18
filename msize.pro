function msize, X, dimen
;mimics the matlab size function
if dimen gt 2 then begin
  val = (size(X,/dimen))[dimen-1]
endif else if dimen eq 1 then begin
  val = (size(X,/dimen))[1]
endif else if dimen eq 2 then begin
  val = (size(X,/dimen))[0]
endif

return, val
end