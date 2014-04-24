package 
{
    import Bullet.*;
    import BulletMachineGun.*;
    import flash.geom.*;

    public class BulletMachineGun extends Bullet
    {
        protected var speed:Number = 70;
        public var velocity:Point;
        protected var targetPoint:Point;
        private var radius:Number = 0;
        private var isFreeFly:Boolean = false;
        private var isMiss:Boolean = false;
        private var nextCollision:Boolean = false;

        public function BulletMachineGun()
        {
            this.targetPoint = new Point();
            return;
        }// end function

        override public function initialize(param1:Enemy, param2:Cannon, param3:Point, param4:Number, param5:Boolean, param6:Boolean) : void
        {
            super.initialize(param1, param2, param3, param4, param5, param6);
            if (!this.isFreeFly)
            {
                this.targetPoint.x = param1.levelX;
                this.targetPoint.y = param1.levelY;
            }
            mc = new McMachineGunBullet();
            param2.level.addChild(mc);
            var _loc_7:* = param2.level.globalToLocal(param3);
            mc.x = _loc_7.x;
            mc.y = _loc_7.y;
            var _loc_8:* = new Point(param1.globalX, param1.globalY);
            var _loc_9:* = Utilites.AngleBetweenPoints(param3, _loc_8) + 180;
            mc.rotation = _loc_9;
            isFireUp = Math.random() <= Upgrades.machineGun.fireUp + param2.modifers.fireUp;
            this.velocity.normalize(this.speed);
            return;
        }// end function

        override public function update() : void
        {
            var _loc_1:Number = NaN;
            var _loc_2:int = 0;
            var _loc_3:Enemy = null;
            var _loc_4:Number = NaN;
            if (!this.isMiss && !this.isFreeFly)
            {
                if (this.nextCollision || target.collisionToRadius(mc.x, mc.y, 0))
                {
                    this.onCollision();
                    return;
                }
                _loc_1 = Utilites.DistBetweenPoints(mc.x, mc.y, this.targetPoint.x, this.targetPoint.y);
                if (_loc_1 < this.speed)
                {
                    this.velocity.normalize(_loc_1);
                    this.nextCollision = true;
                }
            }
            mc.x = mc.x + this.velocity.x;
            mc.y = mc.y + this.velocity.y;
            if (mc.x > 450 || mc.x < -450 || mc.y > 300 || mc.y < -300)
            {
                if (target)
                {
                    target.preHealth = target.preHealth + damage;
                }
                dispose();
            }
            if (this.isMiss)
            {
                return;
            }
            if (!this.isFreeFly)
            {
            }
            else
            {
                _loc_2 = cannon.level.enemies.length - 1;
                while (_loc_2 >= 0)
                {
                    
                    _loc_3 = cannon.level.enemies[_loc_2];
                    if (_loc_3.alive)
                    {
                        _loc_4 = _loc_3 is Airplane ? (this.radius) : (0);
                        if (_loc_3.collisionToRadius(mc.x, mc.y, _loc_4))
                        {
                            target = _loc_3;
                            this.onCollision();
                            break;
                        }
                    }
                    _loc_2 = _loc_2 - 1;
                }
            }
            return;
        }// end function

        override public function onCollision() : Boolean
        {
            var _loc_1:Number = NaN;
            var _loc_2:Number = NaN;
            if (super.onCollision())
            {
                this.addRicoshet();
                dispose();
                return true;
            }
            this.isMiss = true;
            if (target.isAir == false && !(target is Unit1) && !(target is Unit2))
            {
                this.addRicoshet();
                mc.rotation = 0;
                _loc_1 = mc.width;
                _loc_2 = mc.rotation - Utilites.randomNumber(30, 70);
                if (target.scaleX == -1)
                {
                    _loc_2 = _loc_2 - 90;
                }
                mc.rotation = _loc_2;
                this.velocity = Utilites.directionFromAngle(_loc_2);
                this.velocity.normalize(_loc_1);
                mc.x = mc.x + this.velocity.x;
                mc.y = mc.y + this.velocity.y;
            }
            this.velocity.normalize(this.speed);
            return false;
        }// end function

        private function addRicoshet() : void
        {
            var _loc_1:RastrMovieClip = null;
            if (target is Unit1 || target is Unit2 || this.isMiss && target.isAir == false)
            {
                _loc_1 = Main.rastFactory.getMovieClip("Ricoshet1Small");
            }
            else
            {
                _loc_1 = Main.rastFactory.getMovieClip("Ricoshet1");
            }
            _loc_1.x = mc.x - target.x;
            _loc_1.y = mc.y - target.y;
            target.addEffect(_loc_1, _loc_1.totalFrames);
            return;
        }// end function

    }
}
