public class Starter {
	
    public static void Start(Pipeline__c pipelineObj){

        Pipeline PipelineInts	=  PipelineFactory.createPipeline(pipelineObj);
 
        System.debug('Redy to process pipeline' + PipelineInts);
       	
        PipelineInts.process();
       
    }  
 
}