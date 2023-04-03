public class MessageStruct{

    protected String Message;
    protected List<UploadQueue__c> ChangeList;
    public Pipeline pipeline;
    
    public void PutMessage(String Message){
        this.Message = Message;
    }
    public String GetMessage(){
        return this.Message;
    }
    public void PutChangeList(List<UploadQueue__c> ChangeList){
        this.ChangeList = ChangeList;
    }
    public List<UploadQueue__c> GetChangeList(){
        return this.ChangeList;
    }
       
}