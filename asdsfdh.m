s = tf('s')
k = 1;
sys = k*(s^2+6*s+6)/((s+5)^2*(s+3))
syscl = feedback(sys,1)