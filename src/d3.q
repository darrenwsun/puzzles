input:raze read0 `:resources/d3.txt;

d3a:{[x]
  pairs:"," vs/:first each ")" vs/:"mul(" vs x;
  pairs:pairs where {2=count x} each pairs;
  sum .[*;] flip "I"$/:pairs } input;

d3b:{[x]
  i:0; n:count x; res:0; e:1b;
  while[i<n;
       if["do()"~x[i+til 4]; e:1b; i+:4];
       if["don't()"~x[i+til 7]; e:0b; i+:7];
       $["mul("~x[i+til 4];
         [
           ic:4+i+first where ","=x[4+i+til 4];
           $[not null ic;
             [
               ip:1+ic+first where ")"=x[1+ic+til 4];
               $[not null ip;
                 [
                   l:"I"$x[4+i+til -4+ic-i];
                   r:"I"$x[1+ic+til -1+ip-ic];
                   if[e and all not null (l;r); res+:l*r];
                   i:ip+1];
                 i:ic+1]];
             i:i+4]
         ];
        i+:1]
       ];
  res
 } input;