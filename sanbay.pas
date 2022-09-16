program bt;
const inp='sanbay.inp';
      out='sanbay.out';
var   n,i:byte;
      x,y:string;
      f:text;
      h:array[0..101] of byte;
      dt,d,dtmax:integer;
      ax,ay,dx,dy:longint;
function dientich(i:byte;var c1,c2:byte):integer;
begin
        c1:=i;
        while (y[c1-1]=y[i]) and (h[c1-1]>=h[i]) do
                dec(c1);
        c2:=i;
        while (y[c2+1]=y[i]) and (h[c2+1]>=h[i]) do
                inc(c2);
        dientich:=h[i]*(c2-c1+1);
end;
procedure xuli;
var i,c1,c2,dem:byte;
begin
        dtmax:=0;
        assign(f,inp);
        reset(f);
        readln(f,n);
        x:='';
        for i:=1 to n do x:=x+' ';
        fillchar(h,sizeof(h),0);
        dem:=0;
        while not eof(f) do
        begin
                readln(f,y);
                dem:=dem+1;
                for i:=1 to n do
                        if (y[i]=x[i]) then inc(h[i])
                        else h[i]:=1;
                for i:=1 to n do
                begin
                        dt:=dientich(i,c1,c2);
                        if dt>dtmax then
                        begin
                                dtmax:=dt;
                                ax:=dem-h[i]+1;
                                ay:=c1;
                                dx:=dem;
                                dy:=c2;
                        end;
                end;
                x:=y;
        end;
        close(f);
end;
procedure ghi;
begin
        assign(f,out);
        rewrite(f);
        writeln(f,dtmax);
        writeln(f,ax,' ',ay);
        write(f,dx,' ',dy);
        close(f);
end;
begin
        xuli;
        ghi;
        for i:=1 to n do
            write(h[i],' ');
        readln;
end.


