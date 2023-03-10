@isTest
public class TestPipelineFactory {
	
	//private static List<Filter__c> filterList = new List<Filter__c>();
        
    @testSetup
    static void dataCreation() {
    
    	//arrange
           
        //List<Filter__c> filterList = new List<Filter__c>();
        
        //filterList.add(new Filter__c(Name = 'starter'));
        //filterList.add(new Filter__c(Name = 'getter'));
        //filterList.add(new Filter__c(Name = 'composer'));
        
        //insert filterList; 
        
        
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
    static void createPipelinePositive(){
    	
        for(Pipeline__c pipelineObj : [SELECT Id FROM Pipeline__c]){
            
            //act
            Test.startTest();
            
            	Pipeline pipelineInst = PipelineFactory.createPipeline(pipelineObj);
            
            Test.stopTest();
 
            //assert
            System.Assert.isNotNull(pipelineInst					, 'Pipline factory returned NULL');
            System.Assert.isNotNull(pipelineInst.getFirstFilter()	, 'Pipline factory returned NULL but first filter');
            
            If (pipelineInst!=null && pipelineInst.getFirstFilter()!=null){
                
                FilterAbstract firstFilter 		= pipelineInst.getFirstFilter();
                FilterAbstract currentFilter	= firstFilter.nextFilter(null);
                
                integer filterCount = 1;
                
                while(currentFilter!=null){
                    
                    System.debug('currentFilter: ' 	+ currentFilter);
                    System.debug('nextFilter: ' 	+ currentFilter.nextFilter(null));
                    
                    filterCount++;
                    currentFilter	= currentFilter.nextFilter(null);
                    
                }
                
                System.Assert.areEqual([SELECT id FROM PipelineFilter__c].size(), filterCount, 'unexpected filterList size');
            }
      }
        
    }
    
    @isTest
    static void processPipelinePositive(){
        
        for(Pipeline__c pipelineObj : [SELECT Id FROM Pipeline__c]){
            
            
            Pipeline pipelineInst = PipelineFactory.createPipeline(pipelineObj);
            
            //act
            Test.startTest();
            	pipelineInst.process();
            Test.stopTest();
        }
    }

}