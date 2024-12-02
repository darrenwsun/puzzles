input:"I"$" " vs/: read0 `:resources/d2.txt;

safe:{(1=count distinct signum diffs)&all 4>abs diffs:-1 _ x-next x};
d2a:sum safe each input;
d2b:sum {any {safe x where (til count x)<>y}[x;] each til count x} each input;
