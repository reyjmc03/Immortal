package 
{
    import __AS3__.vec.*;

    public class WaveGroup extends Object
    {
        public var manager:LevelManager;
        private var waves:Vector.<Wave>;
        private var createdWaves:int = 0;
        public var endTime:int = 0;
        public var pause:int = 0;

        public function WaveGroup(param1:LevelManager) : void
        {
            this.manager = param1;
            this.waves = new Vector.<Wave>;
            return;
        }// end function

        public function dispose() : void
        {
            var _loc_1:int = 0;
            if (this.waves)
            {
                _loc_1 = 0;
                while (_loc_1 < this.waves.length)
                {
                    
                    this.waves[_loc_1].dispose();
                    _loc_1++;
                }
            }
            this.waves = null;
            this.manager = null;
            return;
        }// end function

        public function initialize(param1:XML) : void
        {
            var _loc_2:XML = null;
            var _loc_3:Wave = null;
            if (param1.attribute("pause") != undefined)
            {
                this.pause = parseFloat(param1.attribute("pause")) * 1000;
            }
            for each (_loc_2 in param1.wave)
            {
                
                _loc_3 = new Wave(this);
                _loc_3.initialize(_loc_2);
                this.waves.push(_loc_3);
            }
            return;
        }// end function

        public function showFirstWaveIcons() : void
        {
            var _loc_1:int = 0;
            while (_loc_1 < this.waves.length)
            {
                
                this.waves[_loc_1].createInfoImgFirst();
                _loc_1++;
            }
            return;
        }// end function

        public function onWaveCreated() : void
        {
            var _loc_1:int = 0;
            var _loc_2:Wave = null;
            var _loc_3:String = this;
            var _loc_4:* = this.createdWaves + 1;
            _loc_3.createdWaves = _loc_4;
            if (this.allWavesCreated())
            {
                this.endTime = Level.gameTime;
                _loc_1 = 0;
                while (_loc_1 < this.waves.length)
                {
                    
                    _loc_2 = this.waves[_loc_1];
                    if (_loc_2.endTime > this.endTime)
                    {
                        this.endTime = _loc_2.endTime;
                    }
                    _loc_1++;
                }
            }
            this.manager.startWaves();
            return;
        }// end function

        private function allWavesCreated() : Boolean
        {
            return this.createdWaves >= this.waves.length;
        }// end function

        public function isTimeEnded() : Boolean
        {
            return this.allWavesCreated() && this.endTime <= Level.gameTime;
        }// end function

        public function isEnded() : Boolean
        {
            if (!this.allWavesCreated())
            {
                return false;
            }
            var _loc_1:int = 0;
            while (_loc_1 < this.waves.length)
            {
                
                if (!this.waves[_loc_1].isEnded())
                {
                    return false;
                }
                _loc_1++;
            }
            if (this.endTime <= Level.gameTime)
            {
                return true;
            }
            return true;
        }// end function

        public function update() : void
        {
            var _loc_1:int = 0;
            while (_loc_1 < this.waves.length)
            {
                
                this.waves[_loc_1].update();
                _loc_1++;
            }
            return;
        }// end function

    }
}
