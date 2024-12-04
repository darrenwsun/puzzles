input:read0 `:resources/d4.txt;

diag:{x ./: 2#'til count x};
antidiag:{x ./: flip (tc;reverse tc:til count x)};
ul:{x ./: flip (reverse s;s:til y)};
ur:{x ./: flip (s;(count[x]-y)+s:til y)};
ll:{x ./: flip ((count[x]-y)+s;s:til y)};
lr:{x ./: flip ((count[x]-y)+s;-1+count[x]-s:til y)};

comb:input,flip[input],enlist[diag[input]],enlist[antidiag[input]],raze (ul[input;];ur[input;];ll[input;];lr[input;]) @/:\: 1+til -1+count[input];
comb,:reverse each comb;
d4a:sum {-1+count "XMAS" vs x} each comb;

ia:raze {y,/: (where x[y]="A") except (0;-1+count x)}[input;] each 1+til -2+count input;
d4b:sum {all (x ./: (y-1;y+1); x ./: ((y[0]-1;y[1]+1);(y[0]+1;y[1]-1))) in\: ("MS";"SM")}[input;] each ia;
