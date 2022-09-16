program bt;
const inp='lares.inp';
      out='lares.out';
var   n,m,k,s:longint;
      f:text;
      kq:longint;
procedure doc;
begin
        assign(f,inp);
        reset(f);
        read(f,m,n,k);
        close(f);
        s:=m+n;
end;
procedure xuli;
var i,j:longint;
begin
        i:=0;
        j:=0;
        while (i<=m) and (j<=n) do
        begin
                i:=i+2;
                j:=j+1;
                if (i div j=2) and (s-i-j>=k) then
                kq:=j;
                if s-i-j<k then exit;
        end;
end;
procedure ghi;
begin
        assign(f,out);
        rewrite(f);
        write(f,kq);
        close(f);
end;
begin
        doc;
        xuli;
        ghi;
end.


