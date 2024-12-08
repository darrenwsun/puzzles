mat:read0 `:resources/d6.txt;
X:count mat;
Y:count first mat;

(x0;y0):raze raze i,/:'c@i:where 0<count each c:where each mat="^";

visited:mat;
f:{[x;y;d]
  $[d="^";
    [
      x1:-1^last where visited[til x; y]="#";
      visited::.[visited;(1+x1+til -1+x-x1;y);:;"^"];
      if[x1>=0;f[x1+1;y;">"]]];
    d=">";
    [
      y1:Y^y+first where visited[x; y+til Y-y]="#";
      visited::.[visited;(x;1+y+til -1+y1-y);:;">"];
      if[y1<>Y;f[x;y1-1;"v"]]];
    d="v";
    [
      x1:X^x+first where visited[x+til X-x; y]="#";
      visited::.[visited;(1+x+til -1+x1-x;y);:;"v"];
      if[x1<>X;f[x1-1;y;"<"]]];
    d="<";
    [
      y1:-1^last where visited[x; til y]="#";
      visited::.[visited;(x;1+y1+til -1+y-y1);:;"<"];
      if[y1>=0;f[x;y1+1;"^"]]]
   ]};

f[x0;y0;"^"];
d6a:sum sum visited in "^v<>";

idx_visited:(raze i,/:'c@i:where 0<count each c:where each visited in "^v<>") except enlist(x0;y0);
g:{[x;y;d]
  $[d="^";
    [
      x1:-1^last where mat1[til x; y]="#";
      if[any mat1[1+x1+til -1+x-x1;y]="^"; :1b];
      mat1::.[mat1;(1+x1+til -1+x-x1;y);:;"^"];
      $[x1>=0;g[x1+1;y;">"];0b]];
    d=">";
    [
      y1:Y^y+first where mat1[x; y+til Y-y]="#";
      if[any mat1[x;1+y+til -1+y1-y]=">"; :1b];
      mat1::.[mat1;(x;1+y+til -1+y1-y);:;">"];
      $[y1<>Y;g[x;y1-1;"v"];0b]];
    d="v";
    [
      x1:X^x+first where mat1[x+til X-x; y]="#";
      if[any mat1[1+x+til -1+x1-x;y]="v"; :1b];
      mat1::.[mat1;(1+x+til -1+x1-x;y);:;"v"];
      $[x1<>X;g[x1-1;y;"<"];0b]];
    d="<";
    [
      y1:-1^last where mat1[x; til y]="#";
      if[any mat1[x;1+y1+til -1+y-y1]="<"; :1b];
      mat1::.[mat1;(x;1+y1+til -1+y-y1);:;"<"];
      $[y1>=0;g[x;y1+1;"^"];0b]]
   ]};

d6b:sum {`mat1 set .[mat;x;:;"#"]; g[x0;y0;"^"]} each idx_visited;
