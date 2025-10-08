`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/07 23:20:14
// Design Name: 
// Module Name: ram_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ram_test(
    input wire clka,
    input wire rsta,
    input wire ena,
    input wire [3 : 0] wea,
    input wire [31 : 0] addra,
    input wire [31 : 0] dina,
    output wire [31 : 0] douta,
    input wire clkb,
    input wire rstb,
    input wire enb,
    input wire [3 : 0] web,
    input wire [31 : 0] addrb,
    input wire [31 : 0] dinb,
    output wire [31 : 0] doutb,
    output wire rsta_busy,
    output wire rstb_busy

    );



bmem_native_data_256KB your_instance_name (
  .clka(clka),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(addra),  // input wire [15 : 0] addra
  .dina(dina),    // input wire [31 : 0] dina
  .douta(douta),  // output wire [31 : 0] douta
  .clkb(clkb),    // input wire clkb
  .enb(enb[0]),      // input wire enb
  .web(web[0]),      // input wire [0 : 0] web
  .addrb(addrb),  // input wire [15 : 0] addrb
  .dinb(dinb),    // input wire [31 : 0] dinb
  .doutb(doutb)  // output wire [31 : 0] doutb
);
endmodule
