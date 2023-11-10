# single-view-metrology
MATLAB-based tool for computing accurate 3D affine measurements from a single perspective image, utilizing vanishing points, cross-ratios, and projection matrices to measure distances between and within parallel planes, and determine camera positions.

## Overview

This MATLAB project, developed by Curtis Helsel in November 2022, allows for the computation of 3D affine measurements from a single perspective image. The key feature is the utilization of vanishing lines in a scene's reference plane to facilitate measurements, enabling users to determine distances between parallel planes and identify camera positions.

## Getting Started

To run the project, follow these steps:

1. Open MATLAB.
2. In the command window, type `svm` to execute the code.
3. Draw lines on the image as instructed to find vanishing points.

## Methodology

### Vanishing Points and Lines

In projective space, parallel lines intersect at infinity, represented by vanishing points. The project code guides users to draw lines for calculating these vanishing points.

### Measurements Between Parallel Planes

Measurements within the same plane are achieved using cross-ratios and reference lengths, providing a practical tool for obtaining accurate measurements.

### Measurements On Parallel Planes

The project extends measurements to different planes, utilizing projection matrices and homography equations.

### Determining Camera Position

The projection camera matrix is used to determine the camera center position, considering Cramer’s rule and matrix null space.

## Results

Sample measurements and visual representations are provided, demonstrating the accuracy of the computations.

![Room Measurements](path/to/room_measurements.png)

## Future Enhancements

Future iterations may explore advanced techniques such as texture mapping and neural networks for scene reconstruction.

## References
- Antonio Criminisi, Ian Reid, and Andrew Zisserman. “Single view metrology”. In: International Journal of Computer Vision 40.2 (2000), pp. 123–148.
- Richard Hartley and Andrew Zisserman. “Projective Geometry and Transformations of 2D”. In: Multiple view geometry in Computer Vision. 2nd. Cambridge University Press, 2019, pp. 87–131.
