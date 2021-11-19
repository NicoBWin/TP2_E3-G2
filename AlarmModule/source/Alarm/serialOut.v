module serialOut (
    input wire init,        	// Recibo de aviso de transmisi�n
    input wire clk,         	// se�al de clock
    input wire [3:0]state,      // Estado a transmitir
    output reg status_send,		// Envio de aviso de transmisi�n
    output reg status_out 		// Canal de transmisi�n
	);
	
	integer j;
	reg [3:0]temp_data_out;
	
    always @(posedge clk) begin
		if (!init) begin
			status_send <= 1'b0;
			status_out <= 1'b0;
			temp_data_out <= state;
			j = 0;
		end
		else if (init) begin			// Comienza la transmision
			status_send <= 1'b1;
			status_out <= temp_data_out[j];	
			j = j + 1;
			if (j>3)
				j=0;
		end  
	end
endmodule