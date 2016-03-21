Fe = 16000;
Te = 1/Fe;
f = [1:Fe];
D=1;
%D=2;
mod = 2+2*cos(2*pi*f*Te*D); %this is |H(f)|²

figure(1);
plot(f, mod, 'b');
xlabel('f');
ylabel('|H(f)|²');
axis([1 Fe 0 5]);

f = [0 Fe/2 Fe];
mod = 2+2*cos(2*pi*f*Te*D);

figure(2);
stem(f, mod, '--b');
xlabel('f');
ylabel('|H(f)|²');
axis([1 Fe 0 5]);