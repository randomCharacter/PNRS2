class report_monitor extends uvm_component;
	//UVM registration macro
	`uvm_component_utils(report_monitor);
	
	uvm_analysis_imp#(command_s, report_monitor) analysis_export;
	
	function new (string name, uvm_component parent);
      super.new(name,parent);
	  analysis_export  = new("analysis_export",this);
    endfunction
	
	//Function: build_phase
	//Build phase
	 function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	 endfunction : build_phase
	 
	 //Function: write
	 //Define this function so it get an argument which type is struct "command_s"
	 function void write(command_s cmd);	
		//Call of the function report
	 endfunction : write
	 
	 //The arguments are operands A,B and operation op
	 function void ggg(byte A, byte B, operation_t op);
		//Report with function $display which operands and operation are in use

	 endfunction: ggg
	 
    function shortint predict_result(byte A, byte B, operation_t op); 

	endfunction : predict_result
	
endclass : report_monitor