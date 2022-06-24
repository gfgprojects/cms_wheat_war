input TEX;
prologues:=3;
beginfig(1);
u:=-0.5cm;
y:=0.5cm;    %height of a row 
j:=0;        %livello inferiore della riga che si sta considerando. dunque, il livello superiore e' j+y 
du:=0.23cm;
dcol:=5mm;
ldis:=0.5mm;
scalelabels:=0.4;
scalelabels1:=0.2;
scalelabels2:=0.6;

string area[];
input mpinput_areas_effects;
for i=1 upto 11:
	label.lft(TEX(area[i]) scaled scalelabels2,(u,-i*y));
endfor

%draw nino effects on import and prices

u:=0.0cm;  %width of a month
input mpinput1nino;
input mpdrawsquares;
label(btex Mar etex scaled scalelabels2 rotated 90,(u,0));

u:=u+dcol;
input mpinput2nino;
input mpdrawsquares;
label(btex Apr etex scaled scalelabels2 rotated 90,(u,0));

u:=u+dcol;
input mpinput3nino;
input mpdrawsquares;
label(btex May etex scaled scalelabels2 rotated 90,(u,0));

u:=u+dcol;
input mpinput4nino;
input mpdrawsquares;
label(btex Jun etex scaled scalelabels2 rotated 90,(u,0));

u:=u+dcol;
input mpinput5nino;
input mpdrawsquares;
label(btex Jul etex scaled scalelabels2 rotated 90,(u,0));

u:=u+dcol;
input mpinput6nino;
input mpdrawsquares;
label(btex Aug etex scaled scalelabels2 rotated 90,(u,0));

u:=u+dcol;
input mpinput7nino;
input mpdrawsquares;
label(btex Sep etex scaled scalelabels2 rotated 90,(u,0));

u:=u+dcol;
input mpinput8nino;
input mpdrawsquares;
label(btex Oct etex scaled scalelabels2 rotated 90,(u,0));

u:=u+dcol;
input mpinput9nino;
input mpdrawsquares;
label(btex Nov etex scaled scalelabels2 rotated 90,(u,0));

u:=u+dcol;
input mpinput10nino;
input mpdrawsquares;
label(btex Dec etex scaled scalelabels2 rotated 90,(u,0));





%draw nina effects on import and prices

u:=6.5cm;  %width of a month
input mpinput1nina;
input mpdrawsquares;
label(btex Year 0 etex scaled 0.5 rotated 90,(u,0+2pt));

u:=u+dcol;
input mpinput2nina;
input mpdrawsquares;
label(btex Year 1 etex scaled 0.5 rotated 90,(u,0+2pt));


label(btex Months in year 0 etex scaled scalelabels2,(2.25cm,-12*y));
label(btex Years etex scaled scalelabels2,(6.75cm,-12*y));

z10 = llcorner currentpicture;  y10 := y10-10pt;x10 := x10-10pt;
z30 = urcorner currentpicture;  y30 := y30-q0pt;x30 := x30+10pt;
z20 = lrcorner currentpicture;
z40 = ulcorner currentpicture;
%z20 = (x30, y10);
%z40 = (x10, x30);
%setbounds currentpicture to z10--z20--z30--z40--cycle;
setbounds currentpicture to (-2.5cm,-6.3cm)--(8.5cm,-6.3cm)--(8.5cm,0.5cm)--(-2.5cm,0.5cm)--cycle;

endfig;
end;
