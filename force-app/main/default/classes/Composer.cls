public class Composer extends FilterAbstract{
    
    public override void setup(MessageStruct Message){}

    public override void process(MessageStruct Message){
              
        system.debug('Yep! You are inside composer! Congrats!');
        
        this.proceed(Message);
    }

}