map:read0 `:resources/d8.txt;
antennas:(distinct raze map) except ".";

find_indices:{raze i,/:'c@i:where 0<count each c:where each map=x};
// https://code.kx.com/phrases/math/#combinations
comb:{[n;k] $[k=n;enlist til k; k=1;enlist each til n; .z.s[n-1;k],.z.s[n-1;k-1],\:enlist n-1] };


find_antinodes:{
  dx:x[0]-y[0]; dy:x[1]-y[1];
  r where {(x[0] within (0;count[map]-1)) and x[1] within (0;count[first map]-1) } each r:((x[0]+dx;x[1]+dy);(y[0]-dx;y[1]-dy))
 };

d8a:count distinct raze {fx:flip x; raze find_antinodes'[first fx;last fx]} each {x@comb[count x;2]} each find_indices each antennas

find_antinodes2:{
  dx:x[0]-y[0]; dy:x[1]-y[1];
  r:{x+y*z}[x;(dx;dy);] each neg[c]+til 2*c:1+max[(count[map] div abs dx),(count[first map] div abs dy)];
  r where {(x[0] within (0;count[map]-1)) and x[1] within (0;count[first map]-1) } each r
 };

d8b:count distinct raze {fx:flip x; raze find_antinodes2'[first fx;last fx]} each {x@comb[count x;2]} each find_indices each antennas
