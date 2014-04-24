package 
{
    import Bullet.*;
    import BulletElectroGun2.*;
    import flash.display.*;
    import flash.geom.*;

    public class BulletElectroGun2 extends Bullet
    {
        private var dmgChain1:Number = 0.5;
        private var dmgChain2:Number = 0.25;
        private var dmgChain3:Number = 0.1;
        protected var speed:Number = 20;
        public var velocity:Point;
        private var makeCollision:Boolean = false;
        public var counter:Number = 1;
        public var radius:Number = 100;
        public var chainInd:int = 1;
        public var shockedEnemies:Array;
        private var fromMc:MovieClip;
        private var toMc:MovieClip;
        private var fromP:Point;
        private var toP:Point;

        public function BulletElectroGun2()
        {
            this.velocity = new Point();
            this.shockedEnemies = new Array();
            this.fromP = new Point();
            this.toP = new Point();
            return;
        }// end function

        override public function initialize(param1:Enemy, param2:Cannon, param3:Point, param4:Number, param5:Boolean, param6:Boolean) : void
        {
            super.initialize(param1, param2, param3, param4, param5, param6);
            this.toP.x = param1.levelX;
            this.toP.y = param1.levelY;
            mc = new Lightning2();
            mc.stop();
            param2.level.addChild(mc);
            this.fromP = param2.level.globalToLocal(param3);
            mc.x = this.fromP.x;
            mc.y = this.fromP.y;
            this.shockedEnemies.push(param1);
            isShockUp = Math.random() < Upgrades.lightning.shock + param2.modifers.shock;
            return;
        }// end function

        public function initializeTargets(param1:MovieClip, param2:MovieClip, param3:Point = null) : void
        {
            this.fromMc = param1;
            this.toMc = param2;
            if (param3 != null)
            {
                this.fromP = param3;
            }
            return;
        }// end function

        private function hitNext() : void
        {
            var _loc_1:Enemy = null;
            var _loc_2:BulletElectroGun2 = null;
            var _loc_3:Point = null;
            var _loc_4:Number = NaN;
            var _loc_5:String = this;
            var _loc_6:* = this.counter - 1;
            _loc_5.counter = _loc_6;
            if (this.counter > 0)
            {
                _loc_1 = cannon.level.getNearestEnemy(target, this.radius, this.shockedEnemies);
                if (_loc_1)
                {
                    _loc_2 = new BulletElectroGun2();
                    _loc_2.chainInd = this.chainInd + 1;
                    _loc_2.counter = this.counter;
                    _loc_2.shockedEnemies = this.shockedEnemies;
                    _loc_3 = cannon.level.localToGlobal(new Point(target.levelX, target.levelY));
                    _loc_4 = damage;
                    if (_loc_2.chainInd == 2)
                    {
                        _loc_4 = _loc_4 * this.dmgChain1;
                    }
                    else if (_loc_2.chainInd == 3)
                    {
                        _loc_4 = _loc_4 * this.dmgChain2;
                    }
                    else if (_loc_2.chainInd == 4)
                    {
                        _loc_4 = _loc_4 * this.dmgChain3;
                    }
                    _loc_4 = Math.ceil(_loc_4);
                    _loc_2.initialize(_loc_1, cannon, _loc_3, _loc_4, false, false);
                    _loc_2.initializeTargets(target, _loc_1, this.toP.clone());
                }
            }
            return;
        }// end function

        override public function update() : void
        {
            var _loc_2:AutoRemoveObject = null;
            super.update();
            if (this.makeCollision)
            {
                if (target && target.alive)
                {
                    this.hitNext();
                }
                this.onCollision();
                _loc_2 = new AutoRemoveObject(mc);
                mc.gotoAndPlay(2);
                dispose();
                return;
            }
            this.fromP.x = mc.x;
            this.fromP.y = mc.y;
            if (target.alive)
            {
                this.toP.x = target.levelX;
                this.toP.y = target.levelY;
            }
            this.velocity.x = this.toP.x - this.fromP.x;
            this.velocity.y = this.toP.y - this.fromP.y;
            var _loc_1:* = this.velocity.length;
            if (_loc_1 < this.speed)
            {
                this.makeCollision = true;
                this.velocity.normalize(_loc_1);
            }
            else
            {
                this.velocity.normalize(this.speed);
            }
            mc.x = mc.x + this.velocity.x;
            mc.y = mc.y + this.velocity.y;
            return;
        }// end function

        override public function onCollision() : Boolean
        {
            if (this.chainInd == 1)
            {
                target.shockKof = 1;
            }
            else if (this.chainInd == 2)
            {
                target.shockKof = 0.5;
            }
            else if (this.chainInd == 3)
            {
                target.shockKof = 0.25;
            }
            else if (this.chainInd == 4)
            {
                target.shockKof = 0.1;
            }
            return super.onCollision();
        }// end function

    }
}
