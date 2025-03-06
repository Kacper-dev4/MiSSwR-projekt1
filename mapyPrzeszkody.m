img = imread("map.png");

out = dodajPrzeszkody(img);

out = imbinarize(out);


imshow(out)