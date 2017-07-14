%read the dir and re-rank it
img_Name = '5.jpg';
img_Path_list = dir('*.jpg');
len = size(img_Path_list);
len = len(1);

for i = 1:1:len
    scores(i).picName = img_Path_list(i).name;
    scores(i).score = 0;
end

for j=1:1:len
    eldscore(j) = Penalty(img_Name,scores(j).picName);
end

for k=1:1:len
    scores(k).score = (sum(eldscore)-eldscore(k))/(len-1) + eldscore(k);
end

[score,num] = sort([scores.score]);

num = fliplr(num);

for j=1:1:len
    t=scores(num(j)).picName;
    picture(j).name = t;
end

for j=1:1:5
    img = imread(picture(j).name);
    subplot(1,5,j);
    imshow(img);
end