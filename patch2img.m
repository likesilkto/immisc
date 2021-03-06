% patch2img compose image from columned image patches by averaging
% 
% [image, value, weight] = patch2img(X, [pn pm], [in im] )
%
%
%Output parameter:
% image: composed image
% value: sum of pixel value for each pixel
% weight: number of patches for each pixel
%
%Input parameters:
% X: columned image patches generated by img2patch
% [pn pm]: size of patch
% [in im]: size of image
%
%
%Example:
% img = double(imread('img.jpg'));
% X = img2patch(img,[6 6]);
% image = patch2img(X,[6 6],size(img));
%
%Version: 20120629

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Miscellaneous tools for image processing                 %
%                                                          %
% Copyright (C) 2012 Masayuki Tanaka. All rights reserved. %
%                    mtanaka@ctrl.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [image, value, weight] = patch2img(X, mn, mnImg )

step = mn(1) * mn(2);

image = [];
value = [];
weight = [];

for cha=1:step:size(X,1)
 [im, va, we] = patch2gry(X(cha:cha+step-1,:), mn, mnImg );
 image = cat(3,image, im);
 value = cat(3,value, va);
 weight= cat(3,weight,we);
end

function [image, value, weight] = patch2gry(X, mn, mnImg )
m = mn(1);
n = mn(2);
mImg = mnImg(1);
nImg = mnImg(2);

lw = ones(m,n);

weight = zeros(mImg, nImg);
value = zeros(mImg, nImg);

k = 1;
for j=1:nImg-n+1
  for i=1:mImg-m+1
   weight(i:i+m-1,j:j+n-1) = weight(i:i+m-1,j:j+n-1) + lw;
   value (i:i+m-1,j:j+n-1) = value (i:i+m-1,j:j+n-1) + reshape(X(:,k),[m n]);
   k = k + 1;
  end
end
image = value ./ weight;
