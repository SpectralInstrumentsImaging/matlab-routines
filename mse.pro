function mse, x
;mean square error
compile_opt idl2
return, total(x*x)/(n_elements(x)^2.0)
end