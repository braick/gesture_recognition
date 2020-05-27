clear;

cam = webcam(1);
cam.Resolution = '320x240';
figure(1);
cam.preview;
load trained_resnet18_v1.mat;

while(true)
im = cam.snapshot;

mask = semanticseg(im, net);

figure(2);
imshow(label2rgb(mask));
end