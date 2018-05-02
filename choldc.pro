function choldc, array

compile_opt idl2

n = (size(array,/dimen))[0]
lower = array ; make a copy
LA_CHOLDC, lower
; Zero out the upper triangular portion.
for i = 0,n - 2 Do lower[i+1:*,i] = 0
return, lower
end