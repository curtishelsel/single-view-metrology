function world_Points = get_world_points(vanishing_line, vanishing_point, scale, P, direction, O)
% Returns the real world coordinates of image points based on
% scale and direction

% Allows for zooming on points
ax = gca;
ax.Interactions = [zoomInteraction];
enableDefaultInteractivity(ax)

world_Points = zeros(3,0);

while true
    line_segment = drawline("Color","green");

    if isempty(line_segment.Position)
            break;
        end
    
    t = [line_segment.Position(1,:) 1]';
    b = [line_segment.Position(2,:) 1]';

    top_ratio = norm(t-b)*norm(vanishing_point-vanishing_line);
    bottom_ratio = norm(t-vanishing_line)*norm(vanishing_point - b);
    cross_ratio = top_ratio / bottom_ratio;

    length = cross_ratio / scale;

    if isequal(direction, "X")
        Hp = [(scale * length * vanishing_point + O) P(:,2) P(:,3)];
        coordinate = Hp \ t;
        world_point = [length; coordinate(2)/coordinate(1);  coordinate(3)/coordinate(1)];
        world_Points(:, end+1) = world_point;
        while true
            point = drawpoint();
            if isempty(point.Position)
                break;
            end
            x = point.Position(1);
            y = point.Position(2);
            new_point = [x y 1];
            Hp = [(scale * length * vanishing_point + O) P(:,2) P(:,3)];
            coordinate = Hp\new_point';
            world_point = [length; coordinate(2)/coordinate(1);  coordinate(3)/coordinate(1)];
            world_Points(:, end+1) = world_point;
        end
    end

    if isequal(direction, "Y")
        Hp = [P(:,1)  (scale * length * vanishing_point + O) P(:,3)];
        coordinate = Hp\t;
        world_point = [coordinate(1)/coordinate(2); length; coordinate(3)/coordinate(2)];
        world_Points(:, end+1) = world_point;
        while true
            point = drawpoint();
            if isempty(point.Position)
                break;
            end
            x = point.Position(1);
            y = point.Position(2);
            new_point = [x y 1];
            Hp = [P(:,1)  (scale * length * vanishing_point + O) P(:,3)];
            coordinate = Hp\new_point';
            world_point = [coordinate(1)/coordinate(2); length; coordinate(3)/coordinate(2)];
            world_Points(:, end+1) = world_point;
        end
    end

    if isequal(direction, "Z")
        Hp = [P(:,1) P(:,2) (scale * length * vanishing_point + O)];
        coordinate = Hp\t;
        world_point = [coordinate(1)/coordinate(3); coordinate(2)/coordinate(3); length];
        world_Points(:, end+1) = world_point;
        while true
            point = drawpoint();
            if isempty(point.Position)
                break;
            end
            x = point.Position(1);
            y = point.Position(2);
            new_point = [x y 1];
            Hp = [P(:,1) P(:,2) (scale * length * vanishing_point + O)];
            coordinate = Hp\new_point';
            world_point = [coordinate(1)/coordinate(3); coordinate(2)/coordinate(3); length];
            world_Points(:, end+1) = world_point;
        end
    end
end


end

