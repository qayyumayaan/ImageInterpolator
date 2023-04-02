clc
clear 

disp("Importing video...");
[finalName, finalPath] = uiputfile({'*.mp4'},'Save the output video as');

if isequal(finalName,0)
    disp('User selected Cancel')
    return
end

[videoFile, videoPath, output_folder, numFrames, frameRate, IsVideoFPSInput60] = videoExtractor();

if IsVideoFPSInput60 == false
    frameRate = frameRate * 2;
end

num = 0;
img0 = imread(fullfile(output_folder, sprintf('%4d.png',num)));
while (num < numFrames)
    if (num + 2 >= numFrames) 
        break; 
    end
    img2 = imread(fullfile(output_folder, sprintf('%4d.png',num+2)));
    
    img1 = imageModification(img0, img2);
    
    imwrite(img1, fullfile(output_folder, sprintf('%4d.png',num+1)));   
    num = num + 2;
    img0 = img2;
end

disp("Video Interpolation Finished! Converting into final video...");
imagesToVideo(finalPath, frameRate, finalName, output_folder);
rmdir(output_folder,'s');