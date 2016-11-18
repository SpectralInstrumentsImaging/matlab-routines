function eps,x
;duplicate the Matlab eps function
compile_opt idl2
;find the closest power of 2 lower than x
lastP2 = 2UL^floor(alog(double(x))/alog(2))
s = machar(/double)
return, s.eps*lastP2
end