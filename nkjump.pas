program bt;
Const   inp='';
        out='';
        Nmax=1000;
Var N:integer;
    a:array [1..Nmax] of longint;
    f:array [1..Nmax] of longint;
    i,j,z,M:longint;
    fi,fo:text;
Function max(a,b,c:longint):longint;
Begin
    if (a>b) and (a>c) then exit(a)
    else
      if b>c then exit(b) else exit(c);
End;

Procedure QuickSort(l,r:longint);
Var i,j:longint;
    key,TG:longint;

Begin
    if l>=r then exit;
    key:=a[(l+r) div 2];
    i:=l; j:=r;
    Repeat
      While a[i]<key do inc(i);
      While a[j]>key do dec(j);
      if i<=j then
        Begin
          TG:=a[i];
          a[i]:=a[j];
          a[j]:=TG;
          inc(i); dec(j);
        End;
    Until i>j;
    QuickSort(l,j);
    QuickSort(i,r);
End;
BEGIN
    assign(fi,inp);
    reset(fi);
    assign(fo,out);
    rewrite(fo);
    readln(fi,N);

    for i:=1 to N do read(fi,a[i]);

    QuickSort(1,N);

    f[1]:=1; f[2]:=1;
    M:=1;

    for z:=3 to N do
      Begin
        i:=1; j:=z-1;
        While i<j do
          Begin
            While (i<j) and (a[i]+a[j]<>a[z]) do
              if a[i]+a[j]>a[z] then dec(j) else inc(i);
            if (a[i]+a[j]=a[z]) and (i<>j) then
              Begin
                f[z]:=max(f[z],f[i]+1,f[j]+1);
                inc(i);
                dec(j);
              End;
          End;
          if f[z]<1 then f[z]:=1;
        if f[z]>M then M:=f[z];
      End;
    writeln(fo,M);
    close(fi);
    close(fo);
END.
