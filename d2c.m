function [array] = d2c(s)
  dgrid_size = [4 4];
  cgrid_size = [2 2];
  xwidth = cgrid_size(1)/dgrid_size(1);
  ywidth = cgrid_size(2)/dgrid_size(2);
  x = (floor(mod(s, dgrid_size(1)))*xwidth) + (xwidth/2);
  y = floor(s / dgrid_size(2))*ywidth + (ywidth/2);
  array = [x-1 y-1 0];
end