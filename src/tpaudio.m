clc;	% Clear command window.
clear;	% Delete all variables.
close all;

[Signal,Fe]= audioread('../results/coucou/coucou.wav') ;
% soundsc(Signal/max(Signal),Fe) ;

N=length(Signal);

Te = 1/Fe;
t = (0 : N-1) * Te;
f = ((0 : N - 1)/N ) * Fe;


fourrierTransform = fft(Signal);
plot(t,fourrierTransform)
title('transformee')

% module
figure
module = abs(fourrierTransform) ;
plot(f,module)
title('Module du signal sonore')
xlabel('f');
ylabel('|H(f)|');
figure;
%--------------------
 %passe bas
imp = zeros(1,N);
imp(1)=1;

D=32;
passBas = passeBas(D,Signal);
audiowrite('../results/coucou/coucouPasseBasD32.wav', passBas/max(passBas), Fe);
% pause;
% 
% soundsc(passBas/max(passBas),Fe) ;

%2. Filtre en peigne

%y(k)=x(k)+x(k?D)

D=20;
peign = peigne(D,Signal);
audiowrite('../results/coucou/coucouPeigneD20.wav', peign, Fe);
D=3000;
peign = peigne(D,Signal);
audiowrite('../results/coucou/coucouPeigneD3000.wav', peign, Fe);
D=5000;
peign = peigne(D,Signal);
audiowrite('../results/coucou/coucouPeigneD5000.wav', peign, Fe);
% pause;
% soundsc(peign/max(peign),Fe) ;

%3. Filtre passe Tout
% y(k)=?gx(k)+x(k?D)+gy(k?D)

D=20;
ptout = passeTout(D,Signal);
audiowrite('../results/coucou/coucouPasseToutD20.wav', ptout, Fe);
D=3000;
ptout = passeTout(D,Signal);
audiowrite('../results/coucou/coucouPasseToutD3000.wav', ptout, Fe);
D=5000;
ptout = passeTout(D,Signal);
audiowrite('../results/coucou/coucouPasseToutD5000.wav', ptout, Fe);
% pause;
% soundsc(res/max(res),Fe) ;

%Reverberation 
mat= zeros (6,N);
for i=1:6
    sig = peigne(i*500,passBas);
    mat(i,1:N)= sig(1:N);
end

res = sum(mat)/6;
res = passeTout(500,res);
res = passeTout(750,res);
res = passeTout(1000,res);

% pause;
soundsc(res/max(res),Fe) ;
audiowrite('../results/coucou/coucouReverb.wav', res/max(res), Fe);

%Affichage des fonctions de transfert

f = ((0 : N - 1)/N ) * Fe;
f2 = f-(Fe/2)
h = passeTout(20,imp);
fourrierTransform = fft(h);
plot(f,fourrierTransform)
title('transformee')

% module
figure
module = abs(fourrierTransform) ;
plot(f,module)
title('Module du passe tout D=20')
xlabel('f');
ylabel('|H(f)|');

%TFD
figure;
tfd = fftshift(module); 
plot(f2,tfd)
title('tfd')

% %ifft
% figure;
% foo = ifft(tfd) ;
% plot(f,foo)
% title('foo')