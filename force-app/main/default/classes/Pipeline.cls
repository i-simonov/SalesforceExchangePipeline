public class Pipeline {

    private filterAbstract firstFilter = null;

    public void addFilter(FilterAbstract filter){
        
		System.debug('Adding filter '+ filter);
        
      	If (firstFilter == null){
            
  			System.debug('Redy to fill firstFilter with '+ filter);
           	this.firstFilter = filter;
            
   			System.debug('Returning from addFilter() ' + this);
           	return;           
        }
        
        FilterAbstract lastFilter = firstFilter;
          
        while(lastFilter.nextFilter(null) != null){
            
           lastFilter	= lastFilter.nextFilter(filter); 
        }
        
        lastFilter.nextFilter(filter);
    }
    public void process(){
    
        if (firstFilter == null) {
            
            System.debug('Ups, null at the first Filter');
            return;
        }
        MessageStruct Message = new MessageStruct();
        
        firstFilter.setup(Message);
        firstFilter.process(Message);

    }

}