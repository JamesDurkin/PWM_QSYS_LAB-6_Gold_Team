module PWM_test #(parameter n = 8, parameter m = 4)( 
1 input [17:0] SW, 
3 input [1:0] KEY
4 output [35:0] GPIO, 
5 output [n:0] LEDG
6
7 ); 
8 
 
9 wire s, t, h, mil; 
10 wire [n:0] sw_period, sw_duty ; 
11 

 
12 //assign the first 8 switches as the brightness and the rest are the frequency 
13 assign sw_duty[n-1:0] = SW[n-1:0]; 
14 assign sw_period[n:0] = SW[17:n]; 
15 
 
16 
 
17 //setting variables for the core.  
18  PWM_core run0(  
19  .reset(KEY[1]), 
20  .switch_in(sw_duty), 
22  .pulse_period(sw_period), 
23  .byteenable(4'b1111), 
    .clk(mil), 
24  .out(LEDG[n]), 
25  .out_pin(GPIO[m]) 
26 ); 
27 
 
28 
 
29 //extracting data from the clock divider.  
30  clock_divider clock0( 
31 	CLOCK_50, 
32 	s,		//Seconds 
33 	t,		//Tenths of seconds 
34 	h,		//Hundredths of seconds 
35 	mil		//milliseconds 
36 	); 
37 
 
endmodule
