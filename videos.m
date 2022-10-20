
% Section 3: Video
% Implement features that displays information about the video clip such as:

% The duration of the video clip
v = VideoReader('video.MOV');
D = v.Duration;
display(D);
% 
% The pixel dimension of every frame
H = v.Height;
W = v.Width;
display(H);
display(W);

% · Number of bits per pixel
Bpp=v.BitsPerPixel;
display(Bpp);

% The dimensionality of the array per frame
Darray=Bpp/8;
display(Darray);

% · Number of frames per second
Rate=v.FrameRate;
display(Rate);

% · The number of frames within the video clip
NoFrames = ceil(v.FrameRate*v.Duration);
display(NoFrames);

% Implement a feature that allows the video clip to be played back. Within this feature, include a
% code snippet that starts playback from a specified time. The starting time could either be userspecified
% or hard-coded within the code.
implay('video.MOV');
% Playback the video file
obj = VideoReader('video.MOV'); 


