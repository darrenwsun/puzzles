input:("I I";5 3 5) 0: `:resources/d1.txt;

d1a:sum abs .[-;] asc each input;
d1b:sum .Q.fu[{x*sum each x=\:y}[;input[1]]; input[0]];