public interface FilterInterface {
    void setup(MessageStruct Message);
    void process(MessageStruct Message);
    void proceed(MessageStruct Message);
}