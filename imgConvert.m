function[H,S,V] = imgConvert(img)

    %从rgb空间到HSV空间的转换
    hv = rgb2hsv(img);
    %获取三个通道的分量
    H = hv(:,:,1);
    S = hv(:,:,2);
    V = hv(:,:,3);

end

