% img2patch generates patches from image, each channel patch are concatenated to single column
% 
% X = img2patch(img,[pn pm])
%
%
%Output parameter:
% X: columned image patches, size(X,2) is pn * pm * size(img,3)
%
%Input parameters:
% img: image data
% [pn pm]: size of patch
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
function X = img2patch(img,psize)

X = [];
for cha=1:size(img,3)
 x = im2col(img(:,:,cha),psize);
 X = vertcat(X,x);
end
