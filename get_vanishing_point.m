function vanishing_point = get_vanishing_point()
% Returns the vanishing point of pararell lines in an image
% uses the least squares solution to find the vanishing point
% closest for multiple parallel lines

% Allows for zooming after drawing the line
ax = gca;
ax.Interactions = [zoomInteraction];
enableDefaultInteractivity(ax)

lines = [];
while true

    line_segment = drawline();

    if isempty(line_segment.Position)
        break;
    end
    uiwait(msgbox("Adjust line as needed and click OK to select next line"));
    point1 = [line_segment.Position(1,:) 1]';
    point2 = [line_segment.Position(2,:) 1]';
    line = cross(point1, point2);

    lines = [lines; line'];

end

[~,~,V] = svd(lines);
x = V(1,3) / V(3,3);
y = V(2,3) / V(3,3);
vanishing_point = [x;y;1];

end

