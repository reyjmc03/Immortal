package 
{
    import __AS3__.vec.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;

    public class RastrMovieClip2 extends Object
    {
        public var rastrCostume:Sprite;
        private var bmpCostume:Bitmap;
        private var bmpFrames:Vector.<BmpFrame>;
        private var currentBmpFrame:BmpFrame;
        private var isPause:Boolean;
        public var currentFrame:int = 0;
        public var totalFrames:int = 1;
        private var bounds:Rectangle;

        public function RastrMovieClip2()
        {
            this.bounds = new Rectangle();
            return;
        }// end function

        public function get currentLabel() : String
        {
            return this.currentBmpFrame.label;
        }// end function

        public function initialize(param1:MovieClip, param2:Rectangle = null) : void
        {
            var _loc_3:* = param1.stage.quality;
            param1.stage.quality = "HIGH";
            this.totalFrames = param1.totalFrames;
            this.rasterize(param1, param2);
            this.rastrCostume.addEventListener(Event.ENTER_FRAME, this.update);
            param1.stage.quality = _loc_3;
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

        public function nextFrame() : void
        {
            var _loc_1:String = this;
            var _loc_2:* = this.currentFrame + 1;
            _loc_1.currentFrame = _loc_2;
            if (this.currentFrame >= this.totalFrames)
            {
                this.currentFrame = 0;
            }
            this.setFrame(this.currentFrame);
            return;
        }// end function

        public function gotoAndStop(param1:int) : void
        {
            this.currentFrame = param1 - 1;
            if (this.currentFrame < 0)
            {
                this.currentFrame = 0;
            }
            if (this.currentFrame > (this.totalFrames - 1))
            {
                this.currentFrame = this.totalFrames - 1;
            }
            this.isPause = true;
            this.setFrame(this.currentFrame);
            return;
        }// end function

        private function update(event:Event) : void
        {
            if (this.isPause)
            {
                return;
            }
            var _loc_2:String = this;
            var _loc_3:* = this.currentFrame + 1;
            _loc_2.currentFrame = _loc_3;
            if (this.currentFrame >= this.totalFrames)
            {
                this.currentFrame = 0;
            }
            this.setFrame(this.currentFrame);
            return;
        }// end function

        private function setFrame(param1:int) : void
        {
            this.currentFrame = param1;
            this.currentBmpFrame = this.bmpFrames[this.currentFrame];
            this.bmpCostume.bitmapData = this.currentBmpFrame.bmpData;
            this.bmpCostume.x = this.currentBmpFrame.x;
            this.bmpCostume.y = this.currentBmpFrame.y;
            return;
        }// end function

        private function rasterize(param1:MovieClip, param2:Rectangle) : void
        {
            var _loc_4:BmpFrame = null;
            var _loc_5:int = 0;
            this.bmpCostume = new Bitmap(null, PixelSnapping.AUTO, true);
            this.rastrCostume = new Sprite();
            this.rastrCostume.addChild(this.bmpCostume);
            this.rastrCostume.name = param1.name;
            this.rastrCostume.blendMode = param1.blendMode;
            this.rastrCostume.filters = param1.filters;
            this.rastrCostume.x = param1.x;
            this.rastrCostume.y = param1.y;
            param1.x = 0;
            param1.y = 0;
            param1.filters = [];
            this.bmpFrames = new Vector.<BmpFrame>;
            param1.gotoAndStop(1);
            var _loc_3:int = 1;
            while (_loc_3 <= param1.totalFrames)
            {
                
                _loc_4 = this.createRastFromVector(param1, param2);
                this.bmpFrames.push(_loc_4);
                param1.nextFrame();
                _loc_5 = 0;
                while (_loc_5 < param1.numChildren)
                {
                    
                    if (param1.getChildAt(_loc_5) is MovieClip)
                    {
                        MovieClip(param1.getChildAt(_loc_5)).nextFrame();
                    }
                    _loc_5++;
                }
                _loc_3++;
            }
            this.bmpCostume.bitmapData = this.bmpFrames[0].bmpData;
            this.bmpCostume.x = this.bmpFrames[0].x;
            this.bmpCostume.y = this.bmpFrames[0].y;
            param1.x = this.rastrCostume.x;
            param1.y = this.rastrCostume.y;
            param1.gotoAndPlay(1);
            param1.visible = false;
            param1.filters = this.rastrCostume.filters;
            return;
        }// end function

        private function createRastFromVector(param1:MovieClip, param2:Rectangle) : BmpFrame
        {
            if (param1.width == 0 || param1.height == 0)
            {
                return new BmpFrame();
            }
            var _loc_3:* = param1.transform.matrix.clone();
            if (!param2)
            {
                this.bounds = param1.getRect(param1.parent);
            }
            else
            {
                this.bounds.x = param2.x;
                this.bounds.y = param2.y;
                this.bounds.width = param2.width;
                this.bounds.height = param2.height;
            }
            this.bounds.x = Math.floor(this.bounds.x);
            this.bounds.y = Math.floor(this.bounds.y);
            this.bounds.width = Math.floor((this.bounds.width + 1));
            this.bounds.height = Math.floor((this.bounds.height + 1));
            _loc_3.translate(-this.bounds.left, -this.bounds.top);
            var _loc_4:* = new BitmapData(this.bounds.width, this.bounds.height, true, 0);
            new BitmapData(this.bounds.width, this.bounds.height, true, 0).draw(param1, _loc_3, param1.transform.colorTransform);
            var _loc_5:* = new BmpFrame();
            new BmpFrame().bmpData = _loc_4;
            _loc_5.x = this.bounds.left;
            _loc_5.y = this.bounds.top;
            _loc_5.label = param1.currentFrameLabel;
            return _loc_5;
        }// end function

        public function gotoAndPlay(param1:String) : void
        {
            var _loc_2:int = 0;
            while (_loc_2 < this.bmpFrames.length)
            {
                
                if (this.bmpFrames[_loc_2].label == param1)
                {
                    this.currentFrame = _loc_2;
                    return;
                }
                _loc_2++;
            }
            return;
        }// end function

        public function dispose()
        {
            this.rastrCostume.removeEventListener(Event.ENTER_FRAME, this.update);
            this.rastrCostume = null;
            this.currentBmpFrame = null;
            this.bmpCostume.bitmapData.dispose();
            this.bmpCostume = null;
            var _loc_1:int = 0;
            while (_loc_1 < this.bmpFrames.length)
            {
                
                this.bmpFrames[_loc_1].bmpData.dispose();
                _loc_1++;
            }
            this.bmpFrames = null;
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

