public abstract class FilterAbstract implements FilterInterface{
 	
    protected FilterAbstract nextFilter = null; 
     
    public abstract void setup(MessageStruct Message);
    public abstract void process(MessageStruct Message);
    
    public FilterAbstract nextFilter(FilterAbstract filter){
        if (filter != null){
            nextFilter = filter;
        }
        return nextFilter;
    }
    
    public void proceed(MessageStruct Message){
        
        if (nextFilter == null){
            return;
        } 
        
        nextFilter.setup(Message);
        nextFilter.process(Message);

    }
}