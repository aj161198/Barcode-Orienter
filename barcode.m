i = imread('C:\Users\ADMIN\Desktop\book2.jpg');
[x1,y1,z1] = size(i);
figure(1), imshow(i);

I = rgb2gray(i);
figure(2), imshow(I);

[Gmag,Gdir] = imgradient(I);
grad = mat2gray(Gmag, [0 255]);
figure(3), imshow(grad);

BW1 = imbinarize(grad);
figure(4), imshow(BW1);

se = strel('line',11,90);
BW2 = imdilate(BW1,se);
BW3 = imerode(BW2, se);
figure(5), imshow(BW3);

BW4 = bwareafilt(BW3, 1);
figure(6), imshow(BW4);

sum = 0;
count = 0;
X = [];
Y = []; 
for i = 1  : x1
    for j = 1 : y1
        if (BW4(i, j) ~= 0)
            X = [X j];
            Y = [Y i];
        end
    end
end
C = cov(X,Y);
[V D] = eig(C);
phi = radtodeg(atan2(V(1, 1), V(1, 2)));
B = imrotate(I,90 -(phi));
figure(7), imshow(B);

BW_4 = imrotate(BW4, 90-(phi));
newBW = imerode(BW_4, se);
se_ = strel('line',11,0);
newBW = imerode(newBW, se_);
newBW = imdilate(newBW, se_);
figure(8), imshow(newBW);

comp = bwareafilt(newBW, 1);
comp = imdilate(comp, se_);
comp = imerode(comp, se_);
figure(9), imshow(comp);

[x2,y2,z2] = size(B);
stats = regionprops(comp,'BoundingBox');
subImage = imcrop(B, stats(1).BoundingBox);
figure(10), imshow(subImage);
