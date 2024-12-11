map:"I"$string read0 `:resources/d10.txt;
X:count map; Y:count first map;
trailheads:raze i,/:'c@i:where 0<count each c:where each map=0;

explore:{
  visited[x[0];x[1]]:1;
  nextpos:((x[0]-1;x[1]);(x[0]+1;x[1]);(x[0];x[1]-1);(x[0];x[1]+1));
  nextpos:nextpos where {(y[0] within (0;X-1)) and (y[1] within (0;Y-1)) and (map . y)=(map . x)+1}[x;] @/: nextpos;
  if[count nextpos; explore each nextpos]
 };

find_score:{
  `visited set map&0;
  explore x;
  sum 9=raze map @' where each visited=1};

d10a:sum find_score each trailheads;

find_rating:{
  if[9=map . x; :1];
  nextpos:((x[0]-1;x[1]);(x[0]+1;x[1]);(x[0];x[1]-1);(x[0];x[1]+1));
  nextpos:nextpos where {(y[0] within (0;X-1)) and (y[1] within (0;Y-1)) and (map . y)=(map . x)+1}[x;] @/: nextpos;
  $[count nextpos; sum find_rating each nextpos; 0]};

d10b:sum find_rating each trailheads;
