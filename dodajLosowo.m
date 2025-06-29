function [out] = dodajLosowo(img)

[w,k] = size(img);
out = img;
ile = input("Ile chcesz wprowadzic przeszkod? ");

for i=1:ile
        
    x0 = randi([1,k]);
    y0 = randi([1 w]);
    a = randi([2 20]);
     out = insertShape(out,'filled-rectangle',[x0,y0,a,a],'Color', 'black', 'Opacity', 1);
     out = rgb2gray(out);
    
  

end

