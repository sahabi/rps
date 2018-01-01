function [ a, b ] = move( x,s )

if x == 10  & s == 0
  a = 1;
  b = 0;

else if x == 14 & s == 0
  a = 2;
  b = 4;

else if x == 10 & s == 1
  a = 1;
  b = 0;

else if x == 6 & s == 1
  a = 3;
  b = 4;

else if x == 14 & s == 1
  a = 2;
  b = 4;

else if x == 10 & s == 2
  a = 4;
  b = 8;

else if x == 14 & s == 2
  a = 5;
  b = 8;

else if x == 2 & s == 3
  a = 6;
  b = 0;

else if x == 10 & s == 3
  a = 4;
  b = 8;

else if x == 6 & s == 3
  a = 7;
  b = 8;

else if x == 10 & s == 4
  a = 4;
  b = 8;

else if x == 6 & s == 4
  a = 8;
  b = 12;

else if x == 14 & s == 4
  a = 9;
  b = 12;

else if x == 10 & s == 5
  a = 4;
  b = 8;

else if x == 14 & s == 5
  a = 9;
  b = 12;

else if x == 2 & s == 6
  a = 6;
  b = 0;

else if x == 6 & s == 6
  a = 3;
  b = 4;

else if x == 2 & s == 7
  a = 10;
  b = 8;

else if x == 10 & s == 7
  a = 4;
  b = 8;

else if x == 6 & s == 7
  a = 8;
  b = 12;

else if x == 2 & s == 8
  a = 11;
  b = 13;

else if x == 10 & s == 8
  a = 12;
  b = 13;

else if x == 6 & s == 8
  a = 8;
  b = 12;

else if x == 10 & s == 9
  a = 12;
  b = 13;

else if x == 14 & s == 9
  a = 9;
  b = 12;

else if x == 2 & s == 10
  a = 10;
  b = 8;

else if x == 6 & s == 10
  a = 7;
  b = 8;

else if x == 2 & s == 11
  a = 13;
  b = 14;

else if x == 6 & s == 11
  a = 14;
  b = 14;

else if x == 10 & s == 12
  a = 12;
  b = 13;

else if x == 6 & s == 12
  a = 14;
  b = 14;

else if x == 14 & s == 12
  a = 9;
  b = 12;

else if x == 2 & s == 13
  a = 15;
  b = 10;

else if x == 6 & s == 13
  a = 14;
  b = 14;

else if x == 2 & s == 14
  a = 16;
  b = 15;

else if x == 10 & s == 14
  a = 12;
  b = 13;

else if x == 6 & s == 14
  a = 14;
  b = 14;

else if x == 2 & s == 15
  a = 15;
  b = 10;

else if x == 6 & s == 15
  a = 14;
  b = 14;

else if x == 2 & s == 16
  a = 17; 
  b = 14;

else if x == 6 & s == 16
  a = 18;
  b = 14;

else if x == 2 & s == 17
  a = 19;
  b = 10;

else if x == 6 & s == 17
  a = 18;
  b = 14;

else if x == 2 & s == 18
  a = 19;
  b = 10;

else if x == 10 & s == 18
  a = 20;
  b = 13;

else if x == 6 & s == 18
  a = 21;
  b = 13;

else if x == 2 & s == 19
  a = 22;
  b = 9;

else if x == 6 & s == 19
  a = 18;
  b = 14;

else if x == 10 & s == 20
  a = 23;
  b = 12;

else if x == 6 & s == 20
  a = 24;
  b = 12;

else if x == 14 & s == 20
  a = 25;
  b = 12;

else if x == 2 & s == 21
  a = 26;
  b = 12;

else if x == 10 & s == 21
  a = 23;
  b = 12;

else if x == 6 & s == 21
  a = 24;
  b = 12;

else if x == 2 & s == 22
  a = 27;
  b = 8;

else if x == 6 & s == 22
  a = 28;
  b = 8;

else if x == 10 & s == 23
  a = 29;
  b = 8;

else if x == 6 & s == 23
  a = 28;
  b = 8;

else if x == 14 & s == 23
  a = 30;
  b = 8;

else if x == 2 & s == 24
  a = 27;
  b = 8;

else if x == 10 & s == 24
  a = 29;
  b = 8;

else if x == 6 & s == 24
  a = 28;
  b = 8;

else if x == 10 & s == 25
  a = 29;
  b = 8;

else if x == 14 & s == 25
  a = 30;
  b = 8;

else if x == 2 & s == 26
  a = 27;
  b = 8;

else if x == 6 & s == 26
  a = 28;
  b = 8;

else if x == 2 & s == 27
  a = 27;
  b = 8;

else if x == 6 & s == 27
  a = 28;
  b = 8;

else if x == 2 & s == 28
  a = 27;
  b = 8;

else if x == 10 & s == 28
  a = 29;
  b = 8;

else if x == 6 & s == 28
  a = 31;
  b = 4;

else if x == 10 & s == 29
  a = 29;
  b = 8;

else if x == 6 & s == 29
  a = 31;
  b = 4;

else if x == 14 & s == 29
  a = 30;
  b = 8;

else if x == 10 & s == 30
  a = 29;
  b = 8;

else if x == 14 & s == 30
  a = 30;
  b = 8;

else if x == 2 & s == 31
  a = 32;
  b = 0;

else if x == 10 & s == 31
  a = 33;
  b = 0;

else if x == 6 & s == 31
  a = 34;
  b = 0;

else if x == 2 & s == 32
  a = 6;
  b = 0;

else if x == 6 & s == 32
  a = 35;
  b = 0;

else if x == 10 & s == 33
  a = 1;
  b = 0;

else if x == 6 & s == 33 
  a = 35;
  b = 0;

else if x == 14 & s == 33
  a = 0;
  b = 0;

else if x == 2 & s == 34
  a = 6;
  b = 0;

else if x == 10 & s == 34
  a = 1;
  b = 0;

else if x == 6 & s == 34
  a = 35;
  b = 0;

else if x == 2 & s == 35
  a = 6;
  b = 0;

else if x == 10 & s == 35
  a = 1;
  b = 0;

else if x == 6 & s == 35
  a = 3;
  b = 4;

else if x == 14 & s == 36
  a = 0;
  b = 0;

end

