% Given conditions (in mm)
H_0 = 4.91; W_0 = 2.65; D = 500;
H_f_rec = 100;  W_f_rec = 10;
H_f_cir = 100; W_f_cir = 100;

% Intermediate Variables
h_I_ob = W_0/2; h_II_ob = H_0/2; 
h_I_im_rec = W_f_rec; h_II_im_rec = H_f_rec; 
h_I_im_cir = H_f_cir; h_II_im_cir = W_f_cir;
s_Final = D;

%Setup place holder values
temp_s_Iob_rec = 1000; temp_s_IIob_rec = 1000; temp_d_rec = 1000;
temp_s_Iob_cir = 1000; temp_s_IIob_cir = 1000; temp_d_cir = 1000;
loops_rec = 0; loops_cir = 0;  

% Describe Light Source
led_fcn = @(x,n)((1-abs(x./(h_I_ob)).^n)*(h_II_ob^n)).^(1/n);
x=linspace(-h_I_ob,h_I_ob,25);
y=led_fcn(x,5);

%Create vertical vectors for use in Optalix
Xt=transpose(X);Yt=transpose(Y);

%Calculations for 100x10 mm rectangle
s_I_ob_rec=-s_Final*h_I_ob/h_I_im_rec;
s_II_ob_rec=-(s_Final-s_I_ob_rec)*h_II_ob/(h_II_im_rec+h_II_ob);
d_rec=s_I_ob_rec-s_II_ob_rec;
while abs(temp_s_Iob_rec+temp_s_IIob_rec+temp_d_rec-(s_I_ob_rec+s_II_ob_rec+d_rec)) >.003
  temp_s_Iob_rec = s_I_ob_rec; temp_s_IIob_rec = s_II_ob_rec; temp_d_rec = d_rec;
  s_Final=500-s_I_ob_rec;
  s_I_ob_rec=-s_Final*h_I_ob/h_I_im_rec;
  s_II_ob_rec=-(s_Final-s_I_ob_rec)*h_II_ob/(h_II_im_rec+h_II_ob);
  d_rec=s_I_ob_rec-s_II_ob_rec;
  loops_rec=loops_rec+1;
end

%Calculations for 100x100 mm rectangle
s_II_ob_cir=-s_Final*h_II_ob/h_II_im_cir;
s_I_ob_cir=-(s_Final-s_II_ob_cir)*h_II_ob/(h_I_im_cir+h_I_ob);
d_cir=s_I_ob_cir-s_II_ob_cir;
while abs(temp_s_Iob_cir+temp_s_IIob_cir+temp_d_cir-(s_I_ob_cir+s_II_ob_cir+d_cir)) >.003
  temp_s_Iob_cir = s_I_ob_cir; temp_s_IIob_cir = s_II_ob_cir; temp_d_cir = d_cir;
  s_Final=500-s_I_ob_cir;
  s_II_ob_cir=-s_Final*h_II_ob/h_II_im_cir;
  s_I_ob_cir=-(s_Final-s_II_ob_cir)*h_II_ob/(h_I_im_cir+h_I_ob);
  d_cir=s_I_ob_cir-s_II_ob_cir;
  loops_cir=loops_cir+1;
end

%Calculations of magnification
MI_rec=-s_Final/s_I_ob_rec; MI_cir=-s_Final/s_I_ob_cir;
MII_rec=-(s_Final-d_rec)/s_II_ob_rec; MII_cir=-(s_Final-d_cir)/s_II_ob_cir;
x_rec=x.*MI_rec; y_rec=y.*MII_rec; x_cir=x.*MI_cir;  y_cir=y.*MII_cir;

%Creation of matricies for visualization
X=[x -x];Y=[y -y]; 
X_rec=[x_rec -x_rec];Y_rec=[y_rec -y_rec]; 
X_cir=[x_cir -x_cir];Y_cir=[y_cir -y_cir];
plot (X, Y); hold on; 
plot (X_rec, Y_rec); 
plot (X_cir, Y_cir); 
hold off

%Display Results
s_I_ob_rec, s_II_ob_rec, d_rec, 
screen_rec = D + s_I_ob_rec
s_I_ob_cir, s_II_ob_cir, d_cir,
loops_rec, loops_cir,