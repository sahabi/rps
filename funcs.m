function [s] = c2d(array)
  dgrid_size = [4 4];
  cgrid_size = [2 2];
  xwidth = cgrid_size(1)/dgrid_size(1);
  ywidth = cgrid_size(2)/dgrid_size(2);
  cx = array(1);
  cy = array(2);
  cx = cx + 1;
  dx = floor(cx/xwidth);
  cy = cy + 1;
  dy = floor(cy/ywidth);
  s = dx + (dy*dgrid_size(1));
end

function [array] = d2c(s);
  dgrid_size = [4 4];
  cgrid_size = [2 2];
  xwidth = cgrid_size(1)/dgrid_size(1);
  ywidth = cgrid_size(2)/dgrid_size(2);  
  x = (floor(mod(s, dgrid_size(1)))*xwidth) + (xwidth/2);
  y = floor(s / dgrid_size(2));
  array = [x-1 y-1 0];
end

function [action, state] = move(cs, os)
  action = 5;
  state = 5;
end
