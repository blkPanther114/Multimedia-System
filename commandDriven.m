
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

% · The number of frames within the video clip
v = VideoReader('video.MOV');
v1=readFrame(v,1);
v(1:end) =v(end:-1:1);% Read all video frames
while hasFrame(v)                   
    video = readFrame(v);
end
whos video
NumberOfFrames= ceil(v.FrameRate*v.Duration);
NumberOfFrames= 0;
    while hasFrame(v)                
        readFrame(v);
        NumberOfFrames= NumberOfFrames+ 1;
    end% Count the number of frames
   
    
% The dimensionality of the array per frame
% numberOfFrames = v.CurrentTime;
% numberOfFramesWritten = 0;

% videoFrames = [];
% for frame = 1 :NumberOfFrames
%    thisFrame = readFrame(v, frame);
%    videoFrames = cat(numel(size(thisFrame)) + 1, videoFrames, thisFrame);
%    outputBaseFileName = sprintf('%3.3d.bmp', frame);
%    outputFullFileName = fullfile(outputFolder, outputBaseFileName);
%    imwrite(thisFrame, outputFullFileName, 'bmp');
%    progressIndication = sprintf('Wrote frame %4d of %d.', frame,numberOfFrames);
%    disp(progressIndication);
%    numberOfFramesWritten = numberOfFramesWritten + 1;
% end

videoFrames = zeros([size(ReadFrame(v, 1)), 20]);

% · Number of bits per pixel
Bpp=v.BitsPerPixel;
display(Bpp);

% · Number of frames per second
Rate=v.FrameRate;
display(Rate);

% Implement a feature that allows the video clip to be played back. Within this feature, include a
% code snippet that starts playback from a specified time. The starting time could either be userspecified
% or hard-coded within the code.

implay('video.MOV');
% Playback the video file
obj = VideoReader('video.MOV'); 
% Save every single frame
vid = READFRAME(obj);
frames = obj.CurrentTime;
for x = 1 : frames
    imwrite(vid(:,:,:,x),strcat('frame-',num2str(x),'.tif'));
end

for f=NumbersofFrames:-1:1
thisframe=readFrame(v,f);
figure(1);imshow(thisframe);
end

