% Clear the work space and close all open figure windows
clear; 
close all; 
clc;

% Read in the picture name
name = ('SavedScreen.png');
name = ['/Users/hughj/Pictures/', name];

% Read in the picture data
pic = imread(name);

% Extract each colour channel
red_channel = pic(:, :, 1);
green_channel = pic(:, :, 2);
blue_channel = pic(:, :, 3);

% Initialise Gaussian filter
std = power(2.5, 2);
num = 15;
gaussfilter = gaussfilt(std, num, "seperable");

% Apply filter to each channel
red_channel = imfilter(red_channel, gaussfilter);
red_channel = imfilter(red_channel, gaussfilter');
green_channel = imfilter(green_channel, gaussfilter);
green_channel = imfilter(green_channel, gaussfilter');
blue_channel = imfilter(blue_channel, gaussfilter);
blue_channel = imfilter(blue_channel, gaussfilter');

% Concatenate all the colour channels
lpfoutput = cat(3, red_channel, green_channel, blue_channel);

% Calculate the fraction of high pass information that is added back
% into the image
gain = 2.5;
f = gain*(pic - lpfoutput);

% Sharpen image
newpic = pic + f;

% Display original image in a figure window
figure(1);
imshow(pic);
% image(pic);
colormap(gray(256));
shg;

% Display sharpened image in a figure window
figure(2);
imshow(pic);
% image(newpic);
colormap(gray(256));
shg;