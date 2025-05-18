clc;clear;

A = input('zadaj maticu A (napr. [3 5 6 8; 2 3 7 5; 1 4 6 2; 5 3 2 8]): ');
B = input('zadaj maticu B (napr. [1 3 5 4; 2 6 4 5; 1 3 7 2; 4 5 6 8]): ');
I = input('Zadaj interval I napr. [0 10]: ');
if size(A, 1) ~= size(B, 1) || size(A, 2) ~= size(B, 2)
    error('Matrices A and B must have the same dimensions.');
end
[row,col] = size(A);
x = ones(col, 1) * I(1,2); 
result_a = multiply(A, x);
result_b = multiply(B, x);
minimum = I(1,2);
matica = "C";

while ~isequal(result_a, result_b)
    index = -1; 
    for i = 1:length(result_a)
        if result_a(i) > result_b(i) && result_b(i) < minimum
            minimum = result_b(i);
            index = i;
            matica = "A";
        elseif result_a(i) < result_b(i) && result_a(i) < minimum
            minimum = result_a(i);
            index = i;
            matica = "B";
        end
    end
    
    if index ~= -1 
        if matica == "A"
            for i = 1:col
                if A(index, i) > minimum && x(i) > minimum
                    x(i) = minimum;
                    break;
                end
            end
        elseif matica == "B"
            for i = 1:col
                if B(index, i) > minimum && x(i) > minimum
                    x(i) = minimum;
                    break;
                end
            end
        end
        result_a = multiply(A, x); 
        result_b = multiply(B, x);
        matica = "C"; 
        minimum = I(1,2);  
    else
        break;  
    end
end

disp('riesenie x= ')
disp(x);

function output = multiply(A,x)
    [row,col] = size(A);
    output = zeros(row,1);

    for i=1:row
        minimus = zeros(row,1);
        for j=1:col
            minimus(j) = min(A(i,j), x(j));
        end
        output(i) = max(minimus);
    end
end