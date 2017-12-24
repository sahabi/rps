function [s] = c2d(array)
  cx = array(0);
  cy = array(1);
  cx = cx + 1;
  dx = floor(cx/xwidth);
  cy = cy + 1;
  dy = floor(cy/ywidth);
  s = dx + (dy*dgrid_size(0));
end

