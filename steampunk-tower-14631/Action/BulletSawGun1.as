package 
{
    import BulletSawGun1.*;
    import flash.display.*;
    import flash.geom.*;

    public class BulletSawGun1 extends Bullet
    {
        protected var speed:Number = 30;
        public var velocity:Point;
        protected var targetPoint:Point;
        public var type:int = 1;
        private var radius:Number = 0;
        private var isFreeFly:Boolean = false;
        private var isMiss:Boolean = false;
        private var isRecAdded:Boolean = false;

        public function BulletSawGun1()
        {
            this.targetPoint = new Point();
            return;
        }// end function

        override public function initialize(param1:Enemy, param2:Cannon, param3:Point, param4:Number, param5:Boolean, param6:Boolean) : void
        {
            super.initialize(param1, param2, param3, param4, param5, param6);
            this.isFreeFly = !param1 || param1.isAir;
            if (param1 && param1.isAir)
            {
                param1.preHealth = param1.preHealth + param4;
            }
            if (!this.isFreeFly)
            {
                this.targetPoint.x = param1.levelX;
                this.targetPoint.y = param1.levelY;
            }
            if (this.type == 1)
            {
                this.radius = 13;
                mc = new Saw1();
            }
            else
            {
                this.radius = 20;
                mc = new Saw2();
            }
            param2.level.addChild(mc);
            var _loc_7:* = param2.level.globalToLocal(param3);
            mc.x = _loc_7.x;
            mc.y = _loc_7.y;
            this.velocity.normalize(this.speed);
            mc.rotation = Math.atan2(this.velocity.y, this.velocity.x) / Utilites.RAD_TO_DEG - 90;
            return;
        }// end function

        override public function update() : void
        {
            var _loc_1:Number = NaN;
            var _loc_2:int = 0;
            var _loc_3:Enemy = null;
            var _loc_4:Number = NaN;
            mc.x = mc.x + this.velocity.x;
            mc.y = mc.y + this.velocity.y;
            if (mc.x > 450 || mc.x < -450 || mc.y > 300 || mc.y < -300)
            {
                if (target)
                {
                    target.preHealth = target.preHealth + damage;
                }
                dispose();
                return;
            }
            if (this.isMiss)
            {
                return;
            }
            if (!this.isFreeFly)
            {
                _loc_1 = Utilites.DistBetweenPoints(mc.x, mc.y, this.targetPoint.x, this.targetPoint.y);
                if (_loc_1 < this.speed)
                {
                    this.onCollision();
                }
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
            if (super.onCollision())
            {
                if (target.isAir)
                {
                    target.preHealth = target.preHealth - damage;
                }
                this.addRicoshet();
                dispose();
                return true;
            }
            else
            {
                this.isMiss = true;
            }
            return false;
        }// end function

        private function addRicoshet() : void
        {
            var _loc_2:MovieClip = null;
            if (this.isRecAdded || (target is Unit1 || target is Unit2) && !target.alive)
            {
                return;
            }
            this.isRecAdded = true;
            var _loc_1:* = mc.parent.getChildIndex(mc);
            if (target is Unit1 || target is Unit2 || target is Parashutist)
            {
                _loc_2 = new SawRicoshet1();
            }
            else
            {
                _loc_2 = new SawRicoshet2();
            }
            _loc_2.x = mc.x;
            _loc_2.y = mc.y;
            var _loc_3:* = new AutoRemoveObject(_loc_2);
            mc.parent.addChildAt(_loc_2, _loc_1);
            _loc_2.rotation = Math.atan2(this.velocity.y, this.velocity.x) / Utilites.RAD_TO_DEG - 90;
            return;
        }// end function

    }
}
