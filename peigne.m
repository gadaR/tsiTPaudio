function [ res ] = peigne( D, Signal )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
B = zeros(1,D+1);
B(1)=1
B(D+1) = 1
A=1;
res = filter(B,A,Signal);

end

