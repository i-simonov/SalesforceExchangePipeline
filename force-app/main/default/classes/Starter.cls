public class Starter {
	
    public void Start(Pipeline__c piplineObj){

        Pipeline PipelineInts	=  PipelineFactory.createPipeline(piplineObj);
 
        System.debug('Redy to process pipeline' + PipelineInts);
       	
        PipelineInts.process();
       
    }  
 
}