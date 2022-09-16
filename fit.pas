program bt;
const inp='fit.inp';
      out='fit.out';
var   a,b:ansistring;
      kq:int64;
      i:longint;
      fi,fo:text;
begin
        assign(fi,inp);
        reset(fi);
        assign(fo,out);
        rewrite(fo);
        kq:=0;
        b:='';
        while not eof(fi) do
        begin
                readln(fi,a);
                a:=' '+a+' ';
                while length(b)<length(a) do b:=b+' ';
                for i:=2 to length(a)-1 do
                        if (a[i]='*') and (a[i-1]=' ') and (a[i+1]=' ') and (b[i]=' ') then
                                inc(kq);
                b:=a;
        end;
        write(fo,kq);
        close(fi);
        close(fo);
end.