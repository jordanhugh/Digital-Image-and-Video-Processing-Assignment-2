% Clear the work space and close all open figure windows
clear; 
close all; 
clc;

% Read in the picture name
name = ('pool.01.bmp');
name = ['C:\Users\hughj\Pictures\', name];

% Read in the picture data
pic = imread(name);

% Display the image in a figure window
figure(1);
image(pic);
colormap(gray(256));
shg;

% Display histogram of image in a figure window
figure(2);
histogram(pic(:),(0:255));
shg;

% Find segment of image containing table
t1 = 55;
t2 = 200;

mask = (pic >= t1 & pic <= t2);
mask = cast(mask, 'like', pic);
pic1 = mask.*pic;

m = ((255-0)/(200-55));
c = 0 - m * 55;
pic1 = m * pic1 + c;

mask = (pic >= t2);
mask = cast(mask, 'like', pic);
pic2 = 255*mask;

pic = max(pic1, pic2);

figure(3);
image(pic);
colormap(gray(256));
shg;



% mask = (pic >= t1);
% mask = cast(mask, 'like', pic);
% newpic = mask.*pic;
% 
% m = ((255-0)/(200-55));
% c = 0 - m * 55;
% newpic = m * newpic + c;
% 
% % if(newpic > 255)
% %     newpic = 255;
% % end
% 
% figure(4);
% image(newpic);
% colormap(gray(256));
% shg;



% m = ((255-0)/(200-55));
% c = 0 - m * 55;
% 
% syms f(x);
% f(x) = piecewise(x<=t1, 0, (x>t1) & (x<t2), m * x + c, x>=t2, 255);
% 
% figure(4);
% fplot(f);
% xlim([0 300]);
% ylim([0, 300]);
% shg;
% 
% A = sym(pic);
% B = funm(A,f);
% pic = cast(B,'uint8');
% 
% figure(5);
% image(pic);
% colormap(gray(256));
% shg;