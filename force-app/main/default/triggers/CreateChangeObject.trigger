trigger CreateChangeObject on Account (after update, after insert) {

    for(Account accRecord : Trigger.new){
        
        String JSONAccount = JSON.serialize(accRecord);
        
        AccountQueue__c accountChange	= new AccountQueue__c(Object__c 		= accRecord.id
                                                                                ,Message__c 	= JSONAccount
                                                                                ,Recipient__c 	= '1C' 
                                                                                ,TimeStamp__c	= System.currentTimeMillis());
         
        insert accountChange;
    }
    
}