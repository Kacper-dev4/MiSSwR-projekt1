clear all
clc

%start = [12.0,68.0,0]; % Zygzak
%goal = [57.0,44.0,0];

%start = [28.0,20.0,0]; % N
%goal = [70.0,78.0,0];

% start = [34.0,168.0,0]; % Dywan
% goal = [174.0,10.0,0];



jakiObraz = input("Jesli chcesz wybrać mapę wpisz 1, jeśli dodać własne przeszkody wpisz 2, jeśli chcesz wybrać losowa ilość przeszkód wpisz 3 ");

switch jakiObraz
    case 1
        [filename, pathname] = uigetfile({'*.jpg;*.png;*.bmp;*.tif', 'Pliki obrazów (*.jpg, *.png, *.bmp, *.tif)'; '*.*', 'Wszystkie pliki (*.*)'}, 'Wybierz plik obrazu');
        fullFileName = fullfile(pathname, filename);
        img = imread(fullFileName);
    case 2
        in = imread('map.png');
        img = dodajPrzeszkody(in);
    case 3
        in = imread('map.png');
        img = dodajLosowo(in);
    otherwise
        error('Podano błędny numer')
        

end

metoda = input("Którą metode chcesz wybrać? \n RRT wpisz 1, PRM wpisz 2 ");
 xs = input("Podaj wspólrzędną x punktu początkowego ");
 ys = input("Podaj współrzędną y punktu początkowego ");
 kierunekS = input("Podaj obrót punktu początkowego ");
 start = [xs,ys, kierunekS];

 xg = input("Podaj współrzędną x punktu końcowego ");
 yg = input("Podaj współrzędną y punktu końcowego ");
 kierunekG = input("Podaj obrót punktu  końcowego ");
 goal = [xg,yg, kierunekG];

switch metoda
    case 1
        minTurn = 0.4;
        maxConDistance = 10.0;
        maxIterations = 300000;
        RRT(img,start,goal,minTurn,maxConDistance,maxIterations)
    case 2
        PRM(img,start,goal)
    otherwise
       disp('Podano bledny numer')
end
