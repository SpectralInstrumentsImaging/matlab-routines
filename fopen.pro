function fopen, fileName, state

compile_opt idl2

case strlowcase(state) of
'w' : openw,lun,fileName,/get_lun
'r' : openr,lun,fileName,/get_lun
else:
endcase

return, lun
end