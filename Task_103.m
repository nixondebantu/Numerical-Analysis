%input
f = input("Enter function: ");
a = input("Enter left side of interval: ");
b = input("Enter right side of interval: ");
n = input("Enter no of iterations: ");
e = input("Enter tolerance: ");

%root storing matrix
roots = [];
k=a;

%False-position start
if f(a)*f(b)<0 && a<b
    for i=1:n
        c = (a*f(b) - b*f(a))/(f(b) - f(a));    %root caluculation
        fprintf("Root for iteration %d is: %f\n",i,c);  %root printing
        roots = [roots; c]; %root storing
        if abs(f(c)) < e || abs(k-c) < e
            break;
        elseif f(a)*f(c) < 0
            b = c;
        else
            a = c;
        end
        k = c;
    end

else
    fprintf("No root exists between the given intervals.");
end

%plotting
fplot(f, [a,b]);   %plotting function
hold on;
plot(roots, f(roots), 'mo');    %plotting roots
hold off;
