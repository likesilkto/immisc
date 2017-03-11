% compLumChrom compose luminance (mean) and chrominance to RGB image
%
% img = decompLumChrom(lum, chrom, eps)
%
%
%Output parameter:
% img: the output image
%
%
%Input parameter:
% lum: luminance (mean) component of image
% chrom: chrominance component of image
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
function img = compLumChrom(lum, chrom, eps)

 if( ~exist('eps', 'var') )
  eps = 1E-6;
 end

 img = bsxfun( @times, chrom, lum + eps );

end
