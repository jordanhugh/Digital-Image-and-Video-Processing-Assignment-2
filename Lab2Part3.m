% Clear the work space and close all open figure windows
clear; 
close all; 
clc;

g1 = gaussfilt(1, 21, "combined");
g2 = gaussfilt(10, 21, "combined");
g3 = gaussfilt(100, 21, "combined");

figure(1);
subplot(1,3,1);
surf(g1);
xlabel('x', 'fontsize', 12);
ylabel('y', 'fontsize', 12);
zlabel('G(x, y)', 'fontsize', 12);
title('Sigma = 1, Filter Size = 50');

subplot(1,3,2);
surf(g2);
xlabel('x', 'fontsize', 12);
ylabel('y', 'fontsize', 12);
zlabel('G(x, y)', 'fontsize', 12);
title('Sigma = 10, Filter Size = 50');

subplot(1,3,3);
surf(g3);
xlabel('x', 'fontsize', 12);
ylabel('y', 'fontsize', 12);
zlabel('G(x, y)', 'fontsize', 12);
title('Sigma = 100, Filter Size = 50');

% % Clear the work space and close all open figure windows
% clear; 
% close all; 
% clc;
% 
% % Read in the picture name
% name = ('pool.01.bmp');
% name = ['C:\Users\hughj\Pictures\', name];
% 
% % Read in the picture data
% pic = imread(name);
% 
% % Display the image in a figure window
% figure(1);
% image(pic);
% colormap(gray(256));
% shg;
% 
% filter = gaussfilt(10, 21, "seperable");
% 
% tic;
% for i = 1:10
%     newpic = imfilter(pic, filter);
%     newpic = imfilter(newpic, filter');
% end
% toc;
% 
% figure(2);
% image(newpic);
% colormap(gray(256));
% shg;
% 
% filter = gaussfilt(10, 21, "combined");
% 
% tic;
% for i = 1:10
%     newpic = imfilter(pic, filter);
% end
% toc;
% 
% figure(3);
% image(newpic);
% colormap(gray(256));
% shg;