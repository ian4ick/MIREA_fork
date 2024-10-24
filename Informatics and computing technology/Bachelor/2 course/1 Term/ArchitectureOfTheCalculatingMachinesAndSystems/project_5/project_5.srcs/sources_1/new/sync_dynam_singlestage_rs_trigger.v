`timescale 1ns / 1ps
module sync_dynam_singlestage_rs_trigger(clk, nr, ns, Q);
input clk, nr, ns;
output Q;
reg Q;

always @ (posedge clk)
begin
	case ({ns,nr})
		0 : Q <= 1'bx;
		1 : Q <= 1;
		2 : Q <= 0;
		3 : Q <= Q;
	endcase
end
endmodule
