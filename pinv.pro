function pinv, A
;PINV   Pseudoinverse.
;   X = PINV(A) produces a matrix X of the same dimensions
;   as A' so that A*X*A = A, X*A*X = X and A*X and X*A
;   are Hermitian. The computation is based on SVD(A) and any
;   singular values less than a tolerance are treated as zero.
;   The default tolerance is MAX(SIZE(A)) * NORM(A) * EPS(class(A)).
;
;   PINV(A,TOL) uses the tolerance TOL instead of the default.
;
;   Class support for input A: 
;      float: double, single
;
;   See also RANK.

;   Copyright 1984-2004 The MathWorks, Inc. 
;   $Revision: 5.12.4.2 $  $Date: 2004/12/06 16:35:27 $
;
;6-25-2015 turned into IDL code by KRS

if n_params() eq 0 then return, !NULL     ; quick return

sz = size(A,/dimen);
n = sz[0]
m = sz[1]

if n gt m then begin
   X = transpose(pinv(transpose(A)))
endif else begin
   svdc, A,S,U,V, /double
;   if m gt 1 then begin
;    s = diag(S);
;   endif else if m eq 1 then s = S(1) else s = 0;
   
   tol = max(m,n) * eps(max(S));

   r = where(S gt tol, rCount);
   if (rCount eq 0) then begin
      X = zeros(n,m);
   endif else begin
      capS = diag(ones(rCount,1)/S[r]);
      X = V[r,*] ## capS ## transpose(U[r,*])
   endelse
endelse

return, x
end