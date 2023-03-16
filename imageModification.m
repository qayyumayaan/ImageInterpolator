% function to generate a new image. 
% modify this function to modify the way the main script generates
% intermediate frames. 

function img1 = imageModification(img0, img2)

    img1 = motionCompensatedAttempt1(img0, img2);

end

% all the ways u can generate a new frame

function newFrame = imageAverager(img1, img2)

    newFrame = uint8((double(img1) * .50 + double(img2) * .50));

end

function newFrame = imageVariedRatio(img1, img2)

    newFrame = uint8((double(img1) * .25 + double(img2) * .75));

end

function newFrame = interlacer(img1, img2)

    [X, Y, Z] = size(img2);
    
    newFrame = uint8(zeros(X,Y,Z));
    
    for i = 1:X
    
        if (mod(i, 2) == 1)
            newFrame(i,1:Y,1:Z) = img1(i,1:Y,1:Z);
        else 
            newFrame(i,1:Y,1:Z) = img2(i,1:Y,1:Z);
        end
    
    end

end


function newFrame = motionCompensatedAttempt1(img1, img2) 

    gray1 = im2double(rgb2gray(img1));
    gray2 = im2double(rgb2gray(img2));
    
    % Estimate motion between the two frames
    flow = opticalFlow(gray1, gray2);
    
    % Warp the first frame to generate intermediate frame
    tform = affinetform2d([1 0 0; 0 1 0; flow.Vx(1,1) flow.Vy(1,1) 1]);
    intermediate = imwarp(img1, tform);
    newFrame = intermediate;
    
    % Blend intermediate frame with second frame

%     newFrame = imfuse(intermediate, img2, 'blend');
    
%     imshow(newFrame);
%     disp("Finished.");

end



function newFrame = motionCompensatedAttempt2(img1, img2) 

    gray1 = im2double(rgb2gray(img1));
    gray2 = im2double(rgb2gray(img2));
    
    % Estimate motion between the two frames
    flow = opticalFlow(gray1, gray2);
    newFrame = imwarp(img1, flow);


end
    