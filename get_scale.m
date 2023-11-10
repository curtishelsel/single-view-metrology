function scale = get_scale(vanishing_line, vanishing_point, plane_string)
% Returns the scale of a direction based on reference size

uiwait(msgbox("Choose the reference line for " + plane_string ...
                +". Start from top and go to bottom"));

line_segment = drawline("Color","red");

t = [line_segment.Position(1,:) 1]';
b = [line_segment.Position(2,:) 1]';

top_ratio = norm(t-b)*norm(vanishing_point-vanishing_line);
bottom_ratio = norm(t-vanishing_line)*norm(vanishing_point - b);
cross_ratio = top_ratio / bottom_ratio;


input = inputdlg('Enter reference line length', ...
                        'Reference Length', [1 50]);

ref_length = str2double(input{1});

scale = cross_ratio / ref_length;

end

