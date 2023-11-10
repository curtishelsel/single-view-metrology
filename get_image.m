function im = get_image()
%GET_IMAGE returns image selected 
% through ui box
uiwait(msgbox('Select the image for single view metrology.'));
[file, ~] = uigetfile('*.jpg; *.png');
im = imread(file);
end

