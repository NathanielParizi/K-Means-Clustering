%% Nathaniel Parizi
% Machine Learning 
%%
clc
clear all

% Adjustable Parameters
k=6;
threshold = .68;
%%
%Load image2 image

I = double(imread('image3.jpg'));
[row, col, x] = size(I);
input =reshape(I,row*col,3);

%%
% Fuzzy C Means
[center,U] = fcm(input,k);

% Finding the pixels for each class
maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);
index3 = find(U(3,:) == maxU);
index4 = find(U(4,:) == maxU);
index5 = find(U(5,:) == maxU);
index6 = find(U(6,:) == maxU);
%%
% Assigning pixel to each class
input(1:length(input))=0;       
input(index1)= 1;
input(index2)= 0.9;
input(index3)= 0.7;
input(index4)= 0.5;
input(index5)= 0.3;
input(index6)= 0.1;
[nRows nCols ]=size(U);
%%
% ITERATE THROUGH U 
renew=input;
for u = 1:k 
   for m = 1:nCols
       
       
        if U(u,m)< threshold
            input(m,:)=0;
            
            
        end
        
        
        
   end
   
   
    %Reshape input and display each result
    input = reshape(input,row,col,3);
    figure;imshow(input,[]);impixelinfo;
    input=renew;
 
end

       