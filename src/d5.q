input:read0 `:resources/d5.txt;
el:first where input like "";
rules:flip ("II";"|")0: el#input;
updates:"I"$/:"," vs/: (el+1) _ input;

in_order:{all (x flip (tc;1+tc:til count[x]-1)) in rules};

d5a:sum {x count[x] div 2} each updates where in_order each updates;

fix_order:{
  pairs:x flip (tc;1+tc:til count[x]-1);
  idx_wrong_pair:first where not pairs in rules;
  $[null idx_wrong_pair;
    x;
    @[x; (idx_wrong_pair;idx_wrong_pair+1); :; x (idx_wrong_pair+1;idx_wrong_pair)]]};

d5b:sum {x count[x] div 2} each (fix_order/) each updates where not in_order each updates;
