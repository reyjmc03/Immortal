package 
{
    import Bullet.*;
    import flash.display.*;
    import flash.geom.*;

    public class BulletElectroGun1 extends Bullet
    {
        private var dmgChain1:Number = 0.5;
        private var dmgChain2:Number = 0.5;
        private var dmgChain3:Number = 0.5;
        public var counter:Number = 1;
        public var radius:Number = 100;
        public var chainInd:int = 1;
        private var targetPoint:Point;
        public var shockedEnemies:Array;
        private var fromMc:MovieClip;
        private var toMc:MovieClip;
        private var fromP:Point;
        private var toP:Point;

        public function BulletElectroGun1()
        {
            this.shockedEnemies = new Array();
            this.fromP = new Point();
            this.toP = new Point();
            return;
        }// end function

        override public function initialize(param1:Enemy, param2:Cannon, param3:Point, param4:Number, param5:Boolean, param6:Boolean) : void
        {
            var _loc_7:AutoRemoveObject = null;
            super.initialize(param1, param2, param3, param4, param5, param6);
            mc = new Lightning1();
            _loc_7 = new AutoRemoveObject(mc);
            param2.level.addChild(mc);
            this.targetPoint = new Point(param1.levelX, param1.levelY);
            var _loc_8:* = param3;
            var _loc_9:* = new Point(param1.globalX, param1.globalY);
            this.fromP = _loc_8;
            this.toP = _loc_9;
            mc.width = Utilites.DistBetweenPoints(_loc_8.x, _loc_8.y, _loc_9.x, _loc_9.y);
            var _loc_10:* = Utilites.AngleBetweenPoints(_loc_8, _loc_9);
            mc.rotation = _loc_10;
            var _loc_11:* = param2.level.globalToLocal(_loc_8);
            mc.x = _loc_11.x;
            mc.y = _loc_11.y;
            mc.scaleY = mc.scaleX;
            mc.scaleX = mc.scaleX * -1;
            _loc_7.onComplete = this.onCollision;
            this.shockedEnemies.push(param1);
            isShockUp = Math.random() < Upgrades.lightning.shock + param2.modifers.shock;
            return;
        }// end function

        public function initializeTargets(param1:MovieClip, param2:MovieClip, param3:Point = null) : void
        {
            this.fromMc = param1;
            this.toMc = param2;
            this.fromP = param3;
            return;
        }// end function

        private function hitNext() : void
        {
            var _loc_1:Enemy = null;
            var _loc_2:BulletElectroGun1 = null;
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
                    _loc_2 = new BulletElectroGun1();
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
            var _loc_3:RastrMovieClip = null;
            super.update();
            if (this.fromMc is Cannon)
            {
                this.fromP = Cannon(this.fromMc).getBulletPos();
            }
            else if (this.fromMc is Enemy && Enemy(this.fromMc).alive)
            {
                this.fromP.x = Enemy(this.fromMc).globalX;
                this.fromP.y = Enemy(this.fromMc).globalY;
            }
            if (target.alive)
            {
                this.toP.x = target.globalX;
                this.toP.y = target.globalY;
            }
            mc.rotation = 0;
            mc.width = Utilites.DistBetweenPoints(this.fromP.x, this.fromP.y, this.toP.x, this.toP.y);
            var _loc_1:* = Utilites.AngleBetweenPoints(this.fromP, this.toP);
            mc.rotation = _loc_1;
            var _loc_2:* = cannon.level.globalToLocal(this.fromP);
            mc.x = _loc_2.x;
            mc.y = _loc_2.y;
            mc.scaleY = mc.scaleX;
            mc.scaleX = mc.scaleX * -1;
            if (mc.currentFrame == 1)
            {
                this.hitNext();
                this.onCollision();
            }
            if (mc.currentFrame == mc.totalFrames)
            {
                if (target.alive)
                {
                    _loc_3 = Main.rastFactory.getMovieClip("RicoshetElectro");
                    target.addEffect(_loc_3, _loc_3.totalFrames);
                }
                dispose();
            }
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
