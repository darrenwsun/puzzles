input:"I"$' raze read0 `:resources/d9.txt;
id_count:1+count[input] div 2;


files:where input tc where 0=(tc:til count input) mod 2;
files:(0,1+where 1 _ differ files)_files;
spaces:input tc where 1=tc mod 2;
spaces:(spaces,0)#'-1;
blocks:raze files,'spaces;

i:0;
j:count[blocks]-1;
while[i<j;
      0N!"i=",string[i],"; j=",string[j];
      while[blocks[i]>=0; i+:1];
      while[blocks[j]<0; j-:1];
      if[i<j; tmp:blocks[i]; blocks[i]:blocks[j]; blocks[j]:tmp]
     ];
blocks:blocks where blocks>=0;
d9a:sum blocks*til count blocks;

