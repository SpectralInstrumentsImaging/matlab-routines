function atan3,a, b

; four quadrant inverse tangent

; input

;  a = sine of angle
;  b = cosine of angle

; output

;  y = angle (radians; 0 =< c <= 2 * pi)

; Orbital Mechanics with MATLAB

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

compile_opt idl2

epsilon = 0.0000000001;

pidiv2 = 0.5 * !pi;

if (abs(a) lt epsilon) then begin
  y = (1 - sign(b)) * pidiv2;
  return,y
endif else begin
  c = (2 - sign(a)) * pidiv2;
end

if (abs(b) lt epsilon) then begin
  y = c;
  return, y
endif else begin
  y = c + sign(a) * sign(b) * (abs(atan(a / b)) - pidiv2);
endelse

return, y
end
