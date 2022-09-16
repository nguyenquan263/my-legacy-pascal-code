program bt;
const inp='';
      out='';
var   k,i,j:byte;
      a:array[1..8,1..8] of longint;
      f:text;
      kq,kqmax:int64;
      dlm:array[1..8] of shortint=(-2,-2,-1,1,2,2,1,-1);
      clm:array[1..8] of shortint=(-1,1,2,2,1,-1,-2,-2);
      dlv:array[1..4] of shortint=(-1,1,1,-1);
      clv:array[1..4] of shortint=(1,1,-1,-1);
      dd,dd1:array[1..8,1..8] of byte;
      tongdong,tongcot,td,tc,kqx,kqy:array[1..8] of int64;
      hx,hy,vx,vy,mx,my,xx,xy,xkqx,xkqy:byte;
      th,tv,tx,tm,thmax,tvmax,tmmax,txmax:longint;
procedure doc;
var i,x,y:byte;
    c:longint;
begin
        assign(f,inp);
        reset(f);
        readln(f,k);
        fillchar(a,sizeof(a),0);
        fillchar(td,sizeof(td),0);
        fillchar(tc,sizeof(tc),0);
        for i:=1 to k do
        begin
                readln(f,x,y,c);
                a[x,y]:=c;
                td[x]:=td[x]+a[x,y];
                tc[y]:=tc[y]+a[x,y];
        end;
        close(f);
end;
function xe(i,j:byte):int64;
var k:byte;
begin
        xe:=0;
        for k:=1 to 8 do
        begin
                if dd[i,k]=0 then
                begin
                        dd[i,k]:=1;
                        tongdong[i]:=tongdong[i]-a[i,k];
                        tongcot[k]:=tongcot[k]-a[i,k];
                end;
                if dd[k,j]=0 then
                begin
                        dd[k,j]:=1;
                        xe:=xe+a[k,j];
                        tongcot[j]:=tongcot[j]-a[k,j];
                        tongdong[k]:=tongdong[k]-a[k,j];
                end;
        end;
end;
function trong(i,j:shortint):boolean;
begin
        trong:=(i>=1) and (i<=8) and (j>=1) and (j<=8);
end;
function voi(i,j:byte):int64;
var k:byte;
    u,v:shortint;
begin
        voi:=0;
        for k:=1 to 4 do
        begin
                u:=i;
                v:=j;
                while trong(u+dlv[k],v+clv[k]) do

                begin
                        u:=u+dlv[k];
                        v:=v+clv[k];
                        if dd[u,v]=0 then
                        begin
                                dd[u,v]:=1;
                                voi:=voi+a[u,v];
                                tongdong[u]:=tongdong[u]-a[u,v];
                                tongcot[v]:=tongcot[v]-a[u,v];
                        end;
                end;
        end;
end;
function ma(i,j:byte):int64;
var u,v:shortint;
    k:byte;
begin
        ma:=0;
        for k:=1 to 8 do
        begin
                u:=i+dlm[k];
                v:=j+clm[k];
                if trong(u,v) and (dd[u,v]=0) then
                begin
                        dd[u,v]:=1;
                        ma:=ma+a[u,v];
                        tongdong[u]:=tongdong[u]-a[u,v];
                        tongcot[v]:=tongcot[v]-a[u,v];
                end;
        end;
end;
procedure xuli;
var dh,ch,dm,cm,dv,cv,i,j:byte;
    max:int64;
begin
        kq:=0;
        kqmax:=0;
        for dh:=1 to 8 do
        for ch:=1 to 8 do
        for dm:=1 to 8 do
        for cm:=1 to 8 do
        for dv:=1 to 8 do
        for cv:=1 to 8 do
        begin
                fillchar(dd1,sizeof(dd1),0);
                if not((dd1[dh,ch]=0) and (a[dh,ch]=0)) then
                        continue;
                dd1[dh,ch]:=1;
                if not((dd1[dm,cm]=0) and (a[dm,cm]=0)) then
                        continue;
                dd1[dm,cm]:=1;
                if not((dd1[dv,cv]=0) and (a[dv,cv]=0)) then
                        continue;
                dd1[dv,cv]:=1;
                tongdong:=td;
                tongcot:=tc;
                fillchar(dd,sizeof(dd),0);
                th:=xe(dh,ch)+voi(dh,ch);
                tv:=voi(dv,cv);
                tm:=ma(dm,cm);
                kq:=th+tv+tm;
                max:=0;
                for i:=1 to 8 do
                        for j:=1 to 8 do
                                if (dd1[i,j]=0) and (a[i,j]=0) then
                                        if max<tongdong[i]+tongcot[j] then
                                        begin
                                                max:=tongdong[i]+tongcot[j];
                                                tx:=max;
                                                xx:=i;
                                                xy:=j;
                                        end;
                kq:=kq+max;
                if kq>kqmax then
                begin
                        kqmax:=kq;
                        hx:=dh;
                        hy:=ch;
                        mx:=dm;
                        my:=cm;
                        vx:=dv;
                        vy:=cv;
                        xkqx:=xx;
                        xkqy:=xy;
                        thmax:=th;
                        tvmax:=tv;
                        txmax:=tx;
                        tmmax:=tm;
                        kqx:=tongdong;
                        kqy:=tongcot;
                end;
        end;
end;
procedure ghi;
var i:byte;
begin
        assign(f,out);
        rewrite(f);
        writeln(f,kqmax);
        {writeln(f,hx,' ',hy,' ',thmax);
        writeln(f,mx,' ',my,' ',tmmax);
        writeln(f,vx,' ',vy,' ',tvmax);
        writeln(f,xkqx,' ',xkqy,' ',txmax);
        for i:=1 to 8 do write(f,kqx[i],' ');
        writeln(f);
        for i:=1 to 8 do write(f,kqy[i],' ');    }

        close(f);
end;
begin
        doc;
        xuli;
        ghi;
end.


