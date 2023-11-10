function origin = get_origin()
% Returns a selected origin in the image

uiwait(msgbox("Choose the world origin"));
im_origin = ginput(1);
% adds x3 value of 1 and transposes matrix to be in column form
origin = [im_origin 1]';

end

