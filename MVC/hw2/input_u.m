function a = input_u(u,t)
 for i = 1:31
 if t < 0
 a = 0;
 end
 if t < 0.18*i && t >= 0.18*(i-1)
 a = u(i,2);
 end
 end
end