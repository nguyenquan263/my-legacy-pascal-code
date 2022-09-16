const fi='';
      fo='';
      Nmax=1000000;

type data=longint;

var n: data;
    min,max,sl,slmin,slmax,kq,kq1,kq2: int64;
    a,s: array [1..Nmax] of int64;
    f: text;

Procedure doc;
    var i: data;
    begin
        assign(f,fi);
        reset(f);
        readln(f,n);
        for i:=1 to n do
            read(f,a[i]);
        close(f);
    end;

Procedure tinhtong;
    var i: data;
    begin
        max:=-1000000000000000000;
        min:=1000000000000000000;
        s[1]:=a[1];
        for i:=2 to n do
            begin
                s[i]:=s[i-1] + a[i];

                if s[i]=max then
                    inc(slmax)
                else
                    if s[i]>max then
                        begin
                            slmax:=1;
                            max:=s[i];
                        end;

                if s[i]=min then
                    inc(slmin)
                else
                    if s[i]<min then
                        begin
                            slmin:=1;
                            min:=s[i];
                        end;
            end;
    end;

Procedure TH_bang;
    begin
        kq:=kq1;
        if (slmax=slmin) and (slmin=1) then
            sl:=2
        else
            if slmax>slmin then
                sl:=(slmax*(slmax+1)) div 2
            else
                sl:=(slmin*(slmin+1)) div 2;
    end;

Procedure xuli;
    begin
        kq1:=2*max - s[n];
        kq2:=abs(2*min - s[n]);
        if kq1>kq2 then
            begin
                kq:=kq1;
                sl:=(slmax*(slmax+1)) div 2;
            end
        else
            if kq1<kq2 then
                begin
                    kq:=kq2;
                    sl:=(slmin*(slmin+1)) div 2;
                end
            else
                TH_bang;
    end;

Procedure ghi;
    begin
        assign(f,fo);
        rewrite(f);
        write(f,kq,' ',sl);
        close(f);
    end;


    BEGIN
        doc;
        tinhtong;
        xuli;
        ghi;
    END.