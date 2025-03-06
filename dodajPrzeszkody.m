function [out] = dodajPrzeszkody(img)

out = img;
ile = input("Ile chcesz wprowadzic przeszkod? ");

for i=1:ile
    ksztalt = input("Jaki ksztalt ma miec przeszkoda? \n 1 - kwadrat, 2 - trojkat, 3 - kolo ");
    
    switch ksztalt

        case 1
            a = input("Jaki ma być bok kwadratu? "); 
            x0 = input("Jaka ma byc wspolrzedna x lewgo gornego rogu kwadratu? "); 
            y0 = input("Jaka ma byc wspolrzedna y lewgo gornego rogu kwadratu? "); 
           
            out = insertShape(out,'filled-rectangle',[x0,y0,a,a],'Color', 'black', 'Opacity', 1);
            out = rgb2gray(out);
        case 2
            % for j=1:3
            %     x(j) = input(sprintf("Jaka ma byc wspolrzedna x %d punktu trojkata? ", j));
            %     y(j) = input(sprintf("Jaka ma byc wspolrzedna y %d punktu trojkata? ", j));
            % end
            % out = insertShape(out,'filled-polygon',[x(1),y(1),x(2),y(2),x(3),y(3)], 'Color', 'black', 'Opacity', 1);
            % out = rgb2gray(out);

            
            sideLength = input("Jaka ma byc dlugosc boku? ");  
            centerX = input("Jaka ma byc wspolrzedna x srodka trojkata? "); 
            centerY = input("Jaka ma byc wspolrzedna y srodka trojkata? "); 
           
            height = (sqrt(3)/2) * sideLength;
            
            % Współrzędne wierzchołków trójkąta
            x1 = centerX;
            y1 = centerY - (2/3) * height;
            
            x2 = centerX - sideLength / 2;
            y2 = centerY + (1/3) * height;
            
            x3 = centerX + sideLength / 2;
            y3 = centerY + (1/3) * height;
            
            % Tworzenie maski trójkąta
            [c,d] = size(img);
            mask = poly2mask([x1 x2 x3], [y1 y2 y3], c, d);
            
            % Nałożenie trójkąta na obraz
            
            out(mask) = 0;


        case 3

            r = input("Jaki ma byc promien kola? ");  
            x0 = input("Jaka ma byc wspolrzedna x srodka kola? "); 
            y0 = input("Jaka ma byc wspolrzedna y srodka kola? ");  
            
            out = insertShape(out, 'FilledCircle', [x0, y0, r], 'Color', 'black', 'Opacity', 1); 
            out = rgb2gray(out);
            
           
    end

end

end

