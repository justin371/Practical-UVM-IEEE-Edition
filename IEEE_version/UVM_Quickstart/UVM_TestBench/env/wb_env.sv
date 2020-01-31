`ifndef WB_ENV_ENV__SV
 `define WB_ENV_ENV__SV
 `include "wb_env_inc.sv"
class wb_env extends uvm_env;
   wb_master_agent master_agent;
   wb_slave_agent slave_agent;
   wb_env_cov cov;
   wb_scoreboard sb;
   reset_agent rst_agent;
   
   `uvm_component_utils(wb_env)

   extern function new(string name="wb_env", uvm_component parent=null);
   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);

endclass: wb_env

function wb_env::new(string name= "wb_env",uvm_component parent=null);
   super.new(name,parent);
endfunction:new

function void wb_env::build_phase(uvm_phase phase);
   super.build_phase(phase);
   master_agent = wb_master_agent::type_id::create("master_agent",this); 
   slave_agent = wb_slave_agent::type_id::create("slave_agent",this);
   cov = wb_env_cov::type_id::create("cov",this); //Instantiating the coverage class
   sb = wb_scoreboard::type_id::create("sb",this);

   rst_agent = reset_agent::type_id::create("rst_agent",this); 

endfunction: build_phase

function void wb_env::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   master_agent.mast_mon.mon_analysis_port.connect(cov.analysis_export);
   master_agent.analysis_port.connect(sb.actual_wb_transaction_fifo.analysis_export);
   slave_agent.analysis_port.connect(sb.expected_wb_transaction_fifo.analysis_export);
endfunction: connect_phase


`endif // WB_ENV_ENV__SV

