# ImageInterpolator

This is a series of scripts that, given an input .mp4 video, can generate intermediate frames and output it in its own video. Given an input video, new frames are generated. As this is a very early commit, I plan on experimenting with algorithmic ways to generate new frames. 

The program is written entirely in MATLAB. To use and experiment, the main videoInterpolator.m file is the main driver, and imageModification.m contains the methods to generate a new frame, given the previous and next frames. The program creates a temporary directory in the location of the original video. 

Do let me know about any changes or improvements that can be made with this program. 
