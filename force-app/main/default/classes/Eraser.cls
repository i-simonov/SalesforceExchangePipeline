public class Eraser extends FilterAbstract{
    
    public override void setup(MessageStruct Message){}

    public override void process(MessageStruct Message){
        
        delete Message.GetChangeList();
        
 
        
        List<UploadQueue__c> ChangeList = [SELECT ObjectId__c, ObjectType__c, Message__c, Recipient__c, TimeStamp__c FROM UploadQueue__c ORDER BY TimeStamp__c];
       
        system.debug(ChangeList.size());
       	
        this.proceed(Message);
    }

}