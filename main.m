clear all
clc

%start = [12.0,68.0,0]; % Zygzak
%goal = [57.0,44.0,0];

%start = [28.0,20.0,0]; % N
%goal = [70.0,78.0,0];

% start = [34.0,168.0,0]; % Dywan
% goal = [174.0,10.0,0];



jakiObraz = input("Jesli chcesz wybrac mape wpisz 1, jesli dodac wlasne przeszkody wybierz 2: ");

switch jakiObraz
    case 1
        [filename, pathname] = uigetfile({'*.jpg;*.png;*.bmp;*.tif', 'Pliki obrazów (*.jpg, *.png, *.bmp, *.tif)'; '*.*', 'Wszystkie pliki (*.*)'}, 'Wybierz plik obrazu');
        fullFileName = fullfile(pathname, filename);
        img = imread(fullFileName);
    case 2
        in = imread('map.png');
        img = dodajPrzeszkody(in);
    otherwise
        error('Podano bledny numer')
        

end

metoda = input("Ktora metode chcesz wybrac? \n RRT wpisz 1, PRM wpisz 2: ");
 xs = input("Podaj wspolrzedna x punktu poczatkowego ");
 ys = input("Podaj wspolrzedna y punktu poczatkowego ");
 kierunekS = input("Podaj obrot punktu poczatkowego ");
 start = [xs,ys, kierunekS];

 xg = input("Podaj wspolrzedna x punktu koncowego: ");
 yg = input("Podaj wspolrzedna y punktu koncowego: ");
 kierunekG = input("Podaj obrot punktu  koncowego: ");
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
