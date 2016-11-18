function ones, p1,p2, p3, _extra=extra

case n_params() of
1 : return, make_array(p1,value=1, _extra=extra)
2 : return, make_array(p1,p2, value=1, _extra=extra)
3 : return, make_array(p1,p2,p3, value=1, _extra=extra)
else:
endcase

return, ''
end
 