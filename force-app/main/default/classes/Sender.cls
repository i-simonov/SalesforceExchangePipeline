public class Sender extends FilterAbstract{
    
    public override void setup(MessageStruct Message){}

    public override void process(MessageStruct Message){
                   
        Messaging.SingleEmailMessage messageMail = new Messaging.SingleEmailMessage();
        
        messageMail.toAddresses 	= new String[] {Message.pipeline.UploadSettings.Email__c};
        messageMail.optOutPolicy 	= 'FILTER';
        messageMail.subject 		= 'Upload test by Simonov';
        messageMail.plainTextBody 	= Message.GetMessage();
        
        Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {messageMail};
        Messaging.SendEmailResult[] results 	= Messaging.sendEmail(messages);
        
        if (results[0].success) 
        {
            System.debug('The email was sent successfully.');
        } else 
        {
            System.debug('The email failed to send: ' + results[0].errors[0].message);
        }
        
        this.proceed(Message);
   }

    
    
}