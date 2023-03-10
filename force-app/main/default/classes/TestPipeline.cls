@isTest
public class TestPipeline {

    @testSetup
    static void dataCreation() {
    
    	//arrange
                      
        Pipeline__c testPipeline = new Pipeline__c(Name='Upload pipeline');

        insert testPipeline;
        
        
        List<PipelineFilter__c> pipelineFilterList = new List<PipelineFilter__c>();
        
       	pipelineFilterList.add(new PipelineFilter__c(Name = 'getter'
                                                    ,Pipeline__c = testPipeline.Id
                                                    ,Order__c	= 0));
        pipelineFilterList.add(new PipelineFilter__c(Name = 'composer'
                                                   	,Pipeline__c = testPipeline.Id
                                                   	,Order__c	= 1));
        pipelineFilterList.add(new PipelineFilter__c(Name = 'sender'
                                                    ,Pipeline__c = testPipeline.Id
                                                    ,Order__c	= 2));
    	insert pipelineFilterList;
    }
 
    @isTest
    static void processNegative(){

       	List<Boolean> exceptions = new List<Boolean>();
        
        Pipeline uploadPipeline	= new Pipeline();
       
        Test.startTest();
        try{
        	uploadPipeline.process();
        }catch(Pipeline.AWException awe){
           if(awe.getMessage().equalsIgnoreCase('Null at the pilace of the first Filter')){
            exceptions.add(true);          
        	}
        }
        Test.stopTest();       
       
        system.assertNotEquals(null, exceptions, 'expected at least one exception to have occured');
          
        for(Boolean b : exceptions){
          system.assert(b, 'Account should have thrown an exception');
        }
        
    }
  
    @isTest
    static void processPositive(){
        
        for(Pipeline__c pipelineObj : [SELECT Id FROM Pipeline__c]){
            
            
            Pipeline pipelineInst = PipelineFactory.createPipeline(pipelineObj);
            
            //act
            Test.startTest();
            	pipelineInst.process();
            Test.stopTest();
        }
       
        
    }    
    
    @isTest
    static void getFirstFilterPositive(){
        for(Pipeline__c pipelineObj : [SELECT Id FROM Pipeline__c]){
                       
            Pipeline pipelineInst = PipelineFactory.createPipeline(pipelineObj);
            
            //act
            Test.startTest();
            	FilterAbstract firstFilter = pipelineInst.getFirstFilter();
            Test.stopTest();
            
            //assert
            System.Assert.isNotNull(firstFilter, 'Pipline factory returned NULL as first filter');
        }
       
    }
}