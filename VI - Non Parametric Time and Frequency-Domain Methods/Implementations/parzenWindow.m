function window = parzenWindow(gamma,omega)
    window = 1/(2*pi)./gamma.*(sin(gamma.*omega/2)./sin(omega/2)).^2;
end