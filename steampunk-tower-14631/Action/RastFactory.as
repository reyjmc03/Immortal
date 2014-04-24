package 
{
    import __AS3__.vec.*;
    import flash.display.*;
    import flash.events.*;

    public class RastFactory extends Object
    {
        private var mcs:Vector.<MovieClip>;
        private var rasters:Vector.<RastrMovieClip>;
        private var names:Vector.<String>;
        private var framesCount:Vector.<int>;
        private var elapsedFrames:int = 0;
        private var totalFrames:int = 0;

        public function RastFactory()
        {
            this.mcs = new Vector.<MovieClip>;
            this.rasters = new Vector.<RastrMovieClip>;
            this.names = new Vector.<String>;
            this.framesCount = new Vector.<int>;
            return;
        }// end function

        public function getProgress() : Number
        {
            if (this.totalFrames == 0)
            {
                return 0;
            }
            return this.elapsedFrames / this.totalFrames;
        }// end function

        public function addMovieClip(param1:MovieClip, param2:String, param3:int = -1) : void
        {
            this.mcs.push(param1);
            this.names.push(param2);
            if (param3 == -1)
            {
                param3 = param1.totalFrames;
            }
            this.framesCount.push(param3);
            return;
        }// end function

        public function startRender() : void
        {
            var _loc_2:MovieClip = null;
            this.totalFrames = 0;
            this.elapsedFrames = 0;
            var _loc_1:int = 0;
            while (_loc_1 < this.mcs.length)
            {
                
                _loc_2 = this.mcs[_loc_1];
                this.totalFrames = this.totalFrames + this.framesCount[_loc_1];
                this.processMc(_loc_2);
                _loc_1++;
            }
            return;
        }// end function

        public function getMovieClip(param1:String) : RastrMovieClip
        {
            var _loc_2:* = this.names.indexOf(param1);
            var _loc_3:* = this.rasters[_loc_2].clone();
            return _loc_3;
        }// end function

        private function processMc(param1:MovieClip) : void
        {
            var _loc_2:* = new RastrMovieClip();
            _loc_2.mcBounds = param1.getBounds(param1);
            this.rasters.push(_loc_2);
            param1.addEventListener(Event.ENTER_FRAME, this.update);
            return;
        }// end function

        private function update(event:Event) : void
        {
            var _loc_4:String = this;
            var _loc_5:* = this.elapsedFrames + 1;
            _loc_4.elapsedFrames = _loc_5;
            var _loc_2:* = event.target as MovieClip;
            var _loc_3:* = this.mcs.indexOf(_loc_2);
            this.rasters[_loc_3].addFrame(_loc_2);
            var _loc_4:* = this.framesCount;
            var _loc_5:* = _loc_3;
            var _loc_6:* = this.framesCount[_loc_3] - 1;
            _loc_4[_loc_5] = _loc_6;
            if (this.framesCount[_loc_3] <= 0)
            {
                _loc_2.removeEventListener(Event.ENTER_FRAME, this.update);
            }
            if (this.elapsedFrames >= this.totalFrames)
            {
                this.mcs.splice(0, this.mcs.length);
            }
            return;
        }// end function

    }
}
