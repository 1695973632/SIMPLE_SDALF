function[H,S,V] = imgConvert(img)

    %��rgb�ռ䵽HSV�ռ��ת��
    hv = rgb2hsv(img);
    %��ȡ����ͨ���ķ���
    H = hv(:,:,1);
    S = hv(:,:,2);
    V = hv(:,:,3);

end

