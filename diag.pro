function diag,x
;mimic Matlab diag function
compile_opt idl2
n = n_elements(x)

array = Make_Array(n,n, TYPE=Size(x,/TYPE)) 
i = lindgen(n)
array[i,i] = x
return,array
end