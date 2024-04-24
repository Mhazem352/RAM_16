`timescale 1us/1ps
module RAM_tb #(parameter Width =16 ,
                          Depth=8,
                          ADD_WD=3) ();
reg [Width-1:0]  WrData;
reg [ADD_WD-1:0] Address;
reg              WrEn,RdEn,CLK,RST;
wire [Width-1:0] RdData;

always #5 CLK = !CLK;
RAM_16 dut (
.WrData(WrData),
.Address(Address),
.WrEn(WrEn),
.RdEn(RdEn),
.CLK(CLK),
.RST(RST),
.RdData(RdData) );

initial 
  begin
    CLK=0;
    RST=0;
    #10
    RST=1;
    #10
    Address=4;
    WrEn=1;
    RdEn=0;
    WrData='d35;
    #10
    WrEn=0;
    RdEn=1;
    #10
    Address=1;
    WrEn=1;
    RdEn=0;
    WrData='d15;
    #10
    WrEn=0;
    RdEn=1;
    #10
    WrEn=0;
    RdEn=0;
    #10
    Address=4;
    WrEn=1;
    RdEn=1;
    
    #20 
    $stop;
    
  end
endmodule