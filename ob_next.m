function [s, newdir] = ob_next(ps,dir)
if ps == 14
    newdir = 0;
    s = [10 14];
elseif ps == 10 && dir == 0
    newdir = dir;
    s = [6 10];
elseif ps == 6 && dir == 0
    s = [2 6];
    newdir = dir;
elseif ps == 2
    s = [2 6];
    newdir = 1;
elseif ps == 6 && dir == 1
    s = [6 10];
    newdir = dir;
elseif ps == 10 && dir == 1
    s = [10 14];
    newdir = dir;
else
    s = [ps];
    newdir = dir;
end
end