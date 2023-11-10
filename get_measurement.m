function get_measurement(vanishing_line, vanishing_point, scale)
% Performs measurements on an image in a specific direction

uiwait(msgbox("Draw a line to measure."));

line_segment = drawline("Color","magenta");

t = [line_segment.Position(1,:) 1]';
b = [line_segment.Position(2,:) 1]';

top_ratio = norm(t-b)*norm(vanishing_point-vanishing_line);
bottom_ratio = norm(t-vanishing_line)*norm(vanishing_point - b);
cross_ratio = top_ratio / bottom_ratio;

measurement = cross_ratio / scale;

line_segment.Label = num2str(measurement) + " cm";    

end

