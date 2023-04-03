public abstract class FilterAbstract implements FilterInterface{
 	
    protected FilterAbstract nextFilter = null; 
    protected boolean mayProcess = false;
    protected boolean mayProceed = true;
        
    public virtual void setup(MessageStruct Message){
        this.mayProcess = true;
    }
    public virtual void process(MessageStruct Message){
    
        if(!this.mayProcess){proceed(Message);}

        if(!this.mayProceed){return;}
        proceed(Message);
    }   
    public virtual void proceed(MessageStruct Message){
        
        if (nextFilter == null){
            return;
        } 
        
        nextFilter.setup(Message);
        nextFilter.process(Message);

    }
    public FilterAbstract nextFilter(FilterAbstract filter){
        if (filter != null){
            nextFilter = filter;
        }
        return nextFilter;
    }    
}