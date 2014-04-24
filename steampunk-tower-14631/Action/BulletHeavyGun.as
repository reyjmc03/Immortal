package 
{
    import Bullet.*;
    import BulletHeavyGun.*;
    import flash.geom.*;

    public class BulletHeavyGun extends Bullet
    {
        protected var time:Number = 1000;
        protected var counter:Number = 0;
        protected var p0:Point;
        protected var p1:Point;
        protected var p2:Point;
        protected var p1_minus_p0:Point;
        protected var p2_minus_p1:Point;
        public var radius:Number;
        public var splashDamage:Number;
        public var isWalker:Boolean = false;

        public function BulletHeavyGun()
        {
            return;
        }// end function

        override public function initialize(param1:Enemy, param2:Cannon, param3:Point, param4:Number, param5:Boolean, param6:Boolean) : void
        {
            super.initialize(param1, param2, param3, param4, param5, param6);
            this.isWalker = param1 is Walker1 || param1 is Walker2;
            this.p0 = param2.level.globalToLocal(param3);
            if (this.isWalker)
            {
                this.p2 = new Point(param1.levelX, param1.levelY);
            }
            else
            {
                this.p2 = new Point(param1.x, param1.getBottom() - 10);
            }
            this.p1 = new Point();
            var _loc_7:* = param2.mcCannon.turr.twr.rotation / Utilites.DEG_TO_RAD;
            var _loc_8:* = (this.p2.x - this.p0.x) / 2;
            var _loc_9:* = Math.tan(_loc_7) * _loc_8;
            _loc_9 = Math.tan(_loc_7) * _loc_8 * param2.getScaleX();
            this.p1.x = this.p0.x + _loc_8;
            this.p1.y = this.p0.y + _loc_9;
            this.p1_minus_p0 = this.p1.subtract(this.p0);
            this.p2_minus_p1 = this.p2.subtract(this.p1);
            var _loc_10:* = Utilites.DistBetweenPoints(this.p0.x, this.p0.y, this.p2.x, this.p2.y);
            this.time = 200 + _loc_10 * 2;
            mc = new McHeavyGunBullet();
            param2.level.addChild(mc);
            mc.x = this.p0.x;
            mc.y = this.p0.y;
            if (param2.mcCannon.scaleX == 1)
            {
                mc.rotation = 180;
            }
            isFireUp = Math.random() <= Upgrades.heavyGun.fireUp;
            return;
        }// end function

        override public function update() : void
        {
            this.counter = this.counter + Level.deltaTime;
            var _loc_1:* = this.counter / this.time;
            var _loc_2:* = this.p0.x + this.p1_minus_p0.x * _loc_1;
            var _loc_3:* = this.p0.y + this.p1_minus_p0.y * _loc_1;
            var _loc_4:* = this.p1.x + this.p2_minus_p1.x * _loc_1;
            var _loc_5:* = this.p1.y + this.p2_minus_p1.y * _loc_1;
            var _loc_6:* = _loc_2 + (_loc_4 - _loc_2) * _loc_1;
            var _loc_7:* = _loc_3 + (_loc_5 - _loc_3) * _loc_1;
            var _loc_8:* = Utilites.AngleBetweenPoints3(mc.x, mc.y, _loc_6, _loc_7);
            mc.rotation = _loc_8;
            mc.x = _loc_6;
            mc.y = _loc_7;
            if (Utilites.DistBetweenPoints(mc.x, mc.y, this.p2.x, this.p2.y) < 5 || this.counter > this.time)
            {
                this.onCollision();
            }
            return;
        }// end function

        override public function onCollision() : Boolean
        {
            var _loc_3:RastrMovieClip = null;
            var _loc_4:Enemy = null;
            var _loc_5:Number = NaN;
            var _loc_6:Number = NaN;
            SoundManager.playHeavyGunExp();
            if (this.isWalker)
            {
                _loc_3 = Main.rastFactory.getMovieClip("Explode2");
                _loc_3.x = mc.x - 20 * target.scaleX;
                _loc_3.y = mc.y;
                cannon.level.addEffect(_loc_3);
            }
            else
            {
                if (cannon.upgradeInd == 4 || cannon.upgradeInd == 5)
                {
                    _loc_3 = Main.rastFactory.getMovieClip("Ricoshet2Big");
                }
                else
                {
                    _loc_3 = Main.rastFactory.getMovieClip("Ricoshet2");
                }
                _loc_3.x = mc.x;
                _loc_3.y = mc.y;
                cannon.level.addEffect(_loc_3);
            }
            var _loc_1:* = cannon.level.getEnemiesInRadius(mc.x, mc.y, this.radius);
            var _loc_2:int = 0;
            while (_loc_2 < _loc_1.length)
            {
                
                _loc_4 = _loc_1[_loc_2];
                if (_loc_4 != target)
                {
                    _loc_5 = Utilites.DistBetweenPoints(mc.x, mc.y, _loc_4.x, _loc_4.y);
                    _loc_6 = this.splashDamage;
                    _loc_6 = _loc_6 + Math.abs(damage - this.splashDamage) * (1 - _loc_5 / this.radius);
                    if (_loc_6 < 0)
                    {
                        _loc_6 = 0;
                    }
                    _loc_4.hit(_loc_6, this, false, false, false);
                }
                _loc_2++;
            }
            target.hit(damage, this, isFireUp, isShockUp, isCritical);
            if (addExp)
            {
                cannon.addExperience(damage);
            }
            dispose();
            return true;
        }// end function

    }
}
