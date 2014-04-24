package 
{
    import Cannon.*;
    import CannonElectroGun.*;
    import flash.geom.*;

    public class CannonElectroGun extends Cannon
    {
        public static var price:int = 8000;

        public function CannonElectroGun()
        {
            return;
        }// end function

        override public function get speed() : Number
        {
            return _speed + Upgrades.lightning.speed * _speed;
        }// end function

        override protected function generateDamage() : void
        {
            damage = Utilites.randomInt(minDmg, maxDmg);
            damage = damage + Math.ceil(damage * Upgrades.lightning.damage);
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
            upgr1 = [100, 8000, "6-10", 1800, 30, 10000, 230, 110];
            upgr2 = [100, 14000, "10-20", 1600, 35, 10000, 230, 400];
            upgr3_1 = [100, 24000, "28-38", 1400, 45, 10000, 230, 1800];
            upgr4_1 = [100, 32000, "40-55", 1300, 50, 10000, 230, 4000];
            upgr3_2 = [100, 25000, "25-35", 1600, 40, 10000, 230, 1800];
            upgr4_2 = [100, 33000, "38-48", 1400, 45, 10000, 230, 4000];
            modifers1 = {shock:0.04, chain:2};
            modifers2 = {shock:0.08, chain:2};
            modifers3_1 = {shock:0.09, chain:3};
            modifers4_1 = {shock:0.1, chain:4};
            modifers3_2 = {shock:0.25, chain:2};
            modifers4_2 = {shock:0.35, chain:3};
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            type = 4;
            mcCannon = new ElectroGun();
            xOffsets = [22, 22, 22, 22, 15, 15];
            deafultBulletPoints = [new Point(30, -7), new Point(32, -7), new Point(25, -8), new Point(27, -9.4), new Point(48.7, -8), new Point(48.4, -8)];
            super.initialize(param1);
            totalMoney = price;
            return;
        }// end function

        override protected function shoot() : void
        {
            var _loc_1:BulletElectroGun2 = null;
            var _loc_2:Point = null;
            var _loc_3:BulletElectroGun1 = null;
            if (curEnemy)
            {
                if (upgradeInd == 4 || upgradeInd == 5)
                {
                    _loc_1 = new BulletElectroGun2();
                    _loc_2 = getBulletPos();
                    _loc_1.initialize(curEnemy, this, _loc_2, getDamage(), isCrit, true);
                    _loc_1.initializeTargets(this, curEnemy);
                    _loc_1.counter = modifers.chain + Upgrades.lightning.chain;
                }
                else
                {
                    _loc_3 = new BulletElectroGun1();
                    _loc_2 = getBulletPos();
                    _loc_3.initialize(curEnemy, this, _loc_2, getDamage(), isCrit, true);
                    _loc_3.initializeTargets(this, curEnemy);
                    _loc_3.counter = modifers.chain + Upgrades.lightning.chain;
                }
                this.playShootSound();
            }
            return;
        }// end function

        private function playShootSound() : void
        {
            var _loc_1:String = "";
            var _loc_2:Number = 0.5;
            var _loc_3:int = 0;
            if (upgradeInd == 0 || upgradeInd == 1 || upgradeInd == 2 || upgradeInd == 3)
            {
                _loc_3 = Utilites.randomInt(1, 2);
                if (_loc_3 == 1)
                {
                    _loc_1 = "snd_lightning1_shoot1";
                }
                if (_loc_3 == 2)
                {
                    _loc_1 = "snd_lightning1_shoot2";
                }
            }
            if (upgradeInd == 4 || upgradeInd == 5)
            {
                _loc_1 = "snd_lightning2_shoot1";
            }
            SoundManager.playOnce(_loc_1, _loc_2);
            return;
        }// end function

    }
}
