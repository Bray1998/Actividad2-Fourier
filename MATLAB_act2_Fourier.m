clc;
clear;
close all;

% Vector de tiempo
t = -2:0.001:2;

% Señal senoidal
f = 5;
senal_senoidal = sin(2*pi*f*t);

% Señal escalón
senal_escalon = double(t>=0);

% Señal rectangular
senal_rectangular = rectpuls(t);

% Graficar señal senoidal
figure;
plot(t,senal_senoidal);
title('Senal Senoidal');
xlabel('Tiempo');
ylabel('Amplitud');
grid on;

% Graficar señal escalón
figure;
plot(t,senal_escalon);
title('Senal Escalon');
xlabel('Tiempo');
ylabel('Amplitud');
grid on;

% Graficar señal rectangular
figure;
plot(t,senal_rectangular);
title('Pulso Rectangular');
xlabel('Tiempo');
ylabel('Amplitud');
grid on;
% Transformada de Fourier de la señal senoidal

N = length(senal_senoidal);

FFT = fft(senal_senoidal);

FFT_shift = fftshift(FFT);

Fs = 1/(t(2)-t(1));

frecuencia = (-N/2:N/2-1)*(Fs/N);

magnitud = abs(FFT_shift);

fase = angle(FFT_shift);

% Grafica de magnitud

figure;
plot(frecuencia,magnitud);
title('Magnitud del Espectro');
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
grid on;

% Grafica de fase

figure;
plot(frecuencia,fase);
title('Fase del Espectro');
xlabel('Frecuencia (Hz)');
ylabel('Fase');
grid on;