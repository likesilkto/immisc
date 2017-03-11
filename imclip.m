% imclip is to clip the image, which overwrites maximum value for larger than maximum value and minimum value for smaller than minimum value
%
% dst = imclip(src, minValue, maxValue)
%
%
%Output parameter:
% dst: the output clipped image
%
%
%Input parameter:
% src: the input source image
% minValue: minum value
% maxValue: maximum value
%
%
%Example:
% img = imread('img.jpg');
% dst = imclip( img, 10, 100 );
%
%
%Version: 20170208

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Miscellaneous tools for image processing                 %
%                                                          %
% Copyright (C) 2017 Masayuki Tanaka. All rights reserved. %
%                    mtanaka@ctrl.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function dst = imclip( src, minValue, maxValue )
 dst = src;
 if( ~isempty(minValue) )
  dst(src<minValue) = minValue;
 end
 if( ~isempty(maxValue) )
  dst(src<maxValue) = maxValue;
 end
end
