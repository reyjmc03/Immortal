package 
{
    import flash.display.*;
    import flash.geom.*;

    public class RastrMovieClip extends Sprite
    {
        private var isPause:Boolean = false;
        private var firstBmpFrame:BmpFrame;
        private var currentBmpFrame:BmpFrame;
        private var prevFrame:int = 0;
        private var curFrame:int = 0;
        private var curFrameNumber:Number = 0;
        public var animSpeed:Number = 1;
        public var totalFrames:int = 0;
        public var mcBounds:Rectangle;
        private var sr:Rectangle;
        private var dp:Point;

        public function RastrMovieClip()
        {
            this.sr = new Rectangle();
            this.dp = new Point();
            return;
        }// end function

        public function get currentFrame() : int
        {
            return (this.curFrame + 1);
        }// end function

        public function get currentLabel() : String
        {
            return this.currentBmpFrame.label;
        }// end function

        public function initialize() : void
        {
            this.curFrame = 0;
            this.currentBmpFrame = this.firstBmpFrame;
            return;
        }// end function

        public function stop() : void
        {
            this.isPause = true;
            return;
        }// end function

        public function play() : void
        {
            this.isPause = false;
            return;
        }// end function

        public function gotoAndPlay(param1:int) : void
        {
            this.isPause = false;
            this.setFrame((param1 - 1));
            return;
        }// end function

        public function gotoAndStop(param1:int) : void
        {
            this.isPause = true;
            this.setFrame((param1 - 1));
            return;
        }// end function

        public function setFrame(param1:int) : void
        {
            if (param1 < 0)
            {
                param1 = 0;
            }
            if (param1 > (this.totalFrames - 1))
            {
                param1 = this.totalFrames - 1;
            }
            if (this.curFrame > param1)
            {
                this.curFrame = 0;
                this.currentBmpFrame = this.firstBmpFrame;
            }
            while (this.curFrame < param1)
            {
                
                this.nextFrame();
            }
            this.prevFrame = param1;
            this.curFrameNumber = param1;
            return;
        }// end function

        private function nextFrame() : void
        {
            var _loc_1:String = this;
            var _loc_2:* = this.curFrame + 1;
            _loc_1.curFrame = _loc_2;
            if (this.curFrame >= this.totalFrames)
            {
                this.curFrame = 0;
                this.prevFrame = 0;
                this.curFrameNumber = 0;
            }
            this.currentBmpFrame = this.currentBmpFrame.nextFrame;
            return;
        }// end function

        public function update(param1:BitmapData) : void
        {
            if (this.currentBmpFrame.bmpData)
            {
                this.dp.x = x + this.currentBmpFrame.x + 400;
                this.dp.y = y + this.currentBmpFrame.y + 250;
                if (parent)
                {
                    this.dp.x = this.dp.x + parent.x;
                    this.dp.y = this.dp.y + parent.y;
                }
                this.sr.width = this.currentBmpFrame.bmpData.width;
                this.sr.height = this.currentBmpFrame.bmpData.height;
                param1.copyPixels(this.currentBmpFrame.bmpData, this.sr, this.dp, null, null, true);
            }
            if (this.isPause)
            {
                return;
            }
            this.curFrameNumber = this.curFrameNumber + this.animSpeed;
            this.curFrame = Math.floor(this.curFrameNumber);
            if (this.curFrame != this.prevFrame)
            {
                this.prevFrame = this.curFrame;
                this.nextFrame();
            }
            return;
        }// end function

        public function addFrame(param1:MovieClip, param2:Rectangle = null) : void
        {
            var _loc_4:Matrix = null;
            var _loc_5:BitmapData = null;
            param1.x = 0;
            param1.y = 0;
            var _loc_3:* = new BmpFrame();
            if (param1.width != 0 && param1.height != 0)
            {
                _loc_4 = param1.transform.matrix.clone();
                if (!param2)
                {
                    param2 = param1.getRect(param1);
                }
                if (param2.x != Math.floor(param2.x))
                {
                    param2.x = Math.floor(param2.x);
                    (param2.width + 1);
                }
                if (param2.y != Math.floor(param2.y))
                {
                    param2.y = Math.floor(param2.y);
                    (param2.height + 1);
                }
                param2.width = Math.ceil(param2.width);
                param2.height = Math.ceil(param2.height);
                _loc_4.translate(-param2.left, -param2.top);
                _loc_5 = new BitmapData(param2.width, param2.height, true, 16777215);
                _loc_5.draw(param1, _loc_4, param1.transform.colorTransform);
                _loc_3.bmpData = _loc_5;
                _loc_3.x = param2.left;
                _loc_3.y = param2.top;
                _loc_3.label = param1.currentLabel;
            }
            if (this.totalFrames == 0)
            {
                this.firstBmpFrame = _loc_3;
            }
            if (this.currentBmpFrame)
            {
                this.currentBmpFrame.nextFrame = _loc_3;
            }
            _loc_3.nextFrame = this.firstBmpFrame;
            this.currentBmpFrame = _loc_3;
            var _loc_6:String = this;
            var _loc_7:* = this.totalFrames + 1;
            _loc_6.totalFrames = _loc_7;
            return;
        }// end function

        public function clone() : RastrMovieClip
        {
            var _loc_1:* = new RastrMovieClip();
            _loc_1.mcBounds = this.mcBounds;
            _loc_1.firstBmpFrame = this.firstBmpFrame;
            _loc_1.currentBmpFrame = this.firstBmpFrame;
            _loc_1.totalFrames = this.totalFrames;
            return _loc_1;
        }// end function

        public function dispose() : void
        {
            this.mcBounds = null;
            this.dp = null;
            this.sr = null;
            return;
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

