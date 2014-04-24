package 
{
    import flash.geom.*;

    public class Cell extends Object
    {
        public var state:int = 0;
        public var connectUp:Boolean = false;
        public var connectRight:Boolean = false;
        public var connectDown:Boolean = false;
        public var connectLeft:Boolean = false;
        public var tower:Tower;
        public var pos:Point;
        public var col:int = 0;
        public var row:int = 0;
        public static const WIDTH:Number = 60.5;
        public static const HEIGHT:Number = 50;

        public function Cell(param1:Tower)
        {
            this.pos = new Point();
            this.tower = param1;
            return;
        }// end function

        public function dispose() : void
        {
            this.tower = null;
            this.pos = null;
            return;
        }// end function

    }
}
