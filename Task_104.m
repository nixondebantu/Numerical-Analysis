%input
f = input("Enter function: ");
df = input("Enter derivative of function: ");
x0 = input("Enter initial guess: ");
n = input("Enter no of iterations: ");
e = input("Enter tolerance: ");

%root storing matrix
roots = [];

%plotting
fplot(f);   %plotting function
hold on;

%Newton-raphson start
if df(x0) == 0
    fprintf("Newton-raphson failed");
else
    for i = 1:n
        x1 = x0 - f(x0)/df(x0); %root caluculation
        roots = [roots; x1];    %root storing
        fprintf("Root for iteration %d is: %f\n",i,x1);  %root printing
        
        if abs(x1 - x0) < e
            break;

        elseif df(x1) == 0
            fprintf("Newton-raphson failed");
            break;
        end
        
        tangent = @(x) df(x0)*(x - x0) + f(x0); %calculating tangent
        fplot(tangent, [x0-.5, x0+.5], '--r');  %plotting tangent line
        x0 = x1;    %updating x0

    end

end
plot(roots, f(roots), 'mo');    %plotting roots
hold off;