function  msort, x, descend=descend, ascend=ascend, ind=ind
;mimics the matlab sort function
ind = sort(x)
if keyword_set(descend) then begin
  newX = reverse(x[ind])
  ind =  reverse(ind)
endif else begin
  newX = x[ind]
endelse

return, newX
end  