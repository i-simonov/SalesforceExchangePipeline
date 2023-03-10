trigger CreateChangeObject on Account (after update, after insert) {

    for(Account accRecord : Trigger.new){
        
        String JSONAccount = JSON.serialize(accRecord);
        
        UploadQueue__c accountChange	= new UploadQueue__c(ObjectId__c 		= accRecord.id
                                                              ,ObjectType__c	= ((SObject)accRecord).getSObjectType().getDescribe().getName()+''
                                                              ,Message__c 		= JSONAccount
                                                              ,Recipient__c 	= '1C' 
                                                              ,TimeStamp__c		= System.currentTimeMillis());
         
        insert accountChange;
    }
    
}