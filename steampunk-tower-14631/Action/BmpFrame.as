package 
{
    import flash.display.*;

    public class BmpFrame extends Object
    {
        public var x:Number = 0;
        public var y:Number = 0;
        public var bmpData:BitmapData = null;
        public var label:String;
        public var nextFrame:BmpFrame;

        public function BmpFrame()
        {
            return;
        }// end function

        public function clone() : BmpFrame
        {
            var _loc_1:* = new BmpFrame();
            _loc_1.x = this.x;
            _loc_1.y = this.y;
            _loc_1.label = this.label;
            if (this.bmpData)
            {
                _loc_1.bmpData = this.bmpData;
            }
            return _loc_1;
        }// end function

    }
}

class BmpFrame extends Object
{
    public var x:Number = 0;
    public var y:Number = 0;
    public var bmpData:BitmapData = null;
    public var label:String;

    function BmpFrame()
    {
        return;
    }// end function

}

