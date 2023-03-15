function imagesToVideo(path, frameRate, filename, folderPath)

    % Get a list of all the image files in the input folder
    image_files = dir(fullfile(folderPath,'*.png'));
    
    % Create a VideoWriter object for the output video file
    output_file = fullfile(path,filename);
    output_video = VideoWriter(output_file,'MPEG-4');
    
    % Set the frame rate of the output video
    output_video.FrameRate = frameRate;
    
    % Open the output video file for writing
    open(output_video);
    
    % Loop through each image file and write it to the output video file
    for i = 1:numel(image_files)
        % Read the next image file
        image_file = fullfile(folderPath,image_files(i).name);
        image_data = imread(image_file);
        
        % Write the image to the output video file
        writeVideo(output_video,image_data);
    end
    
    % Close the output video file
    close(output_video);
    
    disp('Final Video Generated!')

end