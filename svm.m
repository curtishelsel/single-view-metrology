% Curtis Helsel
% CAP6419 - Fall 2020
% 
% Program is an implementation of Single View Metrology by Criminisi et al

clear all;

im = get_image();
imshow(im);
axis on;

% Vanishing points for each direction
uiwait(msgbox("Choose parallel lines in the X direction, press ESC when finished."));
X = get_vanishing_point();

uiwait(msgbox("Choose parallel lines in the Y direction, press ESC when finished."));
Y = get_vanishing_point();

uiwait(msgbox("Choose parallel lines in the Z direction, press ESC when finished."));
Z = get_vanishing_point();

% Set the origin
O = get_origin();

% Vanishing lines for each direction
X_vanishing_line = cross(Y,Z);
Y_vanishing_line = cross(X,Z);
Z_vanishing_line = cross(X,Y);

% Scales for each direction
alpha = get_scale(X_vanishing_line, X, "X");
beta = get_scale(Y_vanishing_line, Y, "Y");
gamma = get_scale(Z_vanishing_line, Z, "Z");

% reset figure for clean image for measurements
imshow(im)

% Get height measurement
get_measurement(X_vanishing_line, X, alpha);
get_measurement(Y_vanishing_line, Y, beta);
get_measurement(Z_vanishing_line, Z, gamma);
uiwait(msgbox("Image to be reset, save measurement if needed."));

% Camera Projection Matrix
P = [alpha * X, beta * Y, gamma * Z, O];

% Camera location in the world
C = null(P);
C = C / C(4);

% Resets the image to choose points for 3D model
imshow(im)
uiwait(msgbox("Draw line from the X world plane and choose points at the length, press ESC when finished."));
world_pointsX = get_world_points(X_vanishing_line,X,alpha, P, "X", O);
uiwait(msgbox("Draw line from the Y world plane and choose points at the length, press ESC when finished."));
world_pointsY = get_world_points(Y_vanishing_line,Y,beta, P, "Y", O);
uiwait(msgbox("Draw line from the Z world plane and choose points at the length, press ESC when finished."));
world_pointsZ = get_world_points(Z_vanishing_line,Z,gamma, P, "Z", O);

world_points = [world_pointsX world_pointsY world_pointsZ];

world_X = world_points(1,:);
world_Y = world_points(2,:);
world_Z = world_points(3,:);

figure
plot3(world_X, world_Y, world_Z,'.','Color','b')
hold
plot3(C(1), C(2), C(3),'x','Color','r')
