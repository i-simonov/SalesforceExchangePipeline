public with sharing class Starter {
 
    public class StarterException extends exception{}

    @AuraEnabled(cacheable=false)
    public static void Start(Pipeline__c pipelineObj){

        try{
            
            Pipeline PipelineInts	=  PipelineFactory.createPipeline(pipelineObj);
     
            System.debug('Redy to process pipeline' + PipelineInts);
            
            PipelineInts.process();
        }
        catch(Exception e) {
           System.debug('Exception cathed');
           throw new StarterException(e.getMessage());
        } finally {
           //System.debug('exception finally block');
        }
    }  
 
}