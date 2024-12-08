input:": " vs/: read0 `:resources/d7.txt;
vals:"J"$first each input;
operands:" " vs/:last each input;

f:{[val;operands]
  c:-2+count operands;
  comb:c (("+";"*") cross)/ ("+";"*");
  any {[val;operands;operators]
        tc:til sumcnt:count[operands]+count[operators];
        expr:sumcnt#();
        expr:@[expr;tc where 0=tc mod 2;:;operands];
        expr:@[expr;tc where 1=tc mod 2;:;operators];
        val=value raze reverse expr
      }[val;operands;] each comb
 };

d7a:sum vals where f'[vals;operands];

.q.concat:{value string[x],string[y]};
.q.rconcat:{.q.concat[y;x]};

g:{[val;operands]
  show "running for ",string val;
  c:-2+count operands;
  comb:c ((enlist"+";enlist"*";enlist" rconcat ") cross)/ (enlist"+";enlist"*";enlist" rconcat ");
  any {[val;operands;operators]
        tc:til sumcnt:count[operands]+count[operators];
        expr:sumcnt#();
        expr:@[expr;tc where 0=tc mod 2;:;operands];
        expr:@[expr;tc where 1=tc mod 2;:;operators];
        val=value raze reverse expr
      }[val;operands;] peach comb
 };

d7b:sum vals where g'[vals;operands];
