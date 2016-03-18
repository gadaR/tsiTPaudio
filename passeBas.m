function [ res ] = passeBas( D, Signal )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

B = ones(1,D+1);
A=1;
res = filter(B,A,Signal);

end

