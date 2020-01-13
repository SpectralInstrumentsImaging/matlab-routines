function length, A
;mimics matlabs length routine
compile_opt idl2

return, max(size(A, /dimen))
end 