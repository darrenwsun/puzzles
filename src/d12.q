garden:read0 `:resources/d12.txt;
X:count garden; Y:count first garden;
visited:`boolean$garden&0;

solve_d12a:{
  loc:first_unvisited[];
  total:0;
  while[count loc;
        `new_visited set visited and 0b;
        explore loc;
        //show "visited map:";
        //show new_visited;
        update_visited new_visited;
        price:calc_price new_visited;
        //show "price for ",.Q.s1[loc],": ",string price;
        total+:price;
        loc:first_unvisited[]];
  total };

first_unvisited:{first raze i,/:'c@i:where 0<count each c:where each not visited};

explore:{
  new_visited[x[0];x[1]]:1b;
  nextlocs:locs where {(not new_visited . y) and (y[0] within (0;X-1)) and (y[1] within (0;Y-1)) and (garden . x)=(garden . y)}[x;] each locs:((x[0]-1;x[1]);(x[0]+1;x[1]);(x[0];x[1]-1);(x[0];x[1]+1));
  if[count nextlocs; explore each nextlocs]; }

update_visited:{`visited set visited | x};

calc_price:{
  area:sum sum x;
  locs:raze i,/:'c@i:where 0<count each c:where each x;
  perimeter:sum {sum {(not y[0] within (0;X-1)) or (not y[1] within (0;Y-1)) or (garden . x)<>(garden . y)}[x;] each ((x[0]-1;x[1]);(x[0]+1;x[1]);(x[0];x[1]-1);(x[0];x[1]+1))} each locs;
  area*perimeter };

d12a:solve_d12a[];