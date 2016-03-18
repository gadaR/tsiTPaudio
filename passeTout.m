function [ res ] = passeTout( D, Signal )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
g=0.5;

B = zeros(1,D+1);
B(1)=-g

B(D+1) = 1

A=zeros(1,D+1);
A(1)=1;
A(D+1)=g;
res = filter(B,A,Signal);

end

