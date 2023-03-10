@isTest
public class TestCreateUploadQueueRecord {

    @isTest
    static void TestDeleteAccountWithOneOpportunity(){
        
        //arrange
        Account acct = new Account(Name='Test Account');
        
        //act
		Test.startTest();
       
        Database.SaveResult result = Database.insert(acct);
        
		Test.stopTest();
        
        //assert
        System.assert(result.isSuccess());
        
        List<UploadQueue__c> QueryList = [SELECT 
                                              ObjectId__c, 
                                              ObjectType__c 
                                          FROM 
                                              UploadQueue__c 
                                          WHERE 
                                              ObjectId__c = :acct.id];
              
        System.assert(QueryList.size()==1);
        System.assert(QueryList[0].ObjectType__c==((SObject)acct).getSObjectType().getDescribe().getName()+'');
      
   }

}