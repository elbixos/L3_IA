x = 5;

y =6;

z = x+y;

x=[1,2,5,8];

disp(x(3))

y = [1;2;5;8];


M  = [1,2,3,4,5; 2,3,4,5,6];

size(M);

laTaille = size(M)
disp  (laTaille(1))

x = [0:0.5:100];

y = 2 *sin(2*pi*x/10) ./ x ;

plot( x,y, 'r')

A = [1,1;2,2];

x = [0;1];

A*x

x = [1,2,3]
y = [3,4,5]

x .* y

A.*A;

for i= y
  if i < 4
    disp( i )
  endif
endfor

 
A = [1,2,3,4,1,1,2,3,1,3,4; 0,4,3,0,0,0,0,0,0,0,0];
A = A'

