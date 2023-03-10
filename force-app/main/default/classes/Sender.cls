public class Sender extends FilterAbstract{
 
    public override void setup(MessageStruct Message){}

    public override void process(MessageStruct Message){
                
        this.proceed(Message);

    }

}