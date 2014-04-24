package 
{
    import Airplane.*;
    import Enemy.*;
    import __AS3__.vec.*;
    import flash.display.*;
    import flash.geom.*;

    public class Airplane extends Enemy
    {
        private var shootFrames:Array;
        private static var offsets:Vector.<Point> = new Vector.<Point>;

        public function Airplane()
        {
            this.shootFrames = [36, 39, 42, 45, 48, 51];
            health = 20;
            minDamage = 0.2;
            maxDamage = 0.4;
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            infoName = "Airplane";
            armor = 0;
            money = 900;
            modifers.lightAdd = 20;
            modifers.gunIgnore = 30;
            collideRadiuses.push(new CollideRadius(this, 0, 0, 10));
            collideRadiuses.push(new CollideRadius(this, 15, 0, 10));
            mcName = "AirplaneMc";
            super.initialize(param1);
            walk1 = 1;
            walk2 = mcEnemy.totalFrames;
            healthY = -23;
            healthW = 50;
            speed = -4 * scaleX;
            stopX = -470 * scaleX;
            fireEffect = "FireAirplane";
            shockEffect = "ShockAirplane";
            y = (-(param1.tower.floorsCount - 1)) * Cell.HEIGHT + Utilites.randomNumber(-25, 25);
            isAir = true;
            line = param1.tower.floorsCount - 1;
            selectRct = new Rectangle(2.75, 12.4, 49.45, 11.55);
            return;
        }// end function

        override protected function fireUp() : void
        {
            return;
        }// end function

        override protected function shockUp() : void
        {
            return;
        }// end function

        override public function getForward() : Number
        {
            return x + (offsets[(mcEnemy.currentFrame - 1)].x + forwardOffset) * scaleX;
        }// end function

        override public function get levelX() : Number
        {
            return x + offsets[(mcEnemy.currentFrame - 1)].x * scaleX;
        }// end function

        override public function get levelY() : Number
        {
            return y + offsets[(mcEnemy.currentFrame - 1)].y;
        }// end function

        override public function update() : void
        {
            super.update();
            if (mcEnemy.currentFrame == mcEnemy.totalFrames)
            {
                mcEnemy.stop();
                this.changeDirection();
            }
            if (this.shootFrames.indexOf(mcEnemy.currentFrame) > -1)
            {
                shoot();
            }
            return;
        }// end function

        override protected function updateAnimation() : void
        {
            return;
        }// end function

        override protected function updateMove() : void
        {
            return;
        }// end function

        override protected function drawEffects() : void
        {
            var _loc_1:* = effects.length - 1;
            while (_loc_1 >= 0)
            {
                
                if (effectsTimer[_loc_1] <= 0)
                {
                    removeEffect(effects[_loc_1]);
                }
                else
                {
                    effects[_loc_1].x = offsets[(mcEnemy.currentFrame - 1)].x * scaleX + collideRadiuses[0].localPos.x;
                    effects[_loc_1].y = offsets[(mcEnemy.currentFrame - 1)].y + collideRadiuses[0].localPos.y;
                    effects[_loc_1].update(level.bitmap.bitmapData);
                    var _loc_2:* = effectsTimer;
                    var _loc_3:* = _loc_1;
                    var _loc_4:* = effectsTimer[_loc_1] - 1;
                    _loc_2[_loc_3] = _loc_4;
                }
                _loc_1 = _loc_1 - 1;
            }
            return;
        }// end function

        private function changeDirection() : void
        {
            side = side == "left" ? ("right") : ("left");
            removeChild(mcEnemy);
            mcEnemy = Main.rastFactory.getMovieClip("AirplaneMc-" + side);
            mcEnemy.initialize();
            addChild(mcEnemy);
            x = x * -1;
            line = level.tower.floorsCount - 1;
            return;
        }// end function

        override protected function createDieEffect() : void
        {
            var _loc_1:RastrMovieClip = null;
            _loc_1 = Main.rastFactory.getMovieClip("Explode2");
            _loc_1.x = this.levelX;
            _loc_1.y = this.levelY;
            level.addEffect(_loc_1);
            return;
        }// end function

        public static function initCoords() : void
        {
            var _loc_3:MovieClip = null;
            var _loc_4:Point = null;
            var _loc_1:* = new AirplaneMc();
            _loc_1 = _loc_1.container;
            var _loc_2:int = 1;
            while (_loc_2 <= _loc_1.totalFrames)
            {
                
                _loc_1.gotoAndStop(_loc_2);
                _loc_3 = _loc_1.getChildByName("body") as MovieClip;
                _loc_4 = _loc_3.localToGlobal(new Point(40, 10));
                offsets.push(_loc_4);
                _loc_2++;
            }
            return;
        }// end function

    }
}
