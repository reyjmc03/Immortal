package 
{

    public class Upgrade extends Object
    {
        public var price:int = 0;
        public var modifer:Object;
        public var title:String;
        public var description:String;
        public var shortDesc:String;

        public function Upgrade(param1:int, param2:Object, param3:String, param4:String, param5:String)
        {
            this.modifer = {};
            this.price = param1;
            this.modifer = param2;
            this.title = param3;
            this.description = param5;
            this.shortDesc = param4;
            return;
        }// end function

    }
}
