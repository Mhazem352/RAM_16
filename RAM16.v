module RAM_16 #(parameter Width =16 ,
                          Depth=8,
                          ADD_WD=3)(
  input wire [Width-1:0]  WrData,
  input wire [ADD_WD-1:0] Address,
  input wire              WrEn,RdEn,CLK,RST,
  output reg [Width-1:0]  RdData
   );
   
reg [Width-1:0] reg_file [Depth-1:0];

always @ (posedge CLK or negedge RST)
  begin
    if(!RST)
      begin
        reg_file[0]<=0;
        reg_file[1]<=0;
        reg_file[2]<=0;
        reg_file[3]<=0;
        reg_file[4]<=0;
        reg_file[5]<=0;
        reg_file[6]<=0;
        reg_file[7]<=0;
      end
    else if(WrEn && !RdEn)
      reg_file[Address]<= WrData;
    else if (!WrEn && RdEn)
      RdData <= reg_file[Address];
    else 
      reg_file[Address]<=reg_file[Address] ;
  end
   
endmodule