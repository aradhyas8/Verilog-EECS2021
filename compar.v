//Aradhya Singh
//217501933

module LabK;
reg[1:0] a,b;
reg expect;
wire Gr, Eq, tempa, tempb, tempAB1, tempAB2, wireGE, wireEQ;
wire[1:0] Gr1, Eq1;
integer i, j;
not b_not(tempb, b);
and one_and(Gr, a, tempb);
not a_not(tempa, a);
and two_and(tempAB1, tempa, tempb);
and three_and(tempAB2, a, b);
assign Eq = tempAB1+tempAB2;
and four_and(wireGE, Eq,Gr1[0]);
assign Gr1 = Gr+ wireGE;
and five_and(wireEQ, Eq, Eq1[0]);
assign Eq1 = wireEQ;


initial //Phase2
begin 
   for(i=0; i<4; i=i+1)
   begin    
        for(j=0; j<4; j=j+1)
        begin 
        #1;
            a=i ; b=j;
            #2 $display("a=%2b b=%b -> Gr=%b Eq=%b", a ,b, Gr1, Eq1);
        end
    end
    #4 $finish;
end
initial
    begin
expect =i & ~b;
#1;
    if(expect===Eq1)
    $display("PASS : a=%b b=%b Gr=%b Eq=%b", a,b,Gr,Eq);
    else
    $display("FAIL : a=%b b=%b Gr=%b Eq=%b", a,b,Gr,Eq);

    
end
endmodule   