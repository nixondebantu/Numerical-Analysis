%input
f = input("Enter function: ");
a = input("Enter left side of interval: ");
b = input("Enter right side of interval: ");
n = input("Enter no of iterations: ");
e = input("Enter tolerance: ");

%root storing matrix
roots = [];

%bisection start
if f(a)*f(b) < 0
    for i=1:n
        c = (a+b)/2;    %root caluculation
        fprintf("Root for iteration %d is: %f\n",i,c);
        roots = [roots; c];
        if abs(c-b) < e || abs(c-a) < e
            break;

        elseif f(a)*f(c) < 0
            b = c;

        else
            a = c;

        end
    end    

else
    fprintf("No root exists between the given intervals.");

end

%plotting
fplot(f);   %plotting function
hold on;
plot(roots, f(roots), 'mo');    %plotting roots
hold off;