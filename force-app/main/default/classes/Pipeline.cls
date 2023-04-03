public class Pipeline{

    public class PiplelineException extends exception{}

    protected filterAbstract firstFilter = null;
    public UploadSettings__c uploadSettings;

    public void addFilter(FilterAbstract filter){
        
		System.debug('Adding filter '+ filter);
        
      	If (firstFilter == null){
            
  			System.debug('Redy to fill firstFilter with '+ filter);
           	this.firstFilter = filter;
            
   			System.debug('Returning from addFilter() ' + this);
           	return;           
        }
        
        FilterAbstract lastFilter = firstFilter;
          
    	System.debug('lastFilter:' + lastFilter);
     	//System.debug('lastFilter.nextFilter(null):' + lastFilter.nextFilter(null));
       
        while(lastFilter.nextFilter(null) != null){
            
           lastFilter	= lastFilter.nextFilter(null); 
        }
        
        lastFilter.nextFilter(filter);
    }
    public void process(){
    
        if (firstFilter == null) {
            
            throw new PiplelineException('Null at the pilace of the first Filter');
            
        }
        
        MessageStruct Message 	= new MessageStruct();
        Message.pipeline	= this;
        
        firstFilter.setup(Message);
        firstFilter.process(Message);

    }
    public filterAbstract getFirstFilter(){
        return firstFilter;
    }
}