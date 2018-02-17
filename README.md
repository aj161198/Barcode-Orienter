# Barcode-Orienter
The barcode detecting and processing libraries, do not work well if the barcode is oriented at a certain angle, to overcome this problem, I have used some image-processing algorithms and Linear-Algebra which I have made specifically for barcode orientation of books in shelf, but it could be used in various applications, depending on the need. 
Steps Involved:-
1. Barcode Segmentation using binarization and connected-components labelling.
2. Extracting the desired component, using area-based filtering.
3. Creation of Random Variable X and Y, which stores the position of the foreground pixels.
4. Calculation of co-variance matrix for X and Y.
5. Computation of Eigen vector and hence the angle of orientation of barcode is known.
6. Rotation of image to the required angle calculated using geometry.

Now, this oriented image could be used in barcode detecting and processing libraries for efficient barcode detection.


Note:- This model will fail, if the barcodes are placed too close to each other, i.e if the thin books carrying barcode are placed adjacent to each other.
In this model, thick books contains a QR-code and thin books the barcodes
