
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/utils_1/imports/synth_1/sorter.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2g
SC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/utils_1/imports/synth_1/sorter.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
v
Command: %s
53*	vivadotcl2E
1synth_design -top up_level -part xc7a100tcsg324-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-349h px� 
W
Loading part %s157*device2$
xc7a100tcsg324-12default:defaultZ21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
`
#Helper process launched with PID %s4824*oasys2
207282default:defaultZ8-7075h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2�
�C:/Users/vav11/Downloads/Xilinx_Windows_Unpacked_2022_2/Xilinx_Windows_Unpacked_2022_2/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
�
%s*synth2�
yStarting RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1207.246 ; gain = 408.789
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2
up_level2default:default2
 2default:default2_
IC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/sources_1/new/up_level.v2default:default2
22default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
	DEBOUNCER2default:default2
 2default:default2`
JC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/sources_1/new/DEBOUNCER.v2default:default2
22default:default8@Z8-6157h px� 
Y
%s
*synth2A
-	Parameter SIZE bound to: 5 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	DEBOUNCER2default:default2
 2default:default2
02default:default2
12default:default2`
JC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/sources_1/new/DEBOUNCER.v2default:default2
22default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
sorter2default:default2
 2default:default2]
GC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/sources_1/new/sorter.v2default:default2
22default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
sorter2default:default2
 2default:default2
02default:default2
12default:default2]
GC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/sources_1/new/sorter.v2default:default2
22default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
divider2default:default2
 2default:default2^
HC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/sources_1/new/divider.v2default:default2
22default:default8@Z8-6157h px� 
_
%s
*synth2G
3	Parameter divisor bound to: 8000 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
divider2default:default2
 2default:default2
02default:default2
12default:default2^
HC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/sources_1/new/divider.v2default:default2
22default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2%
Seven_Segment_LED2default:default2
 2default:default2h
RC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/sources_1/new/Seven_Segment_LED.v2default:default2
22default:default8@Z8-6157h px� 
�
default block is never used226*oasys2h
RC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/sources_1/new/Seven_Segment_LED.v2default:default2
352default:default8@Z8-226h px� 
�
default block is never used226*oasys2h
RC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/sources_1/new/Seven_Segment_LED.v2default:default2
572default:default8@Z8-226h px� 
�
8referenced signal '%s' should be on the sensitivity list567*oasys2 
NUMBER_SPLIT2default:default2h
RC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/sources_1/new/Seven_Segment_LED.v2default:default2
332default:default8@Z8-567h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2%
Seven_Segment_LED2default:default2
 2default:default2
02default:default2
12default:default2h
RC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/sources_1/new/Seven_Segment_LED.v2default:default2
22default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
up_level2default:default2
 2default:default2
02default:default2
12default:default2_
IC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/sources_1/new/up_level.v2default:default2
22default:default8@Z8-6155h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
rin_reg2default:default2]
GC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/sources_1/new/sorter.v2default:default2
322default:default8@Z8-6014h px� 
�
+design %s has port %s driven by constant %s3447*oasys2
up_level2default:default2
LED[13]2default:default2
02default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2
up_level2default:default2
LED[12]2default:default2
02default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2
up_level2default:default2
LED[11]2default:default2
02default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2
up_level2default:default2
LED[10]2default:default2
02default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2
up_level2default:default2
LED[9]2default:default2
02default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2
up_level2default:default2
LED[8]2default:default2
02default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2
up_level2default:default2
LED[7]2default:default2
02default:defaultZ8-3917h px� 
�
%s*synth2�
yFinished RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 1301.902 ; gain = 503.445
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 1301.902 ; gain = 503.445
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 1301.902 ; gain = 503.445
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0062default:default2
1301.9022default:default2
0.0002default:defaultZ17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2d
NC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/constrs_1/new/constraints.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2d
NC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/constrs_1/new/constraints.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2b
NC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/constrs_1/new/constraints.xdc2default:default2.
.Xil/up_level_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1363.4842default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
1363.4842default:default2
0.0002default:defaultZ17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2�
�C:/Users/vav11/Downloads/Xilinx_Windows_Unpacked_2022_2/Xilinx_Windows_Unpacked_2022_2/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:11 ; elapsed = 00:00:11 . Memory (MB): peak = 1363.484 ; gain = 565.027
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Loading part: xc7a100tcsg324-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:11 ; elapsed = 00:00:11 . Memory (MB): peak = 1363.484 ; gain = 565.027
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:11 ; elapsed = 00:00:11 . Memory (MB): peak = 1363.484 ; gain = 565.027
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2default:default2
sorter2default:defaultZ8-802h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                iSTATE11 |             00000000000000000001 |                           000000
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE9 |             00000000000000000010 |                           000001
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE7 |             00000000000000000100 |                           000010
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE5 |             00000000000000001000 |                           000011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |             00000000000000010000 |                           000100
2default:defaulth p
x
� 
�
%s
*synth2s
_                iSTATE18 |             00000000000000100000 |                           000101
2default:defaulth p
x
� 
�
%s
*synth2s
_                iSTATE17 |             00000000000001000000 |                           011110
2default:defaulth p
x
� 
�
%s
*synth2s
_                iSTATE14 |             00000000000010000000 |                           000110
2default:defaulth p
x
� 
�
%s
*synth2s
_                iSTATE15 |             00000000000100000000 |                           001001
2default:defaulth p
x
� 
�
%s
*synth2s
_                iSTATE12 |             00000000001000000000 |                           001010
2default:defaulth p
x
� 
�
%s
*synth2s
_                iSTATE10 |             00000000010000000000 |                           001011
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE4 |             00000000100000000000 |                           001100
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE3 |             00000001000000000000 |                           001101
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE1 |             00000010000000000000 |                           001110
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |             00000100000000000000 |                           001111
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE8 |             00001000000000000000 |                           010000
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE6 |             00010000000000000000 |                           010001
2default:defaulth p
x
� 
�
%s
*synth2s
_                iSTATE13 |             00100000000000000000 |                           000111
2default:defaulth p
x
� 
�
%s
*synth2s
_                iSTATE16 |             01000000000000000000 |                           001000
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE2 |             10000000000000000000 |                           011100
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2default:default2
one-hot2default:default2
sorter2default:defaultZ8-3354h px� 
�
!inferring latch for variable '%s'327*oasys2
err_reg2default:default2]
GC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.srcs/sources_1/new/sorter.v2default:default2
1402default:default8@Z8-327h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:12 ; elapsed = 00:00:12 . Memory (MB): peak = 1363.484 ; gain = 565.027
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    5 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    4 Bit       Adders := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    3 Bit       Adders := 1     
2default:defaulth p
x
� 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      1 Bit         XORs := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               16 Bit    Registers := 19    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                5 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                4 Bit    Registers := 3     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 4     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	  20 Input   20 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   20 Bit        Muxes := 17    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   16 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input   16 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   8 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  20 Input    6 Bit        Muxes := 22    
2default:defaulth p
x
� 
X
%s
*synth2@
,	  20 Input    4 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   5 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 51    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    1 Bit        Muxes := 19    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   5 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  20 Input    1 Bit        Muxes := 2     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
+design %s has port %s driven by constant %s3447*oasys2
up_level2default:default2
LED[13]2default:default2
02default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2
up_level2default:default2
LED[12]2default:default2
02default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2
up_level2default:default2
LED[11]2default:default2
02default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2
up_level2default:default2
LED[10]2default:default2
02default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2
up_level2default:default2
LED[9]2default:default2
02default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2
up_level2default:default2
LED[8]2default:default2
02default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2
up_level2default:default2
LED[7]2default:default2
02default:defaultZ8-3917h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:20 ; elapsed = 00:00:21 . Memory (MB): peak = 1363.484 ; gain = 565.027
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:24 ; elapsed = 00:00:25 . Memory (MB): peak = 1363.484 ; gain = 565.027
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Timing Optimization : Time (s): cpu = 00:00:26 ; elapsed = 00:00:27 . Memory (MB): peak = 1393.910 ; gain = 595.453
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Technology Mapping : Time (s): cpu = 00:00:26 ; elapsed = 00:00:27 . Memory (MB): peak = 1403.980 ; gain = 605.523
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
vFinished IO Insertion : Time (s): cpu = 00:00:29 ; elapsed = 00:00:30 . Memory (MB): peak = 1403.980 ; gain = 605.523
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:29 ; elapsed = 00:00:30 . Memory (MB): peak = 1403.980 ; gain = 605.523
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:30 ; elapsed = 00:00:30 . Memory (MB): peak = 1403.980 ; gain = 605.523
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:30 ; elapsed = 00:00:30 . Memory (MB): peak = 1403.980 ; gain = 605.523
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:30 ; elapsed = 00:00:30 . Memory (MB): peak = 1403.980 ; gain = 605.523
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:30 ; elapsed = 00:00:30 . Memory (MB): peak = 1403.980 ; gain = 605.523
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|1     |BUFG   |     1|
2default:defaulth px� 
D
%s*synth2,
|2     |CARRY4 |    10|
2default:defaulth px� 
D
%s*synth2,
|3     |LUT1   |     8|
2default:defaulth px� 
D
%s*synth2,
|4     |LUT2   |    21|
2default:defaulth px� 
D
%s*synth2,
|5     |LUT3   |    13|
2default:defaulth px� 
D
%s*synth2,
|6     |LUT4   |    71|
2default:defaulth px� 
D
%s*synth2,
|7     |LUT5   |    51|
2default:defaulth px� 
D
%s*synth2,
|8     |LUT6   |   264|
2default:defaulth px� 
D
%s*synth2,
|9     |MUXF7  |    68|
2default:defaulth px� 
D
%s*synth2,
|10    |MUXF8  |    34|
2default:defaulth px� 
D
%s*synth2,
|11    |FDRE   |   362|
2default:defaulth px� 
D
%s*synth2,
|12    |LD     |     2|
2default:defaulth px� 
D
%s*synth2,
|13    |IBUF   |    18|
2default:defaulth px� 
D
%s*synth2,
|14    |OBUF   |    31|
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:30 ; elapsed = 00:00:30 . Memory (MB): peak = 1403.980 ; gain = 605.523
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 9 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:23 ; elapsed = 00:00:29 . Memory (MB): peak = 1403.980 ; gain = 543.941
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:30 ; elapsed = 00:00:30 . Memory (MB): peak = 1403.980 ; gain = 605.523
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0042default:default2
1406.8672default:default2
0.0002default:defaultZ17-268h px� 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
1142default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1410.5122default:default2
0.0002default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2Y
E  A total of 2 instances were transformed.
  LD => LDCE: 2 instances
2default:defaultZ1-111h px� 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
712c6e292default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
372default:default2
182default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:342default:default2
00:00:352default:default2
1410.5122default:default2
1007.1522default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2Y
EC:/Users/vav11/Downloads/Vivado/lab_2/lab_2.runs/synth_1/up_level.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2z
fExecuting : report_utilization -file up_level_utilization_synth.rpt -pb up_level_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Tue Apr  8 19:20:14 20252default:defaultZ17-206h px� 


End Record