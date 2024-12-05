input:read0 `:resources/d5.txt;
el:first where input like "";
rrules:flip reverse ("II";"|")0: el#input;
updates:"I"$/:"," vs/: (el+1) _ input;

all_pairs:{
  comb:tc cross tc:til count x;
  comb:comb where {x[0]<x[1]} each comb;
  $[any (x@comb) in rrules; 0Ni; x count[x] div 2]};

d5a:sum all_pairs each updates