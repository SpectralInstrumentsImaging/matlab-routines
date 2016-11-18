function fread, fileId, size, type, skip, arch

compile_opt idl2
case strlowcase(type) of 
  'uchar' : value = make_array(size,/byte)
  'schar' : value = make_array(size,/byte)
  'uint32' : value = make_array(size,/ulong)
  'double' : value = make_array(size,/double)
  'uint16' : value = make_array(size,/uint)
  'single' : value = make_array(size,/float)  
  'int32' : value = make_array(size,/long)
  else : stop
endcase
readu, fileID, value
return, value
end