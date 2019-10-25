module mux2_1(a, b, sel, y);
   input a, b, sel;
   output y;

   always @ (a or b or sel)
     begin
        y = 0;
        if (sel == 0) begin
           y = a;
        end else begin
           y = b;
        end
     end
endmodule // mux2_1
