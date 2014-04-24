package 
{
    import __AS3__.vec.*;
    import flash.display.*;
    import flash.geom.*;

    public class EyeRayRastr extends Sprite
    {
        private const bWidth:Number = 600;
        private const bHeight:Number = 30;
        private var rect:Rectangle;
        private var rectSrc:Rectangle;
        private var frames:Vector.<BitmapData>;
        private var bmp:Bitmap;
        private var curFrame:int = 0;

        public function EyeRayRastr()
        {
            this.frames = new Vector.<BitmapData>;
            this.bmp = new Bitmap(new BitmapData(this.bWidth, this.bHeight, true, 0), "auto", true);
            return;
        }// end function

        public function initialize() : void
        {
            var _loc_3:BitmapData = null;
            var _loc_1:* = new EyeLine();
            _loc_1.width = this.bWidth;
            _loc_1.height = 25;
            _loc_1.x = 0;
            _loc_1.y = 15;
            _loc_1.rotation = 0;
            this.rect = new Rectangle(0, 0, this.bWidth, this.bHeight);
            this.rectSrc = new Rectangle(0, 0, this.bWidth, this.bHeight);
            var _loc_2:int = 1;
            while (_loc_2 <= _loc_1.totalFrames)
            {
                
                _loc_1.gotoAndStop(_loc_2);
                _loc_3 = new BitmapData(this.bWidth, this.bHeight, true, 0);
                _loc_3.draw(_loc_1, _loc_1.transform.matrix, _loc_1.transform.colorTransform, null, null, true);
                this.frames.push(_loc_3);
                _loc_2++;
            }
            _loc_1 = null;
            blendMode = BlendMode.ADD;
            this.bmp.y = (-this.bHeight) / 2;
            addChild(this.bmp);
            return;
        }// end function

        public function draw(param1:Number) : void
        {
            this.rectSrc.width = param1;
            this.bmp.bitmapData.fillRect(this.rect, 0);
            this.bmp.bitmapData.copyPixels(this.frames[this.curFrame], this.rectSrc, Utilites.ZERO_POINT);
            var _loc_2:String = this;
            var _loc_3:* = this.curFrame + 1;
            _loc_2.curFrame = _loc_3;
            if (this.curFrame >= this.frames.length)
            {
                this.curFrame = 0;
            }
            return;
        }// end function

        public function dispose() : void
        {
            this.rect = null;
            this.rectSrc = null;
            var _loc_1:int = 0;
            while (_loc_1 < this.frames.length)
            {
                
                this.frames[_loc_1].dispose();
                _loc_1++;
            }
            this.frames = null;
            this.bmp.bitmapData.dispose();
            this.bmp = null;
            return;
        }// end function

    }
}
