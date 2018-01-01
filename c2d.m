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