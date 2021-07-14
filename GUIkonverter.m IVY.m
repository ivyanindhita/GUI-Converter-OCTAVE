function convertku()
  
g=figure(1, 'position', [100 100 800 500]);
%get(g)
ax1 = axes('position', [0.1 0.21 0.2 0.3],'color', [0.5 0.5 0.5])
text1 = uicontrol('style','text','position',[700 600 600 100],'string','Konversi RGB ke Gray','fontsize',24)
text2 = uicontrol('style','text','position',[600 450 80 30],'string','Nilai A : ');
edit1 = uicontrol('style','edit','position',[700 450 40 30],'string','');
text3 = uicontrol('style','text','position',[600 400 80 30],'string','Nilai B : ');
edit2 = uicontrol('style','edit','position',[700 400 40 30],'string','');
text4 = uicontrol('style','text','position',[600 350 80 30],'string','Nilai C: ');
edit3 = uicontrol('style','edit','position',[700 350 40 30],'string',' ');
ax2 = axes('position', [0.42 0.21 0.2 0.3],'color', [0.5 0.5 0.5])
pushbutton1 = uicontrol('style','pushbutton','position',[200 500 100 50], 'string',...
'Buka File','callback',{@Bukafile ax1})

pushbutton2 = uicontrol('style','pushbutton','position',[800 500 100 50], 'string',...
'Convert','callback',{@convert edit1 edit2 edit3 ax2})

ax3 = axes('position', [0.75 0.21 0.2 0.3],'color', [0.5 0.5 0.5])
text5 = uicontrol('style','text','position',[1220 450 80 30],'string','Nilai D : ');
edit4 = uicontrol('style','edit','position',[1320 450 40 30],'string','');
text6 = uicontrol('style','text','position',[1220 400 80 30],'string','Nilai E : ');
edit5 = uicontrol('style','edit','position',[1320 400 40 30],'string','');
text7 = uicontrol('style','text','position',[1220 350 80 30],'string','Nilai F: ');
edit6 = uicontrol('style','edit','position',[1320 350 40 30],'string',' ');

pushbutton3 = uicontrol('style','pushbutton','position',[1440 500 100 50], 'string',...
'Bring Back','callback',{@bringback edit4 edit5 edit6 ax3})
endfunction
function Bukafile(hObject, eventdata, ax1)
  [namafile pathfile] = uigetfile('*.jpg',  'buka file jpg')
  img1 = imread([pathfile namafile]);
  axes(ax1);
  imshow(img1);
  save img1.mat img1
endfunction

function convert(hObject, eventdata,edit1,edit2,edit3,ax2)
 load img1.mat
 a= str2num(get(edit1,'string'));
 b= str2num(get(edit2,'string'));
 c= str2num(get(edit3,'string'));
 
R=img1(:,:,1);
G=img1(:,:,2);
B=img1(:,:,3);

Gray=a*R+b*G+c*B;
axes(ax2)
imshow(Gray)

save Gray.mat Gray
endfunction

function bringback(hObject, eventdata, edit4,edit5,edit6,ax3)
  load Gray.mat 
 d= str2num(get(edit4,'string'));
 e= str2num(get(edit5,'string'));
 f= str2num(get(edit6,'string'));
 
R = d*Gray;
G = e*Gray;
B = f*Gray;
 
img2(:,:,1)=R;
img2(:,:,2)=G;
img2(:,:,3)=B;

axes(ax3)
imshow(img2); 

endfunction