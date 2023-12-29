module  clk_gen
(
    input   wire    sys_clk     , // 系统时钟，50MHZ
    input   wire    sys_rst_n   , // 系统复位信号

    output  reg     c0          , // 分频后25MHZ的VGA工作时钟
    output  wire    locked      , // 输出稳定时钟信号的指示信号
    output  reg     inclk0      , // 50MHZ晶振时钟输入
    output  reg     areset   // 复位信号，高电平有效，可为系统复位信号取反

);

reg [1:0]   cnt ;


// cnt:计数器从0到0计数(更改cnt参数设置其他分频器)
// 事实上，对于二分频，只需要在每一个时钟周期开始时（将一个始终不变量作为判断条件），将c0翻转即可
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        cnt <= 2'b0;
    else if(cnt == 2'd0)
        cnt <= 2'b0;
    else
        cnt <= cnt + 1'b1;
  
// c0:2分频 50%占空比输出
always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        c0 <= 1'b0;
    else if(cnt == 2'd0)
        c0 <= ~c0;
        
// 晶振时钟输入       
always @(sys_clk)
    inclk0 <= sys_clk;

// 取反的系统时钟信号  
always @(sys_rst_n)
    areset <= sys_rst_n;  

// locked:稳定时钟信号的指示信号        

endmodule