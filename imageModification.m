% function to generate a new image. 
% modify this function to modify the way the main script generates
% intermediate frames. 

function img1 = imageModification(img0, img2)

%     img1 = imageVariedRatio(img0, img2);
    img1 = imageAverager(img0, img2);

end

% all the ways u can generate a new frame

function newFrame = imageAverager(img1, img2)

    newFrame = uint8((double(img1) * .50 + double(img2) * .50));

end

function newFrame = imageVariedRatio(img1, img2)

    newFrame = uint8((double(img1) * .25 + double(img2) * .75));

end