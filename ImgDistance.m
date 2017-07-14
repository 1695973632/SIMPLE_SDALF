function[distance] = ImgDistance(Imgi,Probej,theta)
    [Ih,Is,Iv] = imgConvert(Imgi);
    [Ph,Ps,Pv] = imgConvert(Probej);
    
    %获取图片大小：基本所有图片大小固定
    imgSize = size(Imgi);
    
    y1 = round(1/5*imgSize(1));
    y2 = round(1/2*imgSize(1));
    x2 = round(1/2*imgSize(2));
    x1 = round(4/9*imgSize(2));
    
    %头部与上胸(此处只适用差异强化)
    
    %空间分布覆盖函数，得出双边操作符计算出的双边差距，除去背景噪声(强化差异函数)
    S_iHLRect_h = Ih(y1-theta:y1,:)-Ph(y1-theta:y1,:)-(Ih(y1:y1+theta,:)-Ph(y1:y1+theta,:));
    S_iHLRect_s = Is(y1-theta:y1,:)-Ps(y1-theta:y1,:)-(Is(y1:y1+theta,:)-Ps(y1:y1+theta,:));
    S_iHLRect_v = Iv(y1-theta:y1,:)-Pv(y1-theta:y1,:)-(Iv(y1:y1+theta,:)-Pv(y1:y1+theta,:));
    
    S_iHLRect = 1/(30*theta)*abs(S_iHLRect_h+S_iHLRect_s+S_iHLRect_v);
    
    %上半身与下半身
    
    %hsv双边操作符，用于计算两张图之间的差异,通过像素点欧几里德距离得出
    C_iTLRect_h = Ih(y1-theta:y1+theta,:)-Ph(y1-theta:y1+theta,:);
    C_iTLRect_s = Is(y1-theta:y1+theta,:)-Ps(y1-theta:y1+theta,:);
    C_iTLRect_v = Iv(y1-theta:y1+theta,:)-Pv(y1-theta:y1+theta,:);
    
    C_iTLRect =  C_iTLRect_h.^2 + C_iTLRect_s.^2 + C_iTLRect_v.^2;
    
    %空间分布覆盖函数，得出双边操作符计算出的双边差距，除去背景噪声(强化差异函数)
    S_iTLRect_h = Ih(y2-theta:y2,:)-Ph(y2-theta:y2,:)-(Ih(y2:y2+theta,:)-Ph(y2:y2+theta,:));
    S_iTLRect_s = Is(y2-theta:y2,:)-Ps(y2-theta:y2,:)-(Is(y2:y2+theta,:)-Ps(y2:y2+theta,:));
    S_iTLRect_v = Iv(y2-theta:y2,:)-Pv(y2-theta:y2,:)-(Iv(y2:y2+theta,:)-Pv(y2:y2+theta,:));
    
    S_iTLRect = 1/(30*theta)*abs(S_iTLRect_h+S_iTLRect_s+S_iTLRect_v);
    
    
    %身体左右两部分（上半身）
    %hsv双边操作符，用于计算两张图之间的差异,通过像素点欧几里德距离得出
    C_jlr1Rect_h = Ih(y1:y2,x1-theta:x1+theta)-Ph(y1:y2,x1-theta:x1+theta);
    C_jlr1Rect_s = Is(y1:y2,x1-theta:x1+theta)-Ps(y1:y2,x1-theta:x1+theta);
    C_jlr1Rect_v = Iv(y1:y2,x1-theta:x1+theta)-Pv(y1:y2,x1-theta:x1+theta);
    
    C_jlr1Rect =  C_jlr1Rect_h.^2 + C_jlr1Rect_s.^2 + C_jlr1Rect_v.^2;
    
    %空间分布覆盖函数，得出双边操作符计算出的双边差距，除去背景噪声(强化差异函数)
    S_jrl1Rect_h = Ih(y1:y2,x1-theta:x1)-Ph(y1:y2,x1-theta:x1)-(Ih(y1:y2,x1:x1+theta)-Ph(y1:y2,x1:x1+theta));
    S_jrl1Rect_s = Is(y1:y2,x1-theta:x1)-Ps(y1:y2,x1-theta:x1)-(Is(y1:y2,x1:x1+theta)-Ps(y1:y2,x1:x1+theta));
    S_jrl1Rect_v = Iv(y1:y2,x1-theta:x1)-Pv(y1:y2,x1-theta:x1)-(Iv(y1:y2,x1:x1+theta)-Pv(y1:y2,x1:x1+theta));
    
    S_jrl1Rect = 1/(30*theta)*abs(S_jrl1Rect_h+S_jrl1Rect_s+S_jrl1Rect_v);
    
    %身体左右两部分（下半身）
     %hsv双边操作符，用于计算两张图之间的差异,通过像素点欧几里德距离得出
    C_jlr2Rect_h = Ih(y2:256,x2-theta:x2+theta)-Ph(y2:256,x2-theta:x2+theta);
    C_jlr2Rect_s = Is(y2:256,x2-theta:x2+theta)-Ps(y2:256,x2-theta:x2+theta);
    C_jlr2Rect_v = Iv(y2:256,x2-theta:x2+theta)-Pv(y2:256,x2-theta:x2+theta);
    
    C_jlr2Rect =  C_jlr2Rect_h.^2 + C_jlr2Rect_s.^2 + C_jlr2Rect_v.^2;
    
    %空间分布覆盖函数，得出双边操作符计算出的双边差距，除去背景噪声(强化差异函数)
    S_jrl2Rect_h = Ih(y2:256,x2-theta:x2)-Ph(y2:256,x2-theta:x2)-(Ih(y2:256,x2:x2+theta)-Ph(y2:256,x2:x2+theta));
    S_jrl2Rect_s = Is(y2:256,x2-theta:x2)-Ps(y2:256,x2-theta:x2)-(Is(y2:256,x2:x2+theta)-Ps(y2:256,x2:x2+theta));
    S_jrl2Rect_v = Iv(y2:256,x2-theta:x2)-Pv(y2:256,x2-theta:x2)-(Iv(y2:256,x2:x2+theta)-Pv(y2:256,x2:x2+theta));
    
    S_jrl2Rect = 1/(30*theta)*abs(S_jrl2Rect_h+S_jrl2Rect_s+S_jrl2Rect_v);
    
    distance = sum(sum(S_iHLRect))+sum(sum(C_iTLRect))+sum(sum(S_iTLRect))+sum(sum(C_jlr1Rect))+sum(sum(S_jrl1Rect))+sum(sum(C_jlr2Rect))+sum(sum(S_jrl2Rect));
    distance = distance / 600;
end