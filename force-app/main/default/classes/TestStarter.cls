@isTest
public class TestStarter {

    @testSetup
    static void dataCreation() {
    
    	//arrange
        Account acct = new Account(Name='Test Account');       
        Database.insert(acct);
 
        Account acct2 = new Account(Name='Test Account2');
        Database.insert(acct2);
                     
        Pipeline__c testPipeline = new Pipeline__c(Name='Upload pipeline');

        insert testPipeline;
        
        
        List<PipelineFilter__c> pipelineFilterList = new List<PipelineFilter__c>();
        
       	pipelineFilterList.add(new PipelineFilter__c(Name = 'getter'
                                                    ,Pipeline__c = testPipeline.Id
                                                    ,Order__c	= 0));
       	pipelineFilterList.add(new PipelineFilter__c(Name = 'converter'
                                                    ,Pipeline__c = testPipeline.Id
                                                    ,Order__c	= 1));
        pipelineFilterList.add(new PipelineFilter__c(Name = 'composer'
                                                   	,Pipeline__c = testPipeline.Id
                                                   	,Order__c	= 2));
        pipelineFilterList.add(new PipelineFilter__c(Name = 'sender'
                                                    ,Pipeline__c = testPipeline.Id
                                                    ,Order__c	= 3));
        pipelineFilterList.add(new PipelineFilter__c(Name = 'eraser2'
                                                    ,Pipeline__c = testPipeline.Id
                                                    ,Order__c	= 4));
    	insert pipelineFilterList;
    }

    @isTest
    public static void StarPositive(){
        
        for(Pipeline__c pipelineObj : [SELECT Id FROM Pipeline__c]){
            
            test.startTest();
            	starter.Start(pipelineObj);
            test.stopTest();
           
            
        }

        
    }
}