close all; clear all;
addpath './metrics/'
img = im2double(imread('IMGs/2/IMGnoise.png')); 
imRef = im2double(imread('IMGs/2/IMGref.png'));

%% pre-define parameters
para.sigma_s = 3;    % spatial sigma
para.sigma_r = 0.01; % range sigma
para.num_iters = 5;  % iteration number
%
para.lambda = 0.01; % smoothing parameter
[our_S,our_R] = TF(img,para);
figure;imshow([img imRef our_S]);title('Original & Reference & our\_TF')

SSIM_Ours = ssim_index(mean(im2double(our_S)*255,3),mean(im2double(imRef)*255,3) )
PSNR_Ours = psnr (im2double(our_S)*255,im2double(imRef)*255)

