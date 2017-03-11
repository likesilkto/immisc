% decompLumChrom decompose RGB image to luminance (mean) and chrominance
%
% [lum, chrom] = decompLumChrom(img, eps)
%
%
%Output parameter:
% lum: luminance (mean) component of image
% chrom: chrominance component of image
%
%
%Input parameter:
% img: the input image
% eps: small positive value to avoid zero divid (defualt: 1E-6)
%
%
%Example:
% img = imread('img.jpg');
% [lum, chrom] = decompLumChrom(img);
% 
% % some processing for lum
%
% img = compLumChrom(lum,chrom)
%
%Version: 20170208

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Miscellaneous tools for image processing                 %
%                                                          %
% Copyright (C) 2017 Masayuki Tanaka. All rights reserved. %
%                    mtanaka@sc.e.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [lum, chrom] = decompLumChrom(img, eps)

 if( ~exist('eps', 'var') )
  eps = 1E-6;
 end

 lum = mean(img,3);
 chrom = bsxfun( @rdivide, img, lum + eps );

end
