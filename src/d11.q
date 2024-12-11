stones:"J"$" " vs raze read0 `:resources/d11.txt;

blink:{
  if[x=0; :1];
  if[0=(c:count sx:string x) mod 2; :"J"$sx (2 0N)#til c];
  x*2024};

d11a:count 25 {raze blink each x}/ stones;

cache:([number:`p#0#0N; blink:0#0N] cnt:0#0N);
// x: number on a stone
// y: the remaining times of blinking
blink_memorized:{
  if[y=0; :1];
  if[not null v:cache[(x;y);`cnt]; :v];
  x1:blink x;
  r:sum blink_memorized[;y-1] each x1;
  `cache upsert (x;y;r);
  r};

d11b:sum blink_memorized[;25] each stones;
