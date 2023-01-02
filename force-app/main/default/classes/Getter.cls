public class Getter extends FilterAbstract{
    
    
    public override void setup(MessageStruct Message){}

    public override void process(MessageStruct Message){
            
        List<sObject> ChangeList = [SELECT Object__c, Message__c, Recipient__c, TimeStamp__c FROM AccountQueue__c ORDER BY TimeStamp__c];
    
        system.debug(ChangeList);
        
        this.proceed(Message);
    }
        
}