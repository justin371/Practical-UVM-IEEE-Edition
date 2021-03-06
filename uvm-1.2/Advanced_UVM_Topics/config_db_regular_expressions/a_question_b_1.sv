
module top;
   import uvm_pkg::*;
   import my_env_pkg::*;

   my_env topenv;


   logic unsigned [4095:0] my_int;
   string 		   my_string;

   initial begin
      //set configuration prior to creating the environment
      uvm_config_db #(int)::set(null,"/ab?d/", "s", 21); 
      uvm_config_db #(int)::set(null,"/ca?b/", "v", 22); 



      topenv = new("topenv", null);

      run_test();


   end

endmodule
