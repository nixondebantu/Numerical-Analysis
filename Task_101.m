%init matrix a
a = input("Enter values for matrix A: ");

%display max value from matrix A
maxValue = max(a(:));
fprintf("The max value from matrix A: %d\n",maxValue);

%init matrix b
b = input("Enter values for matrix B: ");

%matrix multiplication

%row-col checking
colA = size(a,2);
rowB = size(b,1);

if colA == rowB
    c = a * b;
    disp('The result of the multiplication of matrix A and B is:');
    disp(c);
else
    fprintf("Matrix multiplication is not possible.");
end