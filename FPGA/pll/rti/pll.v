module pll
(
    input   wire    sys_clk         ,   // 系统时钟
    
    output  wire    clk_mul_2       ,   // 2倍
    output  wire    clk_div_2       ,   // 2分
    output  wire    clk_phase_90    ,   // 相移90°
    output  wire    clk_ducle_20    ,   // 占空比20%时钟
    output  wire    locked              // 检测锁相环是否锁定
    
);


pll_ip pll_ip_int
(
    .inclk0        (sys_clk       ),
    
    .c0            (clk_mul_2     ),
    .c1            (clk_div_2     ),
    .c2            (clk_phase_90  ),
    .c3            (clk_ducle_20  ),
    .locked        (locked    )
);

endmodule


