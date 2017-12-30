
iskelet=imread('iskelet.jpg');
iskelet=rgb2gray(iskelet);
% dogru
a=im2double(iskelet);
%  dogru
laplacian=fspecial('laplacian',0.4);
b=imfilter(a,laplacian);
% dogru
c=abs(a-b);


sobel = fspecial('sobel');
d=imfilter(a,sobel);
% d= edge(a,'sobel',0.1) ;

average = fspecial('average', [5 5]);
e=filter2(average,d);

mask=immultiply(c,e);
f=conv2(a,mask,'same');

% g=imadd(a+f);

figure(1);
subplot(2,4,1);imshow(a);title('original');
subplot(2,4,2);imshow(b);title('laplacian');
subplot(2,4,3);imshow(c);title('subtrackting a -b');
subplot(2,4,4);imshow(d);title('a with sobel filter');
subplot(2,4,5);imshow(e);title('d with 5*5 filter');
subplot(2,4,6);imshow(f);title('product of e and c');
subplot(2,4,7);imshow(g);title('sum of a and f');


