function [videoFile, videoPath, output_folder, numFrames, originalFrameRate, IsVideoFPSInput60] = videoExtractor()

    % Prompt the user to select a video file
    [videoFile,videoPath] = uigetfile({'*.mp4';'*.avi';'*.mov'},'Select a video file');
    if isequal(videoFile,0)
        disp('User selected Cancel')
        return
    end
    
    % Create a directory for the output images
    % output_folder = uigetdir('','Select output folder');
    output_folder = append(videoPath,'temporary');
    if isfolder(output_folder)
        rmdir(output_folder,'s');
    end
    mkdir(output_folder);
    
    % Create a VideoReader object for the input video file
    video = VideoReader(fullfile(videoPath,videoFile));
    originalFrameRate = video.FrameRate;
    if originalFrameRate >= 59.9
        IsVideoFPSInput60 = true;
    end
    
    % Loop through each frame of the video and save it as a separate image
    numFrames = 0;
    while hasFrame(video)
        % Read the next frame
        frame = readFrame(video);
        
        % Increment the frame number
        if IsVideoFPSInput60 == false   
        % Save the frame as an image in the output folder
            imwrite(frame, fullfile(output_folder, sprintf('%4d.png',numFrames)));
        elseif mod(numFrames,2) == 0 
            imwrite(frame, fullfile(output_folder, sprintf('%4d.png',numFrames)));
        end

        numFrames = numFrames + 1;
    end
    
    disp('Video Extraction Finished!')

end