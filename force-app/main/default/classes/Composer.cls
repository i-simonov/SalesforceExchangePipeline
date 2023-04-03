public class Composer extends FilterAbstract{
    
    public override void setup(MessageStruct Message){}

    public override void process(MessageStruct Message){
              
        List<String> MessageList = new List<String>{};

        for (UploadQueue__c UploadQueueRecord : Message.GetChangeList()) {
        
            MessageList.add((String)UploadQueueRecord.Message__c);

        }
       
 		Message.PutMessage(JSON.serialize(MessageList));
         
        this.proceed(Message);
   }

}