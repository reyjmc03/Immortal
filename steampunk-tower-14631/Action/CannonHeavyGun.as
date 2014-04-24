package 
{
    import Cannon.*;
    import CannonHeavyGun.*;
    import fl.motion.*;
    import flash.geom.*;

    public class CannonHeavyGun extends Cannon
    {
        private var dtAng:Number = 30;
        private var radius:Number = 50;
        public static var price:int = 10000;

        public function CannonHeavyGun()
        {
            return;
        }// end function

        override public function get distance() : Number
        {
            return _distance + Upgrades.heavyGun.dist;
        }// end function

        override public function get bullets() : int
        {
            return _bullets + Upgrades.heavyGun.bullets;
        }// end function

        public function getSplashDamage() : int
        {
            return modifers.splash + modifers.splash * Upgrades.heavyGun.splash;
        }// end function

        override protected function generateDamage() : void
        {
            damage = Utilites.randomInt(minDmg, maxDmg);
            damage = damage + Math.ceil(damage * Upgrades.heavyGun.damage);
            isCrit = getIsCrit();
            if (isCrit)
            {
                damage = damage * 2;
            }
            damage = damage - curEnemy.armor;
            if (damage < 0)
            {
                damage = 0;
            }
            if (curEnemy)
            {
                curEnemy.preHealth = curEnemy.preHealth - damage;
            }
            return;
        }// end function

        override public function initializeData() : void
        {
            upgr1 = [100, 10000, "8-14", 2500, 30, 12000, 220, 110];
            upgr2 = [100, 15000, "20-35", 2500, 35, 12000, 220, 400];
            upgr3_1 = [100, 26000, "45-80", 2200, 40, 12000, 240, 2000];
            upgr4_1 = [100, 35000, "70-100", 2000, 50, 12000, 260, 4000];
            upgr3_2 = [100, 28000, "30-55", 2000, 40, 12000, 240, 2000];
            upgr4_2 = [100, 38000, "50-75", 1800, 50, 12000, 250, 4000];
            modifers1 = {splash:5, fireUp:0.02};
            modifers2 = {splash:7, fireUp:0.03};
            modifers3_1 = {splash:10, fireUp:0.05};
            modifers4_1 = {splash:15, fireUp:0.05};
            modifers3_2 = {splash:30, fireUp:0.1};
            modifers4_2 = {splash:35, fireUp:0.2};
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            type = 2;
            mcCannon = new HeavyGun();
            xOffsets = [20, 24, 24, 24, 24, 25];
            deafultBulletPoints = [new Point(24.1, -6), new Point(40.1, -4.9), new Point(45, -12.5), new Point(40, -9.5), new Point(36.4, -12), new Point(42.3, -12.8)];
            super.initialize(param1);
            totalMoney = price;
            return;
        }// end function

        override protected function updateRotation() : void
        {
            var _loc_1:Matrix = null;
            var _loc_2:Point = null;
            if (cell.col == 1)
            {
                rotateToZero();
            }
            else
            {
                if (!curEnemy || !curEnemy.alive && state != 0)
                {
                    curEnemy = null;
                    findEnemy();
                }
                if (curEnemy)
                {
                    _loc_1 = new Matrix(1, 0, 0, 1, curEnemy.globalX, curEnemy.globalY);
                    _loc_2 = mcCannon.turr.twr.localToGlobal(Utilites.ZERO_POINT);
                    MatrixTransformer.rotateAroundExternalPoint(_loc_1, _loc_2.x, _loc_2.y, this.dtAng * (-mcCannon.scaleX));
                    rotateToPoint(_loc_1.tx, _loc_1.ty, rotationSpeed);
                    if (targetAngle < minAng || targetAngle > maxAng)
                    {
                        curEnemy = null;
                    }
                }
                else
                {
                    rotateToZero();
                }
            }
            return;
        }// end function

        override protected function shoot() : void
        {
            var _loc_1:BulletHeavyGun = null;
            var _loc_2:Point = null;
            if (curEnemy)
            {
                _loc_1 = new BulletHeavyGun();
                _loc_2 = getBulletPos();
                _loc_1.initialize(curEnemy, this, _loc_2, getDamage(), isCrit, true);
                _loc_1.radius = this.radius;
                _loc_1.splashDamage = this.getSplashDamage();
                this.playShootSound();
            }
            return;
        }// end function

        private function playShootSound() : void
        {
            var _loc_1:String = "";
            var _loc_2:Number = 0.4;
            var _loc_3:int = 0;
            if (upgradeInd == 0 || upgradeInd == 1 || upgradeInd == 2 || upgradeInd == 3)
            {
                _loc_1 = "snd_heavygun1_shoot1";
            }
            if (upgradeInd == 4 || upgradeInd == 5)
            {
                _loc_3 = Utilites.randomInt(1, 2);
                if (_loc_3 == 1)
                {
                    _loc_1 = "snd_heavygun2_shoot1";
                }
                if (_loc_3 == 2)
                {
                    _loc_1 = "snd_heavygun2_shoot2";
                }
            }
            SoundManager.playOnce(_loc_1, _loc_2);
            return;
        }// end function

    }
}
