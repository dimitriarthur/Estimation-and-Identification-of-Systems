function window = parzenWindow(gamma,omega)
    window = 4*(2+cos(omega))./(2*pi)./gamma.*(sin(gamma.*omega/4)./sin(omega/2)).^4;
end