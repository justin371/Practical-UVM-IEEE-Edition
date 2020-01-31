module top;
   import uvm_pkg::*;
   typedef class class_C;

   // Class definition
class class_C extends uvm_object;

   int cl_int;
   string cl_string;
   int 	  cl_int_arr[];
   int 	  cl_int_sarr[40];
   
   `uvm_object_utils_begin(class_C)
      `uvm_field_int(cl_int,UVM_DEFAULT);
      `uvm_field_string(cl_string,UVM_DEFAULT);
      `uvm_field_array_int(cl_int_arr,UVM_DEFAULT);
      `uvm_field_sarray_int(cl_int_sarr,UVM_DEFAULT);
   `uvm_object_utils_end
   
   function new(string name="");
      super.new(name);	
      cl_string = name;
      cl_int = 8;
      //cl_int_arr = new[cl_int];
      for(int i = 0; i < cl_int; i++) begin
	 cl_int_arr[i] = i + 1;
      end
      for(int i = 0; i < 40; i++) begin
	 cl_int_sarr[i] = i * 2;
      end
   endfunction

endclass

   
   class_C class_C_inst;
   uvm_printer my_printer;
   initial begin
      // free children
      my_printer = uvm_default_table_printer;
      my_printer.knobs.type_name = 0;
      my_printer.knobs.begin_elements = 7;
      my_printer.knobs.end_elements=2;
      class_C_inst = new("class_C_inst");
      class_C_inst.randomize();
      class_C_inst.print(my_printer);
      
   end 
endmodule
