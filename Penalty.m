function [penalty] = Penalty(Img,Probe)
    img   = imread(Img);
    probe = imread(Probe);
    
    img = imresize(img,[256,128]);
    probe = imresize(probe,[256,128]);
    
    distance = ImgDistance(img,probe,10);
    
    penalty = 1/(1+exp((distance^2)/4));
end

