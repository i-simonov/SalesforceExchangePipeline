public class PipelineFactory {
    
    public static Pipeline createPipeline(Pipeline__c pipelineObj){
        
        Pipeline pipelineInstance = new Pipeline();
        
        for (PipelineFilter__c PipelineFilter : [SELECT 
                                                 	P.Id, 
                                                 	P.Name 
                                                 FROM PipelineFilter__c AS P 
                                                 WHERE P.Pipeline__c  = :pipelineObj.id 
                                                 	AND P.Active__c = True
                                                ]
            ){
		
            Type t = Type.forName(PipelineFilter.Name);
            FilterAbstract filter = (FilterAbstract)t.newInstance();
                
 			System.debug('Redy to add filter '+ filter);
           	pipelineInstance.addFilter(filter);
        }      
           
        System.debug('Returning from createPipeline()');
		return pipelineInstance;
              
        
    } 

}