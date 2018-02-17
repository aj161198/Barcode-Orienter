i = imread('C:\Users\ADMIN\Desktop\book1.jpg');
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
for i = 1  :480
    for j = 1 : 640
        if (BW4(i, j) ~= 0)
            X = [X j];
            Y = [Y i];
        end
    end
end
C = cov(X,Y);
[V D] = eig(C);
phi = radtodeg(atan2(V(1, 1), V(1, 2)));
B = imrotate(I, -(90 + phi));
figure(7), imshow(B);
